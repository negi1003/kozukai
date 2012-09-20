class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.integer :cutoff_date ,:null => false
      t.integer :user_id, :null => false

      t.timestamps
    end
  end
end
