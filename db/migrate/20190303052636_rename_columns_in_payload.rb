class RenameColumnsInPayload < ActiveRecord::Migration[5.2]
  def up
    rename_column :payloads, :filesize, :file_size
    rename_column :payloads, :mime, :content_type
  end

  def down
    rename_column :payloads, :file_size, :filesize
    rename_column :payloads, :content_type, :mime
  end
end
