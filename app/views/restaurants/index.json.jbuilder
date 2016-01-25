json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :website, :image_url, :opening, :location, :vegan, :comments
  json.url restaurant_url(restaurant, format: :json)

  
end
