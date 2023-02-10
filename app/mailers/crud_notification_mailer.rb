class CrudNotificationMailer < ApplicationMailer

  def create_notification(object)
    @object = object
    mail to: "shreesh.vyas99@gmail.com"
  end

  def update_notification(object)
    @object = object
    mail to: "shreesh.vyas99@gmail.com"
  end

  def delete_notification(object)
    @object = object
    mail to: "shreesh.vyas99@gmail.com"
  end
end
