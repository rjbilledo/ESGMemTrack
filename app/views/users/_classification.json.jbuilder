# frozen_string_literal: true

json.extract!(classification, :id, :classification_name, :created_at, :updated_at)
json.url(classification_url(classification, format: :json))
