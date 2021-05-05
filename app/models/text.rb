class Text < ApplicationRecord
  has_many :read_progresses, dependent: :destroy
  validates :genre, :title, :content, presence: true

  def read_by?(user)
    read_progresses.find_by(user_id: user.id).present?
  end

  enum genre: {
    invisible: 0, # 非表示
    basic: 1,
    git: 2,
    ruby: 3,
    rails: 4,
    php: 5,
    html: 6,
    javascript: 7,
    typescript: 8,
    react: 9,
    vue: 10,
    angular: 11,
    aws: 12,
    money: 13, # マネタイズ講座
    talk: 14, # 全ての勉強会
    live: 15, # 勉強会
  }
end
