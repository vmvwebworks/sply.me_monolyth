class CreateJoins < ActiveRecord::Migration[5.2]
  def change
    create_table :joins do |t|
      t.belongs_to :user
      t.belongs_to :join_list
      t.timestamps
    end
  end
end
