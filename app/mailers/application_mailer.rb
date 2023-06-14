# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: %("TestIO" <admin@TestIO.com>)
  layout 'mailer'
end
