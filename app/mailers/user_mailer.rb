# frozen_string_literal: true

# class UserMailer
class UserMailer < ApplicationMailer
  default from: 'online_examination_system@oes.com'
  require 'sendgrid-ruby'
  include SendGrid

  def score_email(user, score)
    @user = user
    @score = score
    mail(to: "#{user.username} <#{user.email}>", subject: 'Score Card')
  end
end
