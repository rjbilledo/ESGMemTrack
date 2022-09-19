json.extract! member, :id, :name, :grade, :uin, :email, :points, :created_at, :updated_at
json.url member_url(member, format: :json)
