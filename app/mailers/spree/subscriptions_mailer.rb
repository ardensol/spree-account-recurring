module Spree
  class SubscriptionsMailer < BaseMailer
    def cancel_email(user, resend = false)
      subject = "#{Spree::Store.current.name} #{Spree.t('order_mailer.confirm_email.subject')} ##{@order.number}"
      mail(to: "admin@mydapperbox.com", subject: "Canceled Subscription: #{subject})"
    end

    def postpone_email(user, resend = false)
      subject = 
      mail(to: "admin@mydapperbox.com", subject: "Postponed for 3 Months: #{subject}")
    end
  end
end