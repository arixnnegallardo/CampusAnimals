#################################################################################################################
#MIT License

#Copyright (c) 2019 Arianne Gallardo

#Permission is hereby granted, free of charge, to any person obtaining a copy
#of this software and associated documentation files (the "Software"), to deal
#in the Software without restriction, including without limitation the rights
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the Software is
#furnished to do so, subject to the following conditions:

#The above copyright notice and this permission notice shall be included in all
#copies or substantial portions of the Software.

#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#SOFTWARE.

#This is a course requirement for CS 192 Software Engineering II under the supervision 
#of Asst. Prof. Ma. Rowena C. Solamo of the Department of Computer Science, College of Engineering, 
#University of the Philippines, Diliman for the AY 2015-2016.

#################################################################################################################

class AnimalprofilesController < ApplicationController
  before_action :set_animalprofile, only: [:show, :edit, :update, :destroy]

  # GET /animalprofiles
  # GET /animalprofiles.json
  def index
    @my_session = session[:current]
    if !session[:current].nil?
      @animalprofiles = Animalprofile.all
      @animalprofile = Animalprofile.new
    else
      redirect_to '/login'
    end
  end
  
  # GET /animalprofiles/1
  # GET /animalprofiles/1.json
  def show
  end

  # GET /animalprofiles/new
  def new
    @animalprofile = Animalprofile.new
    @animalprofiles = Animalprofile.all
  end

  # GET /animalprofiles/1/edit
  def edit
  end

  # POST /animalprofiles
  # POST /animalprofiles.json
  def create
    @animalprofile = Animalprofile.new(animalprofile_params)
    @animalprofiles = Animalprofile.all

    print "animal profile to be saved"

    respond_to do |format|
      if @animalprofile.save
        @animalprofile.animalID = @animalprofile.id; 
        @animalprofile.profileID = @animalprofile.id; 
        @animalprofile.save

        print "animal profile commited"
        
        format.js
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
        format.js
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
