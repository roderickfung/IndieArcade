require 'rails_helper'

RSpec.describe "games/new", type: :view do
  before(:each) do
    assign(:game, Game.new(
      :title => "MyString",
      :user => nil,
      :times_played => 1,
      :status => "MyString",
      :purchase_url => "MyString",
      :game_description => "MyText",
      :categories => "MyString",
      :key_map => "",
      :image => "MyString"
    ))
  end

  it "renders new game form" do
    render

    assert_select "form[action=?][method=?]", games_path, "post" do

      assert_select "input#game_title[name=?]", "game[title]"

      assert_select "input#game_user_id[name=?]", "game[user_id]"

      assert_select "input#game_times_played[name=?]", "game[times_played]"

      assert_select "input#game_status[name=?]", "game[status]"

      assert_select "input#game_purchase_url[name=?]", "game[purchase_url]"

      assert_select "textarea#game_game_description[name=?]", "game[game_description]"

      assert_select "input#game_categories[name=?]", "game[categories]"

      assert_select "input#game_key_map[name=?]", "game[key_map]"

      assert_select "input#game_image[name=?]", "game[image]"
    end
  end
end
