class FormSubmitMailer < ApplicationMailer
  def notify_form_submit(user)
    @user = user
    mail(to: ENV['gmail_username'], subject: "Drone Notification: #{@user.first_name} submitted applilcation as a #{@user.acc_type}")
  end
end
