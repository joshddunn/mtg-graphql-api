class MtgqlController < ApplicationController
  def query
    result = MyappSchema.execute params[:query]
    render json: result
  end
end
