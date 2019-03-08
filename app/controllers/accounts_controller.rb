class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  # protect_from_forgery with: :exception, prepend: true

  # GET /accounts
  # GET /accounts.json
  # LOGIN PAGE -- SECRETARY GENERAL AND ENCODERS
  def index 
    #@accounts = Account.all 
    redirect_to '/accounts/new'
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
  end

  # GET /accounts/new
  # SECRETARY GENERAL GENERATES A TOKEN FOR ENCODER LOGINS
  def new 
    @account = Account.new
  end

  # GET /accounts/1/edit
  # CHANGE USERNAME AND PASSWORD OF SECRETARY GENERAL
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)
    @pass = Digest::SHA256.hexdigest(@account.password)
    @id = Account.where(username: @account.username).take
    if @id.id = 1
      if @pass == @id.password.downcase
        session[:current] = @id.username
        print session[:current]
        redirect_to '/animalprofiles'
      else
        redirect_to '/accounts/new'
      end 
    end
    #print @account.username
    # respond_to do |format|
    #   if @account.save
    #     format.html { redirect_to @account, notice: 'Account was successfully created.' }
    #     format.json { render :show, status: :created, location: @account }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @account.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    print session[:username]
    # @account.destroy
    # respond_to do |format|
    #   format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:username, :password)
    end
end
