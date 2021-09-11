class InformationsController < ApplicationController

  def index
    @information = Information.new
  end

  def create
    @information = SubIssue.find(params[:sub_issue_id]).informations.create(information_params)
  end

  private

  def information_params
    params.require(:information).permit(:content)
  end
end


