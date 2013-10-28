class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :position
      t.float :fg
      t.float :ft
      t.float :tpm
      t.float :reb
      t.float :ast
      t.float :stl
      t.float :blk
      t.float :pts

      t.timestamps
    end
  end
end
