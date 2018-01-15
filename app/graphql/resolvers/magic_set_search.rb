require 'search_object/plugin/graphql'

class Resolvers::MagicSetSearch
  include SearchObject.module(:graphql)

  scope { MagicSet.all }

  type Types::MagicSetConnectionType

  MagicSetFilter = GraphQL::InputObjectType.define do
    name 'MagicSetFilter'

    argument :OR, -> { types[MagicSetFilter] }

    argument :name, types.String
  end

  option :filter, type: MagicSetFilter, with: :apply_filter
  option :order, type: types[types.String], with: :apply_order

  def apply_filter(scope, value)
    branches = normalize_filters(value).reduce { |a,b| a.or(b) }
    scope.merge branches
  end

  def apply_order(scope, value)
    value.each do |v|
      scope = scope.order(v)
    end
    scope
  end

  def normalize_filters(value, branches = [])
    scope = MagicSet.all

    scope = scope.where(name: value['name']) unless value['name'].nil?

    branches << scope

    value['OR'].reduce(branches) { |s,v| normalize_filters(v, s) } if value['OR'].present?

    branches
  end
end
