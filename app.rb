Dir['./models/*.rb'].each{ |f| require f }

dbconfig = YAML::load(File.open('database.yml'))
ActiveRecord::Base.establish_connection(dbconfig)

def createSampleProducts

    o = Product.find_by(title: "ipad")
    if o == nil
        puts "Products do not exist, creating..."
        p  = Product.new
        p.title = "ipad"
        p.save
        p p.errors
    else
        puts "Products exist, re-using..."
        puts o
    end

end

def sampleCart
  c = Cart.new
  l = LineItem.new
  l.product = Product.find_by(title: "ipad")
  c.line_items << l
  c.save
  p c.errors
end

def destroyProduct
    puts "Creating  and destroying product"
    p = Product.find_by(title: "ipad")
    p.destroy
    p p.errors
end

def createAndDestroyProduct
    p = Product.new
    p.title = "delete me"
    p.save
    p p.errors
    p.destroy
    p p.errors
end

createSampleProducts
sampleCart
destroyProduct
createAndDestroyProduct

