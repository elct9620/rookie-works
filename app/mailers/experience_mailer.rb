# frozen_string_literal: true

class ExperienceMailer < ApplicationMailer
  def notify_review(experience)
    @experience = experience

    subject = I18n.t(
      'experience_mailer.new_experience_submit',
      title: @experience.title
    )

    # TODO: Add config to setup reviewer
    mail(to: 'reviewer@rookie.works', subject: subject)
  end

  def notify_published(experience)
    @experience = experience

    subject = I18n.t(
      'experience_mailer.notify_published.published',
      title: @experience.title
    )

    mail(to: @experience.user.email, subject: subject)
  end
end
