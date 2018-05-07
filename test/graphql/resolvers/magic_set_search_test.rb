require 'test_helper'

class Resolvers::MagicSetSearchTest < ActiveSupport::TestCase

  def find(args)
    Resolvers::MagicSetSearch.call(nil, args, nil)
  end

  test 'magic_set_search: name OR' do
    result = find(
      filter: {
        "name" => ["Unstable"],
        "OR" => [{
          "name" => ["Unhinged"]
        }]
      }
    )

    assert_equal result.map(&:name).sort, ["Unhinged", "Unstable"]
  end

  test 'magic_set_search: name' do
    result = find(
      filter: {
        "name" => ["Unstable"]
      }
    )

    assert_equal result.first.name, "Unstable"
  end
end
