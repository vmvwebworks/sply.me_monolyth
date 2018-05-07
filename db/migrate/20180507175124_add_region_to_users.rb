class AddRegionToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :country_code, :string
    add_column :users, :language, :string
    add_column :users, :price, :decimal
    add_column :users, :currency, :string
  end
end
