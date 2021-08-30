require_relative './item_product'

class Backstage < ItemProduct
  def tick
    @days_remaining -= 1
    return if quality >= 50
    return @quality = 0 if days_remaining < 0

    @quality += 1
    @quality += 1 if days_remaining < 10
    @quality += 1 if days_remaining < 5
  end
end