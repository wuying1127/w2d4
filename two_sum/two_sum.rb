require 'byebug'


  def bad_two_sum(array,target)
    array.each_with_index do |el1,idx1|
      array.each_with_index do |el2, idx2|
        break if idx2 < idx1
        return true if el1 + el2 == target
      end
    end
      false 
  end
