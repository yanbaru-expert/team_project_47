# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "import_csv"

# テストユーザーを作成
EMAIL = "test@example.com"
PASSWORD = "password"

# テストユーザーが存在しないときだけ作成
User.find_or_create_by!(email: EMAIL) do |user|
  user.password = PASSWORD
  puts "ユーザーの初期データインポートに成功しました。"
end

# 開発用の初期データ
user1 = User.create!(email: "satou@example.com", password: "password")
user2 = User.create!(email: "suzuki@example.com", password: "password")
user3 = User.create!(email: "tanaka@example.com", password: "password")

ADMIN_EMAIL = "admin@example.com"
ADMIN_PASSWORD = "password"
PASSWORD_CONFIRMATION = "password"

AdminUser.find_or_create_by!(email: ADMIN_EMAIL) do |admin_user|
  admin_user.password = ADMIN_PASSWORD
  admin_user.password_confirmation = PASSWORD_CONFIRMATION
  puts "管理者データ作成に成功しました。"
end

ImportCsv.text_data
ImportCsv.movie_data
ImportCsv.question_data
