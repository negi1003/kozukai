class CreateCosts < ActiveRecord::Migration
  def self.up
    create_table :costs do |t|
      t.integer :price, :null => false, :limit => 7
      t.integer :item_id, :null => false
      t.string :subject, :null => false, :limit => 25
      t.date :date, :null => false
      t.integer :user_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :costs
  end
end
