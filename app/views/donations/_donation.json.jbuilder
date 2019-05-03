json.extract! donation, :id, :name, :method, :amount, :notes, :created_at, :updated_at
json.url donation_url(donation, format: :json)
