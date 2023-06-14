# frozen_string_literal: true

class ContactsMailer < ApplicationMailer
  default to: %("TestIO" <admin@TestIO.com>)

  def contacts_email(contacts)
    @name = contacts.name
    @body = contacts.body
    @email = contacts.email

    mail from: @email, subject: 'Contacts email'
  end
end
