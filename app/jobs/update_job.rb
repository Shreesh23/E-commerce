# frozen_string_literal: true

class UpdateJob < ApplicationJob
  queue_as :default

  def perform(user)
    CrudNotificationMailer.update_notification(user).deliver_later
  end
end
