class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.references :taskable, polymorphic: true
      t.references :parent_task
      t.string :name
      t.boolean :complete

      t.timestamps
    end
  end
end
