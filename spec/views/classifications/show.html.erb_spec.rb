require 'rails_helper'

RSpec.describe "classifications/show", type: :view do
  before(:each) do
    @classification = assign(:classification, Classification.create!(
      classification_name: "Classification Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Classification Name/)
  end
end
