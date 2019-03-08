class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.string :content
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :notes, :users
  end
end
