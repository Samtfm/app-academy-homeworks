require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:dessert) { Dessert.new("cake", 10, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("cake")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end


    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("cake", "19", chef) }.to raise_error(ArgumentError)
    end

  end

  describe "#add_ingredient" do
    before (:each) do
      dessert.add_ingredient("squid")
    end
    it "adds an ingredient to the ingredients array" do
      expect(dessert.ingredients).to eq(["squid"])
    end
  end

  describe "#mix!" do
    before (:each) do
      dessert.add_ingredient("a")
      dessert.add_ingredient("b")
      dessert.add_ingredient("c")
      dessert.add_ingredient("d")
      dessert.mix!
    end
    it "shuffles the ingredient array" do
      expect(dessert.ingredients).to_not eq(["a", "b", "c", "d"])
      expect(dessert.ingredients.sort).to eq(["a", "b", "c", "d"])
    end
  end

  describe "#eat" do
    before(:each) { dessert.eat(8) }
    it "subtracts an amount from the quantity" do
      expect(dessert.quantity).to eq(2)
    end
    it "raises an error if the amount is greater than the quantity" do
      expect { dessert.eat(100) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(dessert.serve).to include(chef.titleize)
    end

  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end


  end
end
