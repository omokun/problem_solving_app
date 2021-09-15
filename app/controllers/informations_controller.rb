class InformationsController < ApplicationController
  def index
    @information = Information.new
  end

  def create
    @information = SubIssue.find(params[:sub_issue_id]).informations.create(information_params)
    # redirect_to controller: 'sub_issues', action: 'index'
  end

  private

  def information_params
    params.require(:information).permit(:content)
  end
end
