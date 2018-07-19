class FormSubmitMailer < ApplicationMailer
  def notify_form_submit(user)
    @user = user
    mail(to: ['yawarabbas042@gmail.com', 'behram1993@gmail.com'], subject: "Drone Notification: #{@user.first_name} submitted applilcation as a #{@user.acc_type}")
  end
end
