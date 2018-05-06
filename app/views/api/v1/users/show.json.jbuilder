# json.user do
#   # JSON.pretty_generate(@uses)
# end
# json.content format_content(@users)
# json.(@users, :created_at, :updated_at)
json.success @success
if @users.present?
  json.friends do
    json.array! @users do |user|
      json.email user.email
    end
  end
  json.count @count
end
