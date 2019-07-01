# enumerable_methods_spec.rb
require './lib/enumerable_methods'

RSpec.describe Enumerable do
  let(:array1) {[1, 2, 3, 4, 5]}
  let(:array2) {[61, 72, 83, 94, 105]}
  let(:array3) {['Kyiv', 'London', 'Los-Angeles']}
    
  describe "#my_each" do
    it "return an array itself" do
      expect(array1.my_each{|x| x}).to eql(array1)
    end
	
    it "return array3 in upcase" do
      expect(array3.my_each{|x| x}).to eq(['Kyiv', 'London', 'Los-Angeles'])
    end
  end
  
  describe "#my_each_with_index" do
    it "return array's index for array3" do
      index = []
      array3.my_each_with_index{|x,i| index << i}
      expect(index).to eql([0, 1, 2])
    end
	
    it "return array's index for array2" do
      index = []
      array2.my_each_with_index{|val, i| index << i}
      expect(index).to eql([0,1,2,3,4])
    end
     
  end
  
  describe "#my_select" do
    it "return even number from an array" do
      b = array2.my_select{|x| x % 2 == 0}
      expect(b).to eq([72, 94])
    end

    it "return numbers bigger than 80" do
      b = array2.my_select{|x| x > 80}
      expect(b).to eql([83, 94, 105])
    end

    it "get empty array if empty block given" do
      expect(array1.my_select{}).to eql([])
    end
	
	it "return array3's numbers in upcase" do
	  c = []
	  array3.my_select{|x| c << x.upcase}
      expect(c).to eql(["KYIV", "LONDON", "LOS-ANGELES"])
    end
	      
  end
  
  describe "#my_all?" do
    it "return true if all array1's number are all postive" do
      expect(array1.my_all?{|x| x > 0}).to be true
    end

    it "return true if word's length >= 4" do
      expect(array3.my_all?{|x| x.length >= 4}).to be true
    end
    
  end

  describe "#my_any?" do
    it "return false if one of them bigger than 5" do
      expect(array1.my_any?{|x| x>5}).to be false
    end
	
  end

  describe "#my_none?" do
    it "return true if none of them are smaller then zero" do
      expect(array1.my_none?{|x| x < 0}).to be true
    end
	
    it "return true if array has no string 'Paris'" do
      expect(array3.my_none?{|x| x = "Paris"}).to be true
    end
       	
  end

end
  
