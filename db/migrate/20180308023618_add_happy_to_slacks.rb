class AddHappyToSlacks < ActiveRecord::Migration[5.1]
  def change
    add_column :slacks, :happy, :integer
  end
end
