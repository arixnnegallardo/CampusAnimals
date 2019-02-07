class ViewprofilesController < ApplicationController
  before_action :set_viewprofile, only: [:show, :edit, :update, :destroy]

  # GET /viewprofiles
  # GET /viewprofiles.json
  def index
    @animalprofiles = Animalprofile.all
  end

  # GET /viewprofiles/1
  # GET /viewprofiles/1.json
  def show
  end

  # GET /viewprofiles/new
  def new
    @viewprofile = Viewprofile.new
  end

  # GET /viewprofiles/1/edit
  def edit
  end

  # POST /viewprofiles
  # POST /viewprofiles.json
  def create
    @viewprofile = Viewprofile.new(viewprofile_params)

    respond_to do |format|
      if @viewprofile.save
        format.html { redirect_to @viewprofile, notice: 'Viewprofile was successfully created.' }
        format.json { render :show, status: :created, location: @viewprofile }
      else
        format.html { render :new }
        format.json { render json: @viewprofile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /viewprofiles/1
  # PATCH/PUT /viewprofiles/1.json
  def update
    respond_to do |format|
      if @viewprofile.update(viewprofile_params)
        format.html { redirect_to @viewprofile, notice: 'Viewprofile was successfully updated.' }
        format.json { render :show, status: :ok, location: @viewprofile }
      else
        format.html { render :edit }
        format.json { render json: @viewprofile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /viewprofiles/1
  # DELETE /viewprofiles/1.json
  def destroy
    @viewprofile.destroy
    respond_to do |format|
      format.html { redirect_to viewprofiles_url, notice: 'Viewprofile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_viewprofile
      @viewprofile = Viewprofile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def viewprofile_params
      params.fetch(:viewprofile, {})
    end
end
