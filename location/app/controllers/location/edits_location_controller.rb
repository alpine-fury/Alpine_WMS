module Location
  class EditsLocationController < ApplicationController

    def index
      @location_attributes = AwmsLocation.all
      @missing_attr = AwmsInvItem.select('location_id').distinct.where("location_id not in (select distinct id from locations)")
    end

    def import
      AwmsLocation.csv_update(params[:file])
      redirect_to({:action => :index}, {:success => 'Location attributes updated!'})
    end

    def edit_auin

    end

  end
end
