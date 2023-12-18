class AddColumnToStories < ActiveRecord::Migration[7.1]
  def change
    add_reference :stories, :column, null: false, foreign_key: true
  end
end
