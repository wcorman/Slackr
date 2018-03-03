class CreateSlacks < ActiveRecord::Migration[5.1]
  def change
    create_table :slacks do |t|
      t.integer :prod_time
      t.integer :unprod_time
      t.integer :sleep_time
      t.timestamps
    end
  end
end
