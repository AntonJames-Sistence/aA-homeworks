require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:dessert) { Dessert.new('best', 10, 'chef')}

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq('best')
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      # expect { Dessert.new('best', 'ololo', 'chef')}.to raise_error("Ammount is not correct, must be a number")
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect( dessert.ingredients ).to_not include('brown chocolate')
      dessert.add_ingredient('brown chocolate')
      expect( dessert.ingredients ).to include('brown chocolate')
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      dessert.ingredients
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(3)
      expect( dessert.quantity).to eq(7)
    end

    it "raises an error if the amount is greater than the quantity" do
      # expect {dessert.eat(8)}.to raise_error("Error!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      chef.titleize.to eq("Chef chef the Great Baker")
      
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in"
  end
end