class RemoveOrderFromColumns < ActiveRecord::Migration[7.1]
  def change
    remove_column :columns, :order, :integer
  end
end
