class AddDefaultValueToCompleteColumn < ActiveRecord::Migration[6.0]
  def change
    change_column :tasks, :complete, :boolean, default: false
  end
end
