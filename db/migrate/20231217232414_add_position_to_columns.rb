class AddPositionToColumns < ActiveRecord::Migration[7.1]
  def change
    add_column :columns, :position, :integer
  end
end
