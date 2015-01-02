require 'active_record'

class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
end
