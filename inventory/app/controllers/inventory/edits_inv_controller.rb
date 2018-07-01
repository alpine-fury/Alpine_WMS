module Inventory
  class EditsInvController < ApplicationController

    def index
      @inv_items = AwmsInvItem.all
    end

    def import
      AwmsInvItem.csv_update(params[:file])
      redirect_to({:action => :index}, {:success => 'Inventory updated!'})
    end

    def edit_inv

    end

  end
end
