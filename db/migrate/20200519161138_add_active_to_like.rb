class AddActiveToLike < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :active, :boolean, default: true
  end
end
