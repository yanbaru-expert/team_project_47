class Like < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  # belongs_to :text
end
