require "csv"

class ImportCsv

  # CSVデータのパスを引数として受け取り、インポート処理を実行
  def self.import(path)
    # インポートするデータを格納するための空配列
    list = []

    # CSVファイルからインポートしたデータを格納
    CSV.foreach(path, headers: true) do |row|
      list << row.to_h
    end
    # メソッドの戻り値をインポートしたデータの配列とする
    list
  end

  def self.text_data
    # importメソッドを呼び出し、テキストデータの配列を生成
    list = import('db/csv_data/text_data.csv')
    Text.destroy_all #データの初期化

    puts "テキスト教材インポート処理を開始"
    Text.create!(list)
    puts "テキスト教材のCSVデータインポート完了!!"
  end

  def self.movie_data
    # importメソッドを呼び出し、テキストデータの配列を生成
    list = import('db/csv_data/movie_data.csv')
    Movie.destroy_all #データの初期化

    puts "動画教材のCSVデータインポート処理を開始"
    Movie.create!(list)
    puts "動画教材のCSVデータインポート完了!!"
  end
end
