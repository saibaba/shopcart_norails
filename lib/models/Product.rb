require 'active_record'

class Product < ActiveRecord::Base
  has_many :line_items
  before_destroy :ensure_zero_references

  private
    def ensure_zero_references
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end
end
