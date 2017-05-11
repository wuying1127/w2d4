require 'byebug'

class Array

  def my_min
    min = self.first
    self.each do |num|
      min = num if num < min
    end
    min
  end

  def max
    max = self.first
    self.each_with_index do |num1,idx1|
      self.each_with_index do |num2,idx2|
        next if idx2 < idx1
        # debugger
        to_comp = self[idx1..idx2].reduce(:+)
        if to_comp > max
          max = to_comp
        end
      end
      # self.shift
    end
    max
  end

  def max2
    return self.max if self.all? {|el| el < 0 }
    max = self.first
    current_sum = self.first
    self.each_with_index do |el, idx|
      # debugger
      next if idx == 0
      if current_sum + el < el
        current_sum = el
      else
        current_sum += el
      end
      max = current_sum if current_sum > max
   end
    max
  end




end
