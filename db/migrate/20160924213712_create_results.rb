class CreateResults < ActiveRecord::Migration[5.0]
  def change
    create_table :results do |t|
      t.boolean :is_correct
      t.integer :user_id
      t.integer :question_id
      t.integer :student_answer_id

      t.timestamps
    end
  end
end
