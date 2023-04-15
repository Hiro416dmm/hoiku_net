class AddStarToDaycares < ActiveRecord::Migration[6.1]
  def change
    add_column :daycares, :star, :string
  end
end
