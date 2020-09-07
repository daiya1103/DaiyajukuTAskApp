class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.references :user, null: false
      t.date :date_of

      t.timestamps
    end
  end
end
