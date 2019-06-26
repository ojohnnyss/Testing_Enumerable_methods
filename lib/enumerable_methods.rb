my_proc = Proc.new { |x| x + 1 }
module Enumerable
   def my_each
     for i in self
       yield(i)
     end
   end
	
   def my_each_with_index
     for i in 0..self.length-1
       yield(self[i], i)
     end
   end
	
  def my_select
    output = self.class.new
    self.my_each do |x, y = nil|
      if yield(x) == true
        if output.class == Hash
    output[x] = y
        else
    output.push(x)
        end
       end
     end
     return output	  
  end
	
  def my_all?
    out = true
    self.my_each do |x|
      if yield(x) == false
        out = false
        break
      end  
    end
    return out	  
  end	

  def my_any?
    out = false
    self.my_each do |x|
      if yield(x) == true
        out = true
        break
      end
    end
    return out	  
  end	

  def my_none?
    out = true
    self.my_each do |x|
      if yield(x) == true
        out = false
        break
      end
    end
    return out		
  end	
  
end
