json.array!(@users) do |user|
  json.extract! user, :id, :name, :year, :rol, :ceeinf
  json.url user_url(user, format: :json)
end
