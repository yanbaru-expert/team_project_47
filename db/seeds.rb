# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# テストユーザーを作成
EMAIL = "test@example.com"
PASSWORD = "password"

# テストユーザーが存在しないときだけ作成
User.find_or_create_by!(email: EMAIL) do |user|
  user.password = PASSWORD
  puts "ユーザーの初期データインポートに成功しました。"
end

# CSVデータのパスを引数として受け取り、インポート処理を実行
require "csv"
class ImportCsv
  def self.import(path)
    CSV.foreach(path, headers: true) do |row|
      Text.create!(
        genre: row["genre"], # CSVデータのgenre列の情報を指定して読み込む
        title: row["title"], # CSVデータのtitle列の情報を指定して読み込む
        contnent: row["contnent"] # CSVデータのcontent列の情報を指定して読み込む
      )
    end
  end
end
