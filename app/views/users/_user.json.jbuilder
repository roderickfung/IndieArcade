json.extract! user, :id, :company_name, :company_logo, :website, :twitter, :admin, :approved_user, :number_of_employees, :email, :password_digest, :created_at, :updated_at
json.url user_url(user, format: :json)
