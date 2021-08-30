require "test/unit"
require_relative './gilded_rose'

class GildedRoseTest < Test::Unit::TestCase
  # normal_tick
  def test_normal_tick
    item = GildedRose.foo('normal', 10, 5)
    item.tick

    assert_equal 9, item.quality
    assert_equal 4, item.days_remaining
  end

  def test_normal_tick_days_remaining_passed
    item = GildedRose.foo('normal', 10, 0)
    item.tick

    assert_equal 8, item.quality
    assert_equal -1, item.days_remaining
  end

  def test_normal_tick_equal_zero
    item = GildedRose.foo('normal', 0, 5)
    item.tick

    assert_equal 0, item.quality
    assert_equal 4, item.days_remaining
  end

  # brie_tick
  def test_brie_tick
    item = GildedRose.foo('Aged Brie', 9, 6)
    item.tick

    assert_equal 10, item.quality
    assert_equal 5, item.days_remaining
  end

  def test_brie_tick_days_remaining_passed
    item = GildedRose.foo('Aged Brie', 7, 0)
    item.tick

    assert_equal 9, item.quality
    assert_equal -1, item.days_remaining
  end

  def test_brie_tick_equal_50
    item = GildedRose.foo('Aged Brie', 50, 5)
    item.tick

    assert_equal 50, item.quality
    assert_equal 4, item.days_remaining
  end

  # sulfuras_tick
  def test_sulfuras_tick
    item = GildedRose.foo('Sulfuras, Hand of Ragnaros', 10)
    item.tick

    assert_equal 10, item.quality
  end

  # backstage_tick
  def test_backstage_tick
    item = GildedRose.foo('Backstage passes', 7, 12)
    item.tick

    assert_equal 8, item.quality
    assert_equal 11, item.days_remaining
  end

  def test_backstage_tick_quality_more_50
    item = GildedRose.foo('Backstage passes', 50, 5)
    item.tick
    
    assert_equal 50, item.quality
    assert_equal 4, item.days_remaining
  end

  def test_backstage_tick_days_remaining_passed
    item = GildedRose.foo('Backstage passes', 8, 0)
    item.tick

    assert_equal 0, item.quality
    assert_equal -1, item.days_remaining
  end

  def test_backstage_tick_days_remaining_equal_ten
    item = GildedRose.foo('Backstage passes', 5, 10)
    item.tick

    assert_equal 7, item.quality
    assert_equal 9, item.days_remaining
  end

  def test_backstage_tick_days_remaining_equal_five
    item = GildedRose.foo('Backstage passes', 5, 5)
    item.tick

    assert_equal 8, item.quality
    assert_equal 4, item.days_remaining
  end

  # Conjured_tick
  def test_conjured_tick
    item = GildedRose.foo('Conjured Make Cake', 10, 3)
    item.tick

    assert_equal 8, item.quality
    assert_equal 2, item.days_remaining
  end

  def test_conjured_tick_quality_equal_zero
    item = GildedRose.foo('Conjured Make Cake', 0, 5)
    item.tick

    assert_equal 0, item.quality
    assert_equal 4, item.days_remaining
  end

  def test_conjured_tick_days_remaining_equal_zero
    item = GildedRose.foo('Conjured Make Cake', 10, 0)
    item.tick

    assert_equal 6, item.quality
    assert_equal -1, item.days_remaining 
  end
end