json.array!(@vins) do |vin|
  json.extract! vin, :id, :description
  json.url vin_url(vin, format: :json)
end
