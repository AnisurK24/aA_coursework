class SessionsController < ApplicationController

    def new
        @session = Session.new
        render :new
      end
    
      def create
        user = User.find_by_credentials(
          params[:user][:username],
          params[:user][:password]
        )
    
        if user.nil?
            render json: 'Credentials were wrong'
        else
            login(user)
            redirect_to cats_url
        end
      end

    def destroy
        logout!
        redirect_to new_session_url
    end
end



