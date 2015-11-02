class AddToAndFromToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :to, :string
    add_column :messages, :from, :string
    remove_column :messages, :text
    add_column :messages, :body, :text
  end
end
