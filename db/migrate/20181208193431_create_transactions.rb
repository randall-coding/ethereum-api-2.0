class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.string :Thash
      t.string :data

      t.timestamps
    end
  end
end
