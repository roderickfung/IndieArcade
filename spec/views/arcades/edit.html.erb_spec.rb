require 'rails_helper'

RSpec.describe "arcades/edit", type: :view do
  before(:each) do
    @arcade = assign(:arcade, Arcade.create!(
      :title => "MyString",
      :address => "MyText",
      :latitude => 1.5,
      :longitude => 1.5,
      :phone_number => 1,
      :website => "MyString",
      :status => "MyString",
      :image => "MyString"
    ))
  end

  it "renders the edit arcade form" do
    render

    assert_select "form[action=?][method=?]", arcade_path(@arcade), "post" do

      assert_select "input#arcade_title[name=?]", "arcade[title]"

      assert_select "textarea#arcade_address[name=?]", "arcade[address]"

      assert_select "input#arcade_latitude[name=?]", "arcade[latitude]"

      assert_select "input#arcade_longitude[name=?]", "arcade[longitude]"

      assert_select "input#arcade_phone_number[name=?]", "arcade[phone_number]"

      assert_select "input#arcade_website[name=?]", "arcade[website]"

      assert_select "input#arcade_status[name=?]", "arcade[status]"

      assert_select "input#arcade_image[name=?]", "arcade[image]"
    end
  end
end
