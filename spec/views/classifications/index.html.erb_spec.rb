require 'rails_helper'

RSpec.describe "classifications/index", type: :view do
  before(:each) do
    assign(:classifications, [
      Classification.create!(
        classification_name: "Classification Name"
      ),
      Classification.create!(
        classification_name: "Classification Name"
      )
    ])
  end

  it "renders a list of classifications" do
    render
    assert_select "tr>td", text: "Classification Name".to_s, count: 2
  end
end
