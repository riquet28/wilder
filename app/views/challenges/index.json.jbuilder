json.array!(@challenges) do |challenge|
  json.extract! challenge, :id, :title, :description, :expires_at, :points
  json.url challenge_url(challenge, format: :json)
end
