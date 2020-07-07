class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.references :user, nul: false
      #出品数
      t.integer :exihibits
      #販売数
      t.integer :solds
      #売り上げ
      t.integer :sale
      #利益
      t.integer :profit
      #フリーコメント
      t.text :impress


      t.timestamps
    end
  end
end
