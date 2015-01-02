require 'test_helper'
require 'cart_service'
require 'product_service'
require 'init'

class TestCart < Minitest::Test
  def setup
    @product_service = ProductService.new
    @cart_service = CartService.new
    @cart_service.product_service = @product_service
    @cart_service.init_database
  end

  def test_all
    cart = @cart_service.create_cart(['ipad'])
    assert_equal 1, cart.line_items.length
  end

  def test_create_and_destroy_product
    p = @product_service.create_product('ipad')
    assert_equal 'ipad', p.title
    @product_service.destroy_product(p)
  end

end
