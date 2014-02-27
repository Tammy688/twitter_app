json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :email, :twitter_handle
  json.url user_url(user, format: :json)
end
