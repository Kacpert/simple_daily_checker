class CreateEpicks < ActiveRecord::Migration[6.1]
  def change
    create_table :epicks do |t|
      t.string :name
      t.boolean :status

      t.timestamps
    end
  end
end
