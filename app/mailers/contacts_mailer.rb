# frozen_string_literal: true

class ContactsMailer < ApplicationMailer

  default to: %{"TestGuru" <admin@testguru.com>}

  def contacts_email(contacts)
    @name = contacts.name
    @body = contacts.body
    @email = contacts.email

    mail from: @email, subject: 'Contacts email'
  end
end
