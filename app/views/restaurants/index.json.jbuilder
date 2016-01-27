json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :website, :image, :opening, :location, :vegan, :comments
  json.url restaurant_url(restaurant, format: :json)

  
end
