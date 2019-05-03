class LogoutController < ApplicationController
	def index
		# print session[:current]
		# if session[:current].nil?
	 #      print "session is not defined"
	 #    else
	 #      print "session is defined"
	 #    end

	    session[:current] = nil

	    redirect_to '/homepage'
	    #
	end
end
