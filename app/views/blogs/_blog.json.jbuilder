json.extract! blog, :id, :title, :content, :creation, :created_at, :updated_at
json.url blog_url(blog, format: :json)
