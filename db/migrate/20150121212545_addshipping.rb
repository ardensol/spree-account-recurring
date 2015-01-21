class Addshipping < ActiveRecord::Migration
  def change
  	add_column :spree_subscriptions, :full_name, :string
  	add_column :spree_subscriptions, :address_line_1, :string
  	add_column :spree_subscriptions, :address_line_2, :string
  	add_column :spree_subscriptions, :city, :string
  	add_column :spree_subscriptions, :state, :string
  	add_column :spree_subscriptions, :postal_code, :string
  	add_column :spree_subscriptions, :country, :string
  end
end
