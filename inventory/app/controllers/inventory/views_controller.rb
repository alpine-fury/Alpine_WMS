module Inventory
  class ViewsController < ApplicationController
    def index

    end

    def get_inv_views
      @inv_views_results = AwmsAuinAttribute.where(uin: params[:auin])
    end

  end
end
