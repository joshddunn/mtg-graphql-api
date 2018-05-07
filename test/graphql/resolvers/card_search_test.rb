require 'test_helper'

class Resolvers::CardSearchTest < ActiveSupport::TestCase

  def find(args)
    Resolvers::CardSearch.call(nil, args, nil)
  end

  test 'card_search: name OR' do
    result = find(
      filter: {
        "name" => ["swamp"],
        "OR" => [{
          "name" => ["island"]
        }]
      }
    )

    assert_equal result.map(&:name).sort, ["island", "swamp"]
  end

  test 'card_search: name' do
    result = find(
      filter: {
        name: ["swamp"]
      }
    )

    assert_equal result.first.name, "swamp"
  end
  
  test 'card_search: nameLike' do
    result = find(
      filter: {
        nameLike: ["swa"]
      }
    )

    assert_equal result.first.name, "swamp"
  end

  test 'card_search: type' do
    result = find(
      filter: {
        type: ["Land"]
      }
    )

    assert_equal result.map(&:name).sort, ["island", "swamp"]
  end

  test 'card_search: subtype' do
    result = find(
      filter: {
        subtype: ["Swamp"]
      }
    )

    assert_equal result.first.name, "swamp"
  end

  test 'card_search: supertype' do
    result = find(
      filter: {
        supertype: ["Basic"]
      }
    )

    assert_equal result.map(&:name).sort, ["island", "swamp"]
  end
end
