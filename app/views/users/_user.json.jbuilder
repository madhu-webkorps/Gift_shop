json.extract! user, :id, :user_name, :password, :frist_name, :last_name, :address, :pin_code, :phone_no, :created_at, :updated_at
json.url user_url(user, format: :json)
