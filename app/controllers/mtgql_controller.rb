class MtgqlController < ApplicationController
  def v1
    result = MyappSchema.execute params[:query]
    render json: result
  end
end
