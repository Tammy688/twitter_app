json.array!(@tweets) do |tweet|
  json.extract! tweet, :id, :tweets, :user_id, :comment_id
  json.url tweet_url(tweet, format: :json)
end
