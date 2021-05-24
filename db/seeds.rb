require "import_csv"

# テストユーザー情報
EMAIL = "test@example.com"
PASSWORD = "password"
ADMIN_EMAIL = "admin@example.com"
ADMIN_PASSWORD = "password"

# テストユーザーが存在しないときだけ作成
User.find_or_create_by!(email: EMAIL) do |user|
  user.password = PASSWORD
  puts "ユーザーアカウントの作成に成功しました。"
end

AdminUser.find_or_create_by!(email: ADMIN_EMAIL) do |admin_user|
  admin_user.password = ADMIN_PASSWORD
  puts "管理者ユーザーアカウントの作成に成功しました。"
end

ImportCsv.text_data
ImportCsv.movie_data
ImportCsv.question_data
