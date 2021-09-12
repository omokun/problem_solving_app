class SubIssuesController < ApplicationController
  before_action :authenticate_user!

  def index
    @sub_issue = SubIssue.new
    @main_issue = MainIssue.find(params[:main_issue_id])
    @sub_issues = @main_issue.sub_issues.includes(:main_issue)
  end

  def create
    @main_issue = MainIssue.find(params[:main_issue_id]).sub_issues.create(sub_issue_params)
    # @sub_issue = @main_issue.sub_issues.new(sub_issue_params)
    # if @sub_issue.save
    redirect_to action: :index
  end

  def update
    sub_issue = SubIssue.eager_load(:main_issue).find(params[:id])
    sub_issue.update!(sub_issue_params)
    redirect_to action: :index
  end

  private

  def sub_issue_params
    params.require(:sub_issue).permit(:title, :hypothesis, :new_hypothesis, :sub_conclusion)
  end
end
