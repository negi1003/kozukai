class CreateCosts < ActiveRecord::Migration
  def self.up
    create_table :costs do |t|
      t.integer :price, :null => false, :limit => 7
      t.integer :item_id, :null => false
      t.string :subject, :null => false, :limit => 25
      t.integer :year, :null => false, :limit => 4
      t.integer :month, :null => false, :limit => 2
      t.integer :day, :null => false, :limit => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :costs
  end
end
