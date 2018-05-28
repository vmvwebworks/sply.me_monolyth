class AddSessionIdToConversations < ActiveRecord::Migration[5.2]
  def change
    add_column :conversations, :session_id, :string
  end
end
