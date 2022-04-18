class AddDefaultToLikesCount < ActiveRecord::Migration[6.1]
  def change
    change_column_default(
      :users,
      :likes_count,
      0
    )
  end
end
