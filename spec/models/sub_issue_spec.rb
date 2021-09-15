require 'rails_helper'

RSpec.describe SubIssue, type: :model do
  before do
    @sub_issue = FactoryBot.build(:sub_issue)
  end

  describe 'サブイシューの登録' do
    context 'サブイシューが登録できるとき' do
      it 'titleとmain_issue_idが存在すれば登録できる' do
        expect(@sub_issue).to be_valid
      end
    end
    context 'サブイシューが登録できないとき' do
      it 'titleが空では登録できない' do
        @sub_issue.title = ''
        @sub_issue.valid?
        expect(@sub_issue.errors.full_messages).to include "Title can't be blank"
      end
      it 'メインイシューが紐付いていなければ登録できない' do
        @sub_issue.main_issue = nil
        @sub_issue.valid?
        expect(@sub_issue.errors.full_messages).to include 'Main issue must exist'
      end
    end
  end
end
