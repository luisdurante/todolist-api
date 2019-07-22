class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.integer :list_id
      t.string :description
      t.integer :priority

      t.timestamps
    end
  end
end
