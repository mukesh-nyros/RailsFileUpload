json.array!(@contents) do |content|
  json.extract! content, :id, :path
  json.url content_url(content, format: :json)
end
