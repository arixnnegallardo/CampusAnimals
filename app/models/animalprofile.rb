class Animalprofile < ApplicationRecord
	#change_table :animalprofile do |t|
	#	t.remove :description, :name
	#	t.string :part_number
	#	t.index :part_number
	#	t.rename :upccode, :upc_code
	#end
	def self.search(search)
	  if search
	    Animalprofile.where('name LIKE ?', "%#{search}%");
	  else
	    find(:all)
	  end
	end

	def self.filter_species(search)
	  if search
	    Animalprofile.where('species LIKE ?', "%#{search}%");
	  else
	    find(:all)
	  end
	end
	
end
