module Inventory
  class EditsInvController < ApplicationController

    def index
      @inv_items = AwmsInvItem.all
    end

    def import
      case AwmsInvItem.csv_update(params[:file])
        when "SUCCESS"
          redirect_to({:action => :index}, {:success => 'Inventory updated!'})
        when  "FAILURE"
          redirect_to({:action => :index}, {:error => 'Location ID not a valid location!'})
      end
    end

    def edit_inv

    end

  end
end
