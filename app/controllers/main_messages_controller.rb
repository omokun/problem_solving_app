class MainMessagesController < ApplicationController
  def index
    @main_issue = MainIssue.all
  end
end
