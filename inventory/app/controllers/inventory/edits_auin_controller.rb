module Inventory
  class EditsAuinController < ApplicationController

    def index
      @auin_attributes = AwmsAuinAttribute.all
      @missing_attr = AwmsInvItem.select('auin').distinct.where("auin not in (select distinct auin from auin_attributes)")
    end

    def import
      AwmsAuinAttribute.csv_update(params[:file])
      redirect_to({:action => :index}, {:success => 'Inventory updated!'})
    end

    def edit_auin

    end

  end
end
