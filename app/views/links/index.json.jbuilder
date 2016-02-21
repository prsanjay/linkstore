json.array!(@links) do |link|
  json.extract! link, :id, :link_name, :subject, :description, :url, :url_content
  json.url link_url(link, format: :json)
end
