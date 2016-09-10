FactoryGirl.define do
  factory :user do
    company_name "MyString"
    company_logo "MyString"
    website "MyString"
    twitter "MyString"
    admin false
    approved_user false
    number_of_employees 1
    email "MyString"
    password_digest "MyString"
  end
end
