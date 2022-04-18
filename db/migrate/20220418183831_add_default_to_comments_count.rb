class AddDefaultToCommentsCount < ActiveRecord::Migration[6.1]
  def change
    change_column_default(
      :users,
      :comments_count,
      0
    )
  end
end
