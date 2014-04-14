class AddIndex < ActiveRecord::Migration
  def change
    add_index :cars, :manufacturer_id, unique: true
  end
end
