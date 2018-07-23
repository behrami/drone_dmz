class FormSubmitMailer < ApplicationMailer
  def notify_form_submit_patron(user)
    @user = user
    mail(to: ENV['gmail_username'], subject: "Drone Notification: #{@user.first_name} submitted applilcation as a Patron")
  end

  def notify_form_submit_pilot(user)
    @user = user
    mail(to: ENV['gmail_username'], subject: "Drone Notification: #{@user.first_name} submitted applilcation as a Pilot")
  end
end
