class Helper::UtilitiesController < Helper::BaseHelperController
  
  def sms_generate
    
  end
  
  
  def sms_send
    account_sid = ENV["twilio_sid"]
    auth_token  = ENV["twilio_auth"]
    from        = ENV["twilio_from"]
    client = Twilio::REST::Client.new(account_sid, auth_token)
    
    
    to = '+6281266111561'
    
    client.messages.create(
    from: from,
    to: to,
    body: "THIS IS FBI OPEN UP!"
    )
  end
  
  def sms_params
    
  end
  
  def name
    render :json => [:name => current_user.username].to_json
  end
  
end