class FixArticleTitleName < ActiveRecord::Migration
  def change
    rename_column :articles, :titlle, :title
  end
end
