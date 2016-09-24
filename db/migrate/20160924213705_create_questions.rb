class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :text
      t.integer :category_id
      t.integer :game_id
      t.integer :correct_answer_id

      t.timestamps
    end
  end
end
