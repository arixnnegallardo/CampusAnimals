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

class ViewprofilesController < ApplicationController
  before_action :set_viewprofile, only: [:show, :edit, :update, :destroy]
  require 'digest'  

  # GET /viewprofiles
  # GET /viewprofiles.json
  def index
     if request.get?
          if params[:search]
              @query = "showing results for: " + params[:search]
              @animalprofiles = Animalprofile.search(params[:search]) 
          elsif params[:animal]
              @query = "showing all " + params[:animal] + "s"
              @animalprofiles = Animalprofile.filter_species(params[:animal])
          else
              #@hello = Digest::SHA256.hexdigest("this is a test") 
              @query = "showing all profiles"
              @animalprofiles = Animalprofile.all
          end
     else
          #@hello = Digest::SHA256.hexdigest("this is a test") 
          @query = "showing all profiles"
          @animalprofiles = Animalprofile.all
     end 
  end

  # GET /viewprofiles/1
  # GET /viewprofiles/1.json
  def show
    format.js
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
