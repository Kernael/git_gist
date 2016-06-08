class AddForksToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :forks, :boolean, default: false
  end
end
