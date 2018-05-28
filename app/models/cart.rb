class Cart < ApplicationRecord
  has_many :cart_items
  def add_product(product_params)
    current_item = cart_items.find_by(product_id: product_params[:cart_items][:product_id])
    if current_item
      # current_item.quantity += product_params[:cart_items][:quantity].to_i
      current_item.save
    else
      new_item = cart_items.create(product_id: product_params[:cart_items][:product_id],
                                  cart_id: self.id)
                                  # quantity: product_params[:cart_items][:quantity],
    end
    new_item
  end
end
