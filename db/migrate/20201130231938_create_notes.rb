class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :name
      t.text :json_content
      t.references :noteable, polymorphic: true

      t.timestamps
    end
  end
end
