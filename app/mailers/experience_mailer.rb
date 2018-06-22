# frozen_string_literal: true

class ExperienceMailer < ApplicationMailer
  def notify_review(experience)
    @experience = experience

    subject = I18n.t(
      'experience_mailer.new_experience_submit',
      title: @experience.title
    )
    mail(to: 'contact@rookie.works', subject: subject)
  end
end
