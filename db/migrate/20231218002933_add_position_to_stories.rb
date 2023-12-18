class AddPositionToStories < ActiveRecord::Migration[7.1]
  def change
    add_column :stories, :position, :integer
  end
end
