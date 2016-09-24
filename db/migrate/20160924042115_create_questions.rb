class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string  :text,                  null: false, default: ""
      t.integer :category_id,           null: false, default: ""
      t.integer :game_id,               null: false, default: ""
      t.integer :correct_answer_id,     null: false, default: ""
    end
  end
end
