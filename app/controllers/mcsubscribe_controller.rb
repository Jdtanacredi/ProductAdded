class McsubscribeController < ApplicationController

	def index
  end

	def launch
	end

  def subscribe
    email = params[:email][:address]
    if !email.blank?
      begin
        @mc.lists.subscribe(@list_id, {'email' => email})
        respond_to do |format|
          format.json{render :json => {:message => "Success! Check your email to confirm sign up.", :error => 0}}
        end
        rescue Mailchimp::ListAlreadySubscribedError
          respond_to do |format|
            format.json{render :json => {:message => "#{email} is already subscribed to the list", :error => 1}}
          end
        rescue Mailchimp::ListDoesNotExistError
          respond_to do |format|
            format.json{render :json => {:message => "The list could not be found.", :error => 2}}
          end
        rescue Mailchimp::Error => ex
            if ex.message
              respond_to do |format|
                format.json{render :json => {:message => "There is an error. Please enter valid email id.", :error => 3}}
              end
            else
              respond_to do |format|
                format.json{render :json => {:message => "An unknown error occurred.", :error => 4}}
              end
            end
        end
        else
          respond_to do |format|
            format.json{render :json => {:message => "Email Address Cannot be blank. Please enter valid email id.", :error => 5}}
          end
        end
  end
end
