class InformationsController < ApplicationController

  def index
    @information = Information.new
  end

  def create
    @information = @sub_issue.informations.new(information_params)
    @information.save
  end

  private

  def information_params
    params.require(:information).permit(:content).merge(sub_issue_id: params[:id])
  end
end


