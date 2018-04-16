class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :payer
      t.string :provider
      t.decimal :ammount
      t.string :currency
      t.decimal :minutes
      t.boolean :state
      t.timestamps
    end
  end
end
