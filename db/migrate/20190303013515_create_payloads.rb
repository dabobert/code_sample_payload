class CreatePayloads < ActiveRecord::Migration[5.2]
  def change
    create_table :payloads do |t|
      t.string :uuid, null: false, index: true
      t.string :file
      t.string :mime
      t.string :owner_email, null: false
      t.integer :filesize
      t.text :descr
      t.datetime :date_uploaded
      t.references :user, index: true

      t.timestamps
    end
  end
end
