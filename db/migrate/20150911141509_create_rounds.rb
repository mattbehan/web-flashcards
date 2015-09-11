class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.references :user, index:true, null:false
      t.references :deck, index:true, null:false

      t.timestamps null:false
    end
  end
end
