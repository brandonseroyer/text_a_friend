class CreateContactsMessages < ActiveRecord::Migration
  def change
    create_table :contacts_messages do |t|
      t.integer :contact_id
      t.integer :message_id

      t.timestamps
    end
  end
end
