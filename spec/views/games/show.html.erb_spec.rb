require 'rails_helper'

RSpec.describe "games/show", type: :view do
  before(:each) do
    @game = assign(:game, Game.create!(
      :title => "Title",
      :user => nil,
      :times_played => 2,
      :status => "Status",
      :purchase_url => "Purchase Url",
      :game_description => "MyText",
      :categories => "Categories",
      :key_map => "",
      :image => "Image"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/Purchase Url/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Categories/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Image/)
  end
end
