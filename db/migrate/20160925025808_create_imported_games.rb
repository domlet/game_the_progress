class CreateImportedGames < ActiveRecord::Migration[5.0]
  def change
    create_table :imported_games do |t|

      t.timestamps
    end
  end
end
