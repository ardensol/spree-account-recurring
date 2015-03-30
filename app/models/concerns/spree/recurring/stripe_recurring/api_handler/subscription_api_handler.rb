module Spree
  class Recurring < ActiveRecord::Base
    class StripeRecurring < Spree::Recurring
      module ApiHandler
        module SubscriptionApiHandler
          def subscribe(subscription)
            raise_invalid_object_error(subscription, Spree::Subscription)
            customer = subscription.user.find_or_create_stripe_customer(subscription.card_token)
            if subscription.country == "United States" && subscription.coupon_code == ""
                customer.subscriptions.create(plan: subscription.api_plan_id)
            elsif subscription.country == "United States" && subscription.coupon_code != ""             
              customer.subscriptions.create(plan: subscription.api_plan_id, coupon: subscription.coupon_code)
            elsif subscription.country != "United States" && subscription.coupon_code == "" 
              customer.subscriptions.create(plan: subscription.intl_plan_id)
            elsif subscription.country != "United States" && subscription.coupon_code != ""
              customer.subscriptions.create(plan: subscription.intl_plan_id, coupon: subscription.coupon_code)
            end
          end

          def unsubscribe(subscription)
            raise_invalid_object_error(subscription, Spree::Subscription)
            subscription.user.api_customer.cancel_subscription
          end
        end
      end
    end
  end
end