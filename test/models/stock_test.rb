require 'test_helper'

class StockTest < ActiveSupport::TestCase
  def setup
    @stock = Stock.new(name: "Example", stock: 1, unit: "g")
  end

  test "should be valid" do
    assert @stock.valid?
  end
end
