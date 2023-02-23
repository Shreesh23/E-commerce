# frozen_string_literal: true

class DeleteJob < ApplicationJob
  queue_as :default

  def perform(user)
    CrudNotificationMailer.delete_notification(user).deliver_later
  end
end
