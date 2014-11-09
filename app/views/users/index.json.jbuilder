json.array!(@users) do |user|
  json.extract! user, :id, :name, :account, :email, :phone, :zip, :address, :birthday, :age, :company, :bio, :admin
  json.url user_url(user, format: :json)
end
