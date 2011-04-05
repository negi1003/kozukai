class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :name, :null => false, :limit => 20
      t.integer :order, :null => false, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
