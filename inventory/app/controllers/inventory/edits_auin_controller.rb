module Inventory
  class EditsAuinController < ApplicationController

    def index
      @auin_attributes = AwmsAuinAttribute.all
      @missing_attr = AwmsAuinAttribute.missing_attr_location

    end

    def import
      AwmsAuinAttribute.csv_update(params[:file])
      redirect_to({:action => :index}, {:success => 'AUIN attributes updated!'})
    end

    def edit_auin

    end

  end
end
