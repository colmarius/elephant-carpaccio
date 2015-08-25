require 'spec_helper'
require 'retail_calculator'

RSpec.describe RetailCalculator do

  def calculate(*args)
    RetailCalculator.calculate(*args)
  end

  describe "Simple Inputs" do

    it "1 item => output 1" do
      expect(calculate(1)).to eq(1)
    end

    it "3 items => output 3" do
      expect(calculate(3)).to eq(3)
    end

    it "3 items x 1$ price => output 3$" do
      expect(calculate(3, 1)).to eq(3)
    end

    it "3 items x 5$ price => output 15$" do
      expect(calculate(3, 5)).to eq(15)
    end
  end

  describe "Discounts" do

    it "10 items x 200$ price => 3% discount for > $1000" do
      expected_result = (10 * 200) * 0.97
      expect(calculate(10, 200)).to eq(expected_result)
    end

    it "100 items x 600$ price => 5% discount for > $5000" do
      expected_result = (100 * 600) * 0.95
      expect(calculate(100, 600)).to eq(expected_result)
    end
  end

  describe "Taxes" do

    it "3 items x 5$ price x UT state 6.85% => output 13.9725$" do
      expected_result = (3 * 5) * (1 - 0.0685)
      expect(calculate(3, 5, 'UT')).to eq(expected_result)
    end
  end

  describe "Discounts + Taxes" do
  end
end
