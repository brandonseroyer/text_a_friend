class CreateContact < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :number

      t.timestamps
    end
  end
end
