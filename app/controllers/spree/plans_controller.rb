module Spree
  class PlansController < StoreController
    def index
      @plans = Spree::Plan.visible
    end
  end
endx