module Spree
  class SubscriptionsMailer < BaseMailer
    def cancel_email(@email)
      subject = "Cancelled: #{@user}"
      mail(to: "admin@mydapperbox.com", subject: subject)
    end

    def postpone_email(@email)
      subject = "Postponed for 3 Months: #{@user}"
      mail(to: "admin@mydapperbox.com", subject: subject)
    end
  end
end