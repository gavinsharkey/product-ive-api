class ChangeCompleteToCompleted < ActiveRecord::Migration[6.0]
  def change
    rename_column :tasks, :complete, :completed
  end
end
