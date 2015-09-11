class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.references :round, index:true, null:false
      t.boolean :complete, default:false
      t.references :card, index:true, null:false

      t.timestamps null:false
    end
  end
end
