require 'rails_helper'

RSpec.describe "arcades/show", type: :view do
  before(:each) do
    @arcade = assign(:arcade, Arcade.create!(
      :title => "Title",
      :address => "MyText",
      :latitude => 2.5,
      :longitude => 3.5,
      :phone_number => 4,
      :website => "Website",
      :status => "Status",
      :image => "Image"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/Website/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/Image/)
  end
end
