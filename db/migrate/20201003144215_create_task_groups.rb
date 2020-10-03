class CreateTaskGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :task_groups do |t|
      t.belongs_to :user
      t.string :name

      t.timestamps
    end
  end
end
