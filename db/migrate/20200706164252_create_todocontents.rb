class CreateTodocontents < ActiveRecord::Migration[6.0]
  def change
    create_table :todocontents do |t|
      t.references :todo, null: false
      t.string :todo, null: false
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
