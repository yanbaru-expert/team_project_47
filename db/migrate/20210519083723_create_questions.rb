class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :title
      t.string :genre
      t.string :content
      t.text :answer

      t.timestamps
    end
  end
end
