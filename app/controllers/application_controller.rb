class ApplicationController < ActionController::Base


    include ApplicationHelper	
   	
    include PostHelper	
    include SessionsHelper	  
    include UserHelper	
  
    

    helper_method :signed_in?
end
