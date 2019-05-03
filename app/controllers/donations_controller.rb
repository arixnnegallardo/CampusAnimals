class DonationsController < ApplicationController
	skip_before_action :verify_authenticity_token
	  before_action :set_donation, only: [:show, :edit, :update, :destroy]

  # GET /donations
  # GET /donations.json
  # ADMIN VIEW ONLY: see all donation messages
  def index
    if session[:current] != Account.find_by_id(0).username
               redirect_to '/login'
    else
      @my_session = session[:current]
      @donations = Donation.all
    end
  end

  # GET /donations/1
  # GET /donations/1.json
  def show
    if session[:current].nil? or session[:current] != Account.find_by_id(0).username
      redirect_to '/login'
    else
      @my_session = session[:current]
    end
  end

  # GET /donations/new
  # PUBLIC VIEW: SEND A NEW DONATION MESSAGE
  def new
    @my_session = session[:current]
    @donation = Donation.new
  end

  def donate
    @my_session = session[:current]
  end

  # GET /donations/1/edit
  def edit
  end

  # POST /donations
  # POST /donations.json
  def create
    @donation = Donation.new(donation_params)
    @donation.save

    redirect_to '/verify_donation'

    # respond_to do |format|
    #   if @donation.save
    #     format.html { redirect_to @donation, notice: 'Donation was successfully created.' }
    #     format.json { render :show, status: :created, location: @donation }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @donation.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /donations/1
  # PATCH/PUT /donations/1.json
  def update
    respond_to do |format|
      if @donation.update(donation_params)
        format.html { redirect_to @donation, notice: 'Donation was successfully updated.' }
        format.json { render :show, status: :ok, location: @donation }
      else
        format.html { render :edit }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /donations/1
  # DELETE /donations/1.json
  def destroy
    @donation.destroy
    respond_to do |format|
      format.html { redirect_to donations_url, notice: 'Donation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_donation
      @donation = Donation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def donation_params
      params.require(:donation).permit(:name, :method, :amount, :notes)
    end
end
