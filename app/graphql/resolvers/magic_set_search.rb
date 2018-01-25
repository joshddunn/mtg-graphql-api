require 'search_object/plugin/graphql'

class Resolvers::MagicSetSearch
  include SearchObject.module(:graphql)
  description "Returns paginated information about magic sets."

  scope { MagicSet.all }

  type Types::MagicSetConnectionType

  MagicSetFilter = GraphQL::InputObjectType.define do
    name 'MagicSetFilter'

    argument :OR, -> { types[MagicSetFilter] }, description: "Allows you to chain multiple card filters."

    argument :name, types.String, description: "Allows you to search for a magic set by name."
  end

  option :filter, type: MagicSetFilter, with: :apply_filter, description: "Returns nodes that satisfy the filter arguments."
  option :order, type: types[types.String], with: :apply_order, description: "Returns nodes ordered by the specified field."

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
