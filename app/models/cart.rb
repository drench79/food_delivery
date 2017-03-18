class Cart < ApplicationRecord
  has_many :line_items, dependent: destroy
  belongs_to :place
  belongs_to :user

  def add_dish(dish_id)
    current_item = line_items.find_by(dish_id: dish_id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(dish_id: dish_id)
    end
    current_item
  end
end
