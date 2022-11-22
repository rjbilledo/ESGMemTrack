# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('classifications/edit', type: :view) do
  before do
    @classification = assign(:classification, Classification.create!(
                                                classification_name: 'MyString'
                                              )
    )
  end

  it 'renders the edit classification form' do
    render

    assert_select 'form[action=?][method=?]', classification_path(@classification), 'post' do
      assert_select 'input[name=?]', 'classification[classification_name]'
    end
  end
end
