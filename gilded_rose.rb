require_relative './products/normal'
require_relative './products/brie'
require_relative './products/backstage'
require_relative './products/conjured'
require_relative './products/item_product'

module GildedRose
  DEFAULT_CLASS = ItemProduct
  SPECIALIZE_CLASSES = {
    'normal': Normal,
    'Aged Brie': Brie,
    'Backstage passes': Backstage,
    'Conjured Make Cake': Conjured
  } 

  def self.foo(name, quality, days_remaining = nil)
    (SPECIALIZE_CLASSES[name.to_sym] || DEFAULT_CLASS)
      .new(quality, days_remaining)
  end
end

