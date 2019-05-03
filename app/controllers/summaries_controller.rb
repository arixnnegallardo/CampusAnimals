class SummariesController < ApplicationController
  def index
    if session[:current] == Account.find_by_id(0).username 
      @my_session = session[:current]
      @animalprofiles = Animalprofile.all
      @catprofiles = Animalprofile.where("species = 'cat'")
      @dogprofiles = Animalprofile.where("species = 'dog'")
      @locations = Animalprofile.distinct.pluck(:location)
      @species = Animalprofile.distinct.pluck(:species)
      @adoptions = Animalprofile.where("adopted = '1'")
      @perlocation = Animalprofile.where("location = ?", params[:loc])
      @profiles = {}
      @locations.each do |loc|
        @profiles[loc] = []
        @species.each do |s|
          @profiles[loc] += Animalprofile.where(location: loc, species: s)
        end
      end
    else redirect_to '/login'
    end
    # puts @location.inspect
    # @locations.each do |l|
    #   if !l.nil?
    #   @perlocation[loc: l] = Animalprofile.where(loc: l)
    #   end
    # end

  end
end