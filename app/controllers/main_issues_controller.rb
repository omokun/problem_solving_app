class MainIssuesController < ApplicationController
  def new
    @main_issue = MainIssue.new
  end

  def create
    @main_issue = MainIssue.new(main_issue_params)
    if @main_issue.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @main_issue = MainIssue.all
  end

  def update
    @main_issue = MainIssue.find(params[:id])
    @main_issue.update(main_issue_params)
    redirect_to action: :index
  end

  private

  def main_issue_params
    params.require(:main_issue).permit(:title, :conclusion).merge(user_id: current_user.id)
  end
end
