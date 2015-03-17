module Spree
  class SubscriptionsMailer < BaseMailer
    def cancel_email(email)
      subject = "Cancelled: #{email}"
      mail(to: "admin@mydapperbox.com", subject: subject)
    end

    def postpone_email(email)
      @email = email
      subject = "Postponed for 3 Months: #{@email}"
      mail(to: "admin@mydapperbox.com", subject: subject)
    end
  end
end