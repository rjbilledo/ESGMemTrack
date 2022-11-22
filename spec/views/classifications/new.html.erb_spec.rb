# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('classifications/new', type: :view) do
  before do
    assign(:classification, Classification.new(
                              classification_name: 'MyString'
                            )
    )
  end

  it 'renders new classification form' do
    render

    assert_select 'form[action=?][method=?]', classifications_path, 'post' do
      assert_select 'input[name=?]', 'classification[classification_name]'
    end
  end
end
