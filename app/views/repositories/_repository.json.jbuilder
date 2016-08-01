json.extract! repository, :id, :name, :description, :url, :user_id, :created_at, :updated_at
json.url repository_url(repository, format: :json)