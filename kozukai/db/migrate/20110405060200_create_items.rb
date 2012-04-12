class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :name, :null => false, :limit => 20
      t.string :color_code, :null => false, :limmit => 6, :default => "ffffff"
      t.integer :default_price, :limit => 7, :default => 0
      t.integer :order, :null => false, :default => 0
      t.integer :user_id,:null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
