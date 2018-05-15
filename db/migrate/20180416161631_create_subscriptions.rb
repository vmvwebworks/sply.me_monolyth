class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.belongs_to :user
      t.datetime :period_end
      t.timestamps
    end
  end
end
