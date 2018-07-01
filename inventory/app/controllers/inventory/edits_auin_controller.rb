module Inventory
  class EditsAuinController < ApplicationController

    def index
      @auin_attributes = AwmsAuinAttribute.all
    end

    def import
      AwmsAuinAttribute.csv_update(params[:file])
      redirect_to({:action => :index}, {:success => 'Inventory updated!'})
    end

    def edit_auin

    end

  end
end
