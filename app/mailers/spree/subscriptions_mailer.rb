module Spree
  class SubscriptionsMailer < BaseMailer
    default from: 'admin@mydapperbox.com'

    def cancel_email(email)
      subject = "Cancelled: #{email}"
      mail(to: "admin@mydapperbox.com", subject: subject)
    end

    def postpone_email(email)
      subject = "Postponed for 3 Months: #{email}"
      mail(to: "admin@mydapperbox.com", subject: subject)
    end

    def confirmation_email(email)
      subject = "Subscription Confirmation: #{email}"
      mail(to: email, subject: subject)
    end

    def address_changed_email(email, address)
      @address = address
      subject = "Subscription Address  Changed: #{email}"
      mail(to: "admin@mydapperbox.com", subject: subject)
    end

  end
end