# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'shvyas@bestpeers.com'
  layout 'mailer'
end
