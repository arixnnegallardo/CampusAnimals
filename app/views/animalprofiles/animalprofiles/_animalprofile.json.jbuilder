json.extract! animalprofile, :id, :animalID, :profileID, :name, :species, :gender, :color, :markings, :location, :neutered, :vaccinated, :adopted, :remarks, :cagelabel, :created_at, :updated_at
json.url animalprofile_url(animalprofile, format: :json)
