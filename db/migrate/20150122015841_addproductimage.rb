class Addproductimage < ActiveRecord::Migration
  def change
  	add_attachment :plans, :image
  end
end
