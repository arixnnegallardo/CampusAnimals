json.extract! adoption_request, :id, :name, :pet, :letter_of_intent, :contactno, :email, :created_at, :updated_at
json.url adoption_request_url(adoption_request, format: :json)
