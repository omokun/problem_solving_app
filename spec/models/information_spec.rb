require 'rails_helper'

RSpec.describe Information, type: :model do
  before do
    @information = FactoryBot.build(:information)
  end

  describe 'インフォメーションの登録' do
    context 'インフォメーションの登録が登録できるとき' do
      it 'contentとsub_issue_idが存在すれば登録できる' do
        expect(@information).to be_valid
      end
    end
    context 'インフォメーションの登録が登録できないとき' do
      it 'contentが空では登録できない' do
        @information.content = ''
        @information.valid?
        expect(@information.errors.full_messages).to include "Content can't be blank"
      end
      it 'サブイシューが紐付いていなければ登録できない' do
        @information.sub_issue = nil
        @information.valid?
        expect(@information.errors.full_messages).to include 'Sub issue must exist'
      end
    end
  end
end
