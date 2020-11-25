class CreateUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :url_records do |t|
      t.text :original_url, null: false
      t.text :uuid, null: false, default: 'uuid_generate_v4()'
      t.integer :counter, null: false, default: 0

      t.timestamps
    end

    add_index(:url_records, :original_url, unique: true)
    add_index(:url_records, :uuid, unique: true)
  end
end
