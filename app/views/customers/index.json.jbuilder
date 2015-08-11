json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :address1
  json.url customer_url(customer, format: :json)
end
