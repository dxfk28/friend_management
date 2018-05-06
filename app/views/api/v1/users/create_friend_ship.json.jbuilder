# json.user do
#   # JSON.pretty_generate(@uses)
# end
# json.content format_content(@users)
# json.(@users, :created_at, :updated_at)
json.success @success if @success.present?
json.failed @failed if @failed.present?
