class ReplaceSearchesGistIdField < ActiveRecord::Migration
  def change
    change_column :searches, :gist_id, :text
  end
end
