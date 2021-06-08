class SeperateItemsInCart < ActiveRecord::Migration[6.0]
  def down
      # split items with quantity>1 into multiple items
      LineItem.where("quantity>1").each do |item|

        # add individual items
        item.quantity.times do
          LineItem.create(cart_id: item.cart_id,
            product_id: item.product_id, quantity: 1)
        end

        # remove original item
        item.destroy
      end
    end
  end
