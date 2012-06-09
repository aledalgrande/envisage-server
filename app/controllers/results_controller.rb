class ResultsController < ApplicationController

  def create
    respond_to do |format|
      format.json {
        result = Result.find_by_name(params[:result][:name])
        if result
          result.update_attributes(params[:result])
          head :accepted
        else
          if Result.create(params[:result])
            head :created
          else
            head :error
          end
        end
      }
    end
  end

  def index
    
  end
  
  def edit
    
  end
  
  def update
    
  end

end
