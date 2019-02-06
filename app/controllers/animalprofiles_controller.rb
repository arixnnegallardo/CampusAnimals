class AnimalprofilesController < ApplicationController
  before_action :set_animalprofile, only: [:show, :edit, :update, :destroy]

  # GET /animalprofiles
  # GET /animalprofiles.json
  def index
    @animalprofiles = Animalprofile.all
  end

  # GET /animalprofiles/1
  # GET /animalprofiles/1.json
  def show
  end

  # GET /animalprofiles/new
  def new
    @animalprofile = Animalprofile.new
  end

  # GET /animalprofiles/1/edit
  def edit
  end

  # POST /animalprofiles
  # POST /animalprofiles.json
  def create
    @animalprofile = Animalprofile.new(animalprofile_params)

    respond_to do |format|
      if @animalprofile.save
        format.html { redirect_to @animalprofile, notice: 'Animalprofile was successfully created.' }
        format.json { render :show, status: :created, location: @animalprofile }
      else
        format.html { render :new }
        format.json { render json: @animalprofile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /animalprofiles/1
  # PATCH/PUT /animalprofiles/1.json
  def update
    respond_to do |format|
      if @animalprofile.update(animalprofile_params)
        format.html { redirect_to @animalprofile, notice: 'Animalprofile was successfully updated.' }
        format.json { render :show, status: :ok, location: @animalprofile }
      else
        format.html { render :edit }
        format.json { render json: @animalprofile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /animalprofiles/1
  # DELETE /animalprofiles/1.json
  def destroy
    @animalprofile.destroy
    respond_to do |format|
      format.html { redirect_to animalprofiles_url, notice: 'Animalprofile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_animalprofile
      @animalprofile = Animalprofile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def animalprofile_params
      params.require(:animalprofile).permit(:animalID, :profileID, :name, :species, :gender, :color, :markings, :location, :neutered, :vaccinated, :adopted, :remarks, :cagelabel)
    end
end
