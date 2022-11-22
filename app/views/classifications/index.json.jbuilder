# frozen_string_literal: true

json.array!(@classifications, partial: 'classifications/classification', as: :classification)
