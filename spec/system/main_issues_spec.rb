require 'rails_helper'

RSpec.describe "メインイシューに登録", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @main_issue_title = Faker::Lorem.sentence
  end
  context 'メインイシューが登録ができるとき'do
    it 'ログインしたユーザーは新規投稿できる' do
      # ログインする
      sign_in(@user)
      # 新規登録ページへのボタンがあることを確認する
      expect(page).to have_content('イシューを特定する')
      # 投稿ページに移動する
      visit new_main_issue_path
      # フォームに情報を入力する
      fill_in 'main_issue_title', with: @main_issue_title
      # 送信するとMainIssueモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { MainIssue.count }.by(1)
      # トップページへ遷移したことを確認する
      expect(current_path).to eq(root_path)
      # トップページには先ほど登録した内容のメインイシューが存在することを確認する（テキスト）
      expect(page).to have_content(@main_issue_title)
    end
  end
  context 'ツイート投稿ができないとき'do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      # トップページに遷移する
      visit root_path
      # 新規投稿ページへのボタンがないことを確認する
      expect(page).to have_no_content('イシューを特定する')
    end
  end
end
