# frozen_string_literal: true

module Inventory
  # Class for inventory viewing
  class ViewsController < ApplicationController
    def index

    end

    def get_inv_views
      @inv_views_attributes = AwmsAuinAttribute.where(auin: params[:auin])
      if !@inv_views_attributes.blank?
        @inv_views_attributes = @inv_views_attributes.first
      end
      puts @inv_views_attributes.inspect
      @inv_views_locations = AwmsInvItem.where(auin: params[:auin])
    end

  end
end
