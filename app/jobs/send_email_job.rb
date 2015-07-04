#class SendEmailJob < ActiveJob::Base
class SendEmailJob
  @queue = :test

  def self.perform(user)
    @user = user
    Mailer.sample_email(@user).deliver
  end
end