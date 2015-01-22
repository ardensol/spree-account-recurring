class Addproductimage < ActiveRecord::Migration
  def change
  	add_attachment :spree_plans, :image
  end
end
