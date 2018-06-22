# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@mg.rookie.works'
  layout 'mailer'
end
