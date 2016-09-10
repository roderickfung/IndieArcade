require 'rails_helper'

RSpec.describe "games/index", type: :view do
  before(:each) do
    assign(:games, [
      Game.create!(
        :title => "Title",
        :user => nil,
        :times_played => 2,
        :status => "Status",
        :purchase_url => "Purchase Url",
        :game_description => "MyText",
        :categories => "Categories",
        :key_map => "",
        :image => "Image"
      ),
      Game.create!(
        :title => "Title",
        :user => nil,
        :times_played => 2,
        :status => "Status",
        :purchase_url => "Purchase Url",
        :game_description => "MyText",
        :categories => "Categories",
        :key_map => "",
        :image => "Image"
      )
    ])
  end

  it "renders a list of games" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "Purchase Url".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Categories".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
  end
end
