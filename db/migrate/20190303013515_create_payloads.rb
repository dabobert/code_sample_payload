class CreatePayloads < ActiveRecord::Migration[5.2]
  def change
    create_table :payloads do |t|
      t.string :uuid
      t.string :file
      t.string :mime
      t.integer :filesize
      t.text :descr
      t.datetime :date_uploaded

      t.timestamps
    end
  end
end
