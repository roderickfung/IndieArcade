require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :company_name => "MyString",
      :company_logo => "MyString",
      :website => "MyString",
      :twitter => "MyString",
      :admin => false,
      :approved_user => false,
      :number_of_employees => 1,
      :email => "MyString",
      :password_digest => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input#user_company_name[name=?]", "user[company_name]"

      assert_select "input#user_company_logo[name=?]", "user[company_logo]"

      assert_select "input#user_website[name=?]", "user[website]"

      assert_select "input#user_twitter[name=?]", "user[twitter]"

      assert_select "input#user_admin[name=?]", "user[admin]"

      assert_select "input#user_approved_user[name=?]", "user[approved_user]"

      assert_select "input#user_number_of_employees[name=?]", "user[number_of_employees]"

      assert_select "input#user_email[name=?]", "user[email]"

      assert_select "input#user_password_digest[name=?]", "user[password_digest]"
    end
  end
end
