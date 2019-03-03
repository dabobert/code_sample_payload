class RenameDateUploadedToUploadedAt < ActiveRecord::Migration[5.2]
  def up
    rename_column :payloads, :date_uploaded, :uploaded_at
  end

  def down
    rename_column :payloads, :uploaded_at, :date_uploaded
  end
end
