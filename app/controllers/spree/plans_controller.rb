module Spree
  class PlansController < Spree::StoreController
    def index
      @plans = Spree::Plan.visible.order('id desc')
    end
  end
end