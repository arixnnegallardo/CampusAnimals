class AdoptionRequestsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_adoption_request, only: [:show, :edit, :update, :destroy]

  # GET /adoption_requests
  # GET /adoption_requests.json
  # ADMIN VIEW
  def index
    if !session[:current].nil? and  session[:current] == Account.find_by_id(0).username
        @my_session = session[:current]
        @adoption_requests = AdoptionRequest.all
    else
      redirect_to '/login'
    end
  end

  # GET /adoption_requests/1
  # GET /adoption_requests/1.json
  def show
    if !session[:current].nil? and  session[:current] == Account.find_by_id(0).username
        @my_session = session[:current]
        @req = AdoptionRequest.find_by_id(params[:id])
    else
      redirect_to '/login'
    end
  end

  # GET /adoption_requests/new
  def new
    @my_session = session[:current]
    @adoption_request = AdoptionRequest.new
  end

  # GET /adoption_requests/1/edit
  def edit
    
  end

  # POST /adoption_requests
  # POST /adoption_requests.json
  def create
    @adoption_request = AdoptionRequest.new(adoption_request_params)
    if @adoption_request.save
      redirect_to '/adopt'
    end

    # respond_to do |format|
    #   if @adoption_request.save
    #     format.html { redirect_to @adoption_request, notice: 'Adoption request was successfully created.' }
    #     format.json { render :show, status: :created, location: @adoption_request }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @adoption_request.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def resolve
    # print "resolve!!"
    # return true
    # print params[:id]
    mark = AdoptionRequest.find_by_id(params[:id])

    if mark.resolved.nil?
      mark.resolved = false 
    end

    if mark.resolved == false 
       print "case resolved"
      mark.resolved = true
    elsif mark.resolved == true
       print "unresolve"
      mark.resolved = false
     else print "res:" + mark.resolved
    end 

    mark.save
  end

  # PATCH/PUT /adoption_requests/1
  # PATCH/PUT /adoption_requests/1.json
  def update
    respond_to do |format|
      if @adoption_request.update(adoption_request_params)
        format.html { redirect_to @adoption_request, notice: 'Adoption request was successfully updated.' }
        format.json { render :show, status: :ok, location: @adoption_request }
      else
        format.html { render :edit }
        format.json { render json: @adoption_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adoption_requests/1
  # DELETE /adoption_requests/1.json
  def destroy
    @adoption_request.destroy
    respond_to do |format|
      format.html { redirect_to adoption_requests_url, notice: 'Adoption request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adoption_request
      @adoption_request = AdoptionRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def adoption_request_params
      params.require(:adoption_request).permit(:name, :pet, :letter_of_intent, :contactno, :email)
    end
end
