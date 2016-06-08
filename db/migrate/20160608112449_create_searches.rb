class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.text :username
      t.integer :gist_id

      t.timestamps null: false
    end
  end
end