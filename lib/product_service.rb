require 'yaml'
require 'active_record'
require 'models/Product'
require 'models/Cart'
require 'models/LineItem'

class ProductService

  def get_product(title)
    o = Product.find_by(title: title)
  end

  def create_product(title)
    o = get_product(title)
    if o == nil
        puts "Products do not exist, creating..."
        p  = Product.new
        p.title = title
        p.save
        p p.errors
    else
        puts "Products exist, re-using..."
        puts o
    end
    return o
  end

  def destroy_product(p)
    p.destroy
    p p.errors
  end
 
end
