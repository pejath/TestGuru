# frozen_string_literal: true

json.extract! test, :id, :created_at, :updated_at
json.url test_url(test, format: :json)
