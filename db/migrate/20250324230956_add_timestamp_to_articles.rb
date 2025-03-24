class AddTimestampToArticles < ActiveRecord::Migration[8.0]
  def change
    # adding a column - add_column :table_name, :column_name, :data_type
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime
  end
end
