module Spree
  class Spree::Recurring::PlansController < Spree::StoreController
    def index
      @plans = Spree::Plan.visible.order('id desc')
    end
  end
end