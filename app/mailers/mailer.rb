class Mailer < ApplicationMailer
#  default from: "diego@allis.com"
  
  def sample_email(email) #Needs simple arguments because of resque, check this!
   # @user = user

  #Direct - No API
  #mail(to: @user.email, subject: 'Sample Email')
  
  #MailGun API
   mg_client = Mailgun::Client.new ENV['api_key']
   message_params = {:from    => ENV['default_from'],
                     :to      => email , #@user.email
                     :subject => 'Sample Mail using Mailgun API',
                     :text    => 'This mail is sent using Mailgun API via mailgun-ruby'}
   mg_client.send_message ENV['domain'], message_params
  end
end