class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false
      t.string :nickname
      t.date :enrollment_date
      t.integer :target
      t.text :theme

      t.timestamps
    end
  end
end
