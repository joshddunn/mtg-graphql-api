# frozen_string_literal: true

require 'test_helper'

module Resolvers
  class MagicSetSearchTest < ActiveSupport::TestCase
    def find(args)
      Resolvers::MagicSetSearch.call(nil, args, nil)
    end

    test 'magic_set_search: name OR' do
      result = find(
        filter: {
          'name' => ['Unstable'],
          'OR' => [{
            'name' => ['Unhinged']
          }]
        }
      )

      assert_equal result.map(&:name).sort, %w[Unhinged Unstable]
    end

    test 'magic_set_search: name' do
      result = find(
        filter: {
          'name' => ['Unstable']
        }
      )

      assert_equal result.first.name, 'Unstable'
    end
  end
end
