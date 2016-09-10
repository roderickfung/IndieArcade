require 'rails_helper'

RSpec.describe "tags/index", type: :view do
  before(:each) do
    assign(:tags, [
      Tag.create!(
        :tag_name => "Tag Name"
      ),
      Tag.create!(
        :tag_name => "Tag Name"
      )
    ])
  end

  it "renders a list of tags" do
    render
    assert_select "tr>td", :text => "Tag Name".to_s, :count => 2
  end
end
