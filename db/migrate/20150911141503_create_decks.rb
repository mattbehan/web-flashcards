class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :name, null:false
      t.string :subject
      t.string :personal, null:false
      t.references :creator, index:true, null:false

      t.timestamps null:false
    end
  end
end
