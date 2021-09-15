require 'rails_helper'

RSpec.describe MainIssue, type: :model do
  before do
    @main_issue = FactoryBot.build(:main_issue)
  end

  describe 'メインイシューの登録' do
    context 'メインイシューが登録できるとき' do
      it 'titleとuser_idが存在すれば登録できる' do
        expect(@main_issue).to be_valid
      end
    end
    context 'メインイシューが登録できないとき' do
      it 'titleが空では登録できない' do
        @main_issue.title = ''
        @main_issue.valid?
        expect(@main_issue.errors.full_messages).to include "Title can't be blank"
      end
      it 'ユーザーが紐付いていなければ登録できない' do
        @main_issue.user = nil
        @main_issue.valid?
        expect(@main_issue.errors.full_messages).to include 'User must exist'
      end
    end
  end
end
