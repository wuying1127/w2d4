require "byebug"

class String


  def permutation
    return self if self.length == 1
    # letters = str_to_arr(self)
    letters = self.chars
    first = letters.shift
    perms = letters.permutation
    permutations = []
    perms.each do |block|
      (block.count+1).times do |i|
        # debugger
        permutations << (block[0...i] + [first] + block[i..-1]).join
      end
    end
    permutations
  end

  def str_to_arr(str)
    letters = []
    str.chars.(length+1).times do |i|
      letters << [str.chars[i]]
    end
    letters
  end

  def second_anagram(search_word)
      search_word = search_word.chars
      new_self = self.dup.chars
      (0...new_self.length).each do |i|
          break if i == (new_self.length - 1)
          popped = new_self.pop
        search_word.each_with_index do |el2,idx2|
          if el2 == popped
            search_word[idx2] = nil
            break
          end
        end
      end

      new_self.length == search_word.compact.length ? true : false
  end

  def third_anagram(search_word)
    search_word = search_word.chars.sort
    new_self = self.dup.chars.sort
    search_word == new_self
  end

  def fourth_anagram(search_word)
    hash = {}
    self.chars.each do |el|
      if hash[el]
        hash[el] += 1
      else
        hash[el] = 1
      end
    end

    hash2 = {}
    search_word.chars.each do |el2|
      if hash2[el]
        hash2[el] += 1
      else
        hash2[el] = 1
      end
    end

    hash == hash2 
  end



end


def anagram(word, search_word)
  word.permutation.include?(search_word)
end
