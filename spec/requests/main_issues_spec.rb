require 'rails_helper'

RSpec.describe "MainIssues", type: :request do
  before do
    @main_issue = FactoryBot.create(:main_issue)
  end

  describe 'GET #index' do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do 
      get root_path
      expect(response.status).to eq 200
    end
  end
end
