class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string  :text,             null: false, default: ""
      t.integer :questions_id,     null: false, default: ""
    end
  end
end
