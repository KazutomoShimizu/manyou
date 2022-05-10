require 'rails_helper'

RSpec.describe "ユーザー登録",type: :system do
  describe "ユーザー登録機能" do
    context "新規登録した場合" do
      it "ユーザー詳細画面が表示される" do
        visit new_user_path
        fill_in "user[name]",with: "sam"
        fill_in "user[email]",with: "sam@sam.com"
        fill_in "user[password]",with: "1111111"
        fill_in "user[password_confirmation]",with: "1111111"
        click_on "Create my account"
        expect(page).to have_content "sam@sam.com"
      end
      it "ログインせずタスク一覧画面に飛ぼうとしたとき、ログイン画面に遷移する" do
        visit tasks_path
        expect(current_path).to eq new_session_path
      end
    end
  end

  describe "ログイン機能" do
    let!(:user){ FactoryBot.create(:user) }
    let!(:second_user){ FactoryBot.create(:second_user) }
    let!(:task){ FactoryBot.create(:task,user: user) }
    before do
      visit new_session_path
      fill_in "session[email]",with: "sam@sam.com"
      fill_in "session[password]",with: "111111"
      click_on "Log in"
    end
    context "ログインした場合" do
      it "プロフィールに移動" do
        expect(page).to have_content "のページ"
      end
      it "他人のマイページに飛ぶとタスク一覧画面に遷移する" do
        visit user_path(second_user.id)
        expect(current_path).to eq tasks_path
      end
    end
    context "ログアウトした場合" do
      it "ログイン画面に遷移する" do
        click_link "Logout"
        expect(current_path).to eq new_session_path
      end
    end
  end

  describe "管理画面" do
    let!(:user){ FactoryBot.create(:user) }
    let!(:second_user){ FactoryBot.create(:second_user) }
    let!(:task){ FactoryBot.create(:task,user: user) }
      before do
        visit new_session_path
        fill_in "session[email]",with: "sam@sam.com"
        fill_in "session[password]",with: "111111"
        click_on "Log in"
        visit admin_users_path
      end
      it "管理画面に遷移できる" do
        expect(current_path).to eq admin_users_path
        expect(page).to have_content "ユーザー管理画面"
      end
      it "ユーザーの新規登録ができる" do
        click_link "新規ユーザー作成"
        fill_in "user[name]",with: "sample"
        fill_in "user[email]",with: "sample@sample.com"
        fill_in "user[password]",with: "111111"
        fill_in "user[password_confirmation]",with: "111111"
        click_on "Create account"
        expect(page).to have_content "sample"
      end
      it "ユーザの詳細画面に移動できる" do
        all("tbody tr")[1].click_link "詳細"
        expect(page).to have_content "タスク一覧"
      end
      it "ユーザの編集画面からユーザを編集できる" do
        all("tbody tr")[1].click_link "編集"
        fill_in "user[name]",with: "アナキン"
        click_on "編集"
        expect(page).to have_content "アナキン"
      end
      it "ユーザの削除をできる" do
        all("tbody tr")[2].click_link "削除"
        expect(page).to have_content "ユーザーを削除しました"
      end
    context "一般ユーザーの場合" do
      it "管理画面に遷移できない" do
        click_link "Logout"
        fill_in "session[email]",with: "sam1@sam.com"
        fill_in "session[password]",with: "111111"
        click_on "Log in"
        visit admin_users_path
        expect(page).to have_content "管理者以外はアクセスできません"
      end
    end
  end
end
