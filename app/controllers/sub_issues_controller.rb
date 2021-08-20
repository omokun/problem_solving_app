class SubIssuesController < ApplicationController
  before_action :authenticate_user!

  def index
    @sub_issues = SubIssue.new
    @main_issue = MainIssue.find(params[:main_issue_id])
  end

  def create
    @main_issue = MainIssue.find(params[:main_issue_id])
    @sub_issue = @main_issue.sub_issues.new(sub_issue_params)
    @sub_issue.save
  end

  private

  def sub_issue_params
    params.require(:sub_issue).permit(:title)
  end
  
end
