json.array!(@links) do |link|
  json.extract! link, :id, :url, :shorturl
  json.url link_url(link, format: :json)
end
