# frozen_string_literal: true

json.array! @tests, partial: 'tests/test', as: :test
