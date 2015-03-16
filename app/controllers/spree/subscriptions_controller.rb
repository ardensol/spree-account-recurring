module Spree
  class SubscriptionsController < StoreController
    prepend_before_filter :load_object, except: [:confirmation, :cancellation]
    before_action :find_active_plan, only: [:new, :create]
    before_action :find_plan, only: [:show]
    before_action :find_subscription, only: [:show]
    before_action :authenticate_subscription, only: [:new, :create]

    def new
      @subscription = @plan.subscriptions.build
    end

    def confirmation
    end

    def cancellation
      @subscription = spree_current_user.subscriptions.undeleted.first
    end

    def create
      @subscription = @plan.subscriptions.build(subscription_params.merge(user_id: spree_current_user.id))
      if @subscription.save_and_manage_api
        redirect_to confirmation_path
      else
        render :new
      end
    end

    def destroy
      if @subscription.save_and_manage_api(unsubscribed_at: Time.current)
        redirect_to plans_path, notice: "Subscription has been cancelled."
      else
        render :show
      end
    end

    private

    def find_active_plan
      unless @plan = Spree::Plan.active.where(id: params[:plan_id]).first
        flash[:error] = "Plan not found."
        redirect_to plans_url
      end
    end

    def find_plan
      unless @plan = Spree::Plan.where(id: params[:plan_id]).first
        flash[:error] = "Plan not found."
        redirect_to plans_url
      end
    end

    def find_subscription
      unless @subscription = @plan.subscriptions.undeleted.where(id: params[:id]).first
        flash[:error] = "Subscription not found."
        redirect_to root_url
      end
    end

    def subscription_params
      params.require(:subscription).permit(:email, :card_token, :full_name, :country, :address_line_1, :address_line_2, :city, :state, :postal_code, :country, :coupon_code)
    end

    def load_object
      @user ||= spree_current_user
      authorize! params[:action].to_sym, @user
    end

    def authenticate_subscription
      if subscription = spree_current_user.subscriptions.undeleted.first
        flash[:alert] = "You have already subscribed."
        redirect_to plan_subscription_url(@plan, subscription)
      end
    end
  end
end