class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :payer_id
      t.string :provider_id
      t.decimal :ammount
      t.string :currency
      t.decimal :minutes
      t.string :state
      t.timestamps
    end
  end
end
