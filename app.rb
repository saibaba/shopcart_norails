Dir['./models/*.rb'].each{ |f| require f }

dbconfig = YAML::load(File.open('database.yml'))
ActiveRecord::Base.establish_connection(dbconfig)

def createSampleProducts
  p  = Product.new
  p.title = "ipad"
  p.save
end

def sampleCart
  c = Cart.new
  l = LineItem.new
  l.product = Product.find(1)
  c.line_items << l
  c.save
end

#LineItem.new.save
#createSampleProducts
sampleCart
