require 'models/Cart'
require 'models/LineItem'
require 'product_service'
require 'yaml'
require 'active_record'

class CartService

  attr_accessor :product_service

  attr_reader :cart

  def create_cart(titles)
    c = Cart.new
    titles.each do |title|
      l = LineItem.new
      l.product = product_service.get_product(title)
      c.line_items << l
    end
    c.save
    p c.errors
    @cart = c
  end
  

  def init_database
    dbconfig = YAML::load(File.open('database.yml'))
    ActiveRecord::Base.establish_connection(dbconfig)
  end
end
