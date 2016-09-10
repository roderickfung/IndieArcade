require 'rails_helper'

RSpec.describe "arcades/index", type: :view do
  before(:each) do
    assign(:arcades, [
      Arcade.create!(
        :title => "Title",
        :address => "MyText",
        :latitude => 2.5,
        :longitude => 3.5,
        :phone_number => 4,
        :website => "Website",
        :status => "Status",
        :image => "Image"
      ),
      Arcade.create!(
        :title => "Title",
        :address => "MyText",
        :latitude => 2.5,
        :longitude => 3.5,
        :phone_number => 4,
        :website => "Website",
        :status => "Status",
        :image => "Image"
      )
    ])
  end

  it "renders a list of arcades" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
  end
end
