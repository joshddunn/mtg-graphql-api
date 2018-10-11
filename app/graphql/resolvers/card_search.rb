# frozen_string_literal: true

require 'search_object/plugin/graphql'

# graphql card search resolver
module Resolvers
  # mtg card search
  class CardSearch
    include SearchObject.module(:graphql)
    description 'Returns paginated information about magic cards.'

    scope { Card.all }

    type Types::CardConnectionType

    CardFilter = GraphQL::InputObjectType.define do
      name 'CardFilter'

      argument :OR, -> { types[CardFilter] },
               description: 'Allows you to chain multiple card filters.'

      argument :name, types.String,
               description: 'Allows you to search for a magic card by name.'

      argument :nameLike, types.String,
               description: 'Allows you to search for a magic card ' \
                            'similar to a name.'

      argument :type, types.String,
               description: 'Allows you to search for a magic card by type.'

      argument :subtype, types.String,
               description: 'Allows you to search for a magic card by subtype.'

      argument :supertype, types.String,
               description: 'Allows you to search for a magic card ' \
                            'by supertype.'
    end

    option :filter, type: CardFilter, with: :apply_filter,
                    description: 'Returns nodes that satisfy the filter ' \
                                 'arguments.'

    option :order, type: types[types.String], with: :apply_order,
                   description: 'Returns nodes ordered by the specified field.'

    def apply_filter(scope, value)
      branches = normalize_filters(value).reduce { |a, b| a.or(b) }
      scope.merge branches
    end

    def apply_order(scope, value)
      value.each do |v|
        scope = scope.order(v)
      end
      scope
    end

    def normalize_filters(value, branches = [])
      scope = Card.all

      scope = scope.where('lower(name) = ?', value['name'].downcase) unless value['name'].nil?
      scope = scope.where('lower(name) like ?', "#{value['nameLike'].gsub(/\%/,"")}%") unless value['nameLike'].nil?
      scope = scope.includes(:types).where('types.identifier': value['type']) unless value['type'].nil?
      scope = scope.includes(:subtypes).where('subtypes.identifier': value['subtype']) unless value['subtype'].nil?
      scope = scope.includes(:supertypes).where('supertypes.identifier': value['supertype']) unless value['supertype'].nil?

      branches << scope

      value['OR'].reduce(branches) { |s, v| normalize_filters(v, s) } if value['OR'].present?

      branches
    end
  end
end
