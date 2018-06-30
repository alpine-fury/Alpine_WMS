module Inventory
  class ViewsController < ApplicationController
    def index

    end

    def get_inv_views
      @inv_views_attributes = AwmsAuinAttribute.where(auin: params[:auin])
      @inv_views_attributes = @inv_views_attributes.first if !@inv_views_attributes.blank?
      puts @inv_views_attributes.inspect
      @inv_views_locations = AwmsInvItem.where(auin: params[:auin])
    end

  end
end
