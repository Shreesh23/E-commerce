# frozen_string_literal: true

class CreateJob < ApplicationJob
  queue_as :default

  def perform(user)
    CrudNotificationMailer.create_notification(user).deliver_later
  end
end
