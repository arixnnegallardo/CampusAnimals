class TokenController < ApplicationController
	# GET /GENERATE_TOKEN
	def index
          if session[:current] != Account.find_by_id(0).username
               redirect_to '/login'
          else
               charset = Array('A'..'Z')
               @random = Array.new(6) { charset.sample }.join
               @token_pass = Digest::SHA256.hexdigest(@random)

               session[:random] = @random 
               #print @random + "\n"
               #save token_pass to database 
               a = Account.find_by_id(1)
               a.password = @token_pass
               a.save

               redirect_to '/' + params[:origin]
          end
		
	end

	# GET /END_SESSION
	def destroy
		if session[:current] != Account.find_by_id(0).username
               redirect_to '/login'
          else
               #save token_pass to database 
               a = Account.find_by_id(1)
               a.password = ""
               a.save

               session[:random] = nil               

               redirect_to '/' + params[:origin]
          end
	end
end
