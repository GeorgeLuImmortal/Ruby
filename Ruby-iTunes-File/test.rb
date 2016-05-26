require 'benchmark'
require 'Set'

class Array
  # The original method we're looking to improve upon
  # The method is intended to clean up an array of strings by separating each string
  # into individual words and then generating a new Array consisting of only unique
  # words.  The idea is to improve upon the original method in performance and/or 
  # memory consumption
  def clean_up_old
    self.join(' ').split().uniq
  end

  # This one uses a Set as Sets don't allow duplicates, it removes the need for uniq
  # on the output array.  This one is slower than the original, probably because the
  # merging of Sets for each element in the original Array takes more time than just
  # calling uniq once on the output Array at the end.  However, this should use less
  # memory than the original as the Set will only contain unique words from the 
  # input array meaning it will be a subset of the input array.
  def clean_up_new_1
    unique = Set.new
    self.each {
        |words|
      unique.merge(words.split)
    }
    unique.to_a
  end

  # This one uses a Hash which also does not allow duplicates (keys) so I'm using it
  # to store each unique word as a key and setting the value for that key to nil.  
  # This should use up less memory again when compared to the original but it's still
  # slower
  def clean_up_new_2
    unique = Hash.new
    self.each {
        |words|
      words.split.each {
          |word|
        unique[word] = nil
      }
    }
    unique.keys
  end

  # This one uses the Array method 'flat_map' which returns an Enumerator for the
  # input Array's elements and splits each String entry, then returns only the
  # unique entries from the result.  This is close in performance to the original
  # but in my opinion it is less readable although it may use less memory.
  def clean_up_new_3
    self.flat_map(&:split).uniq
  end

  # This one moves through the original Array using inject to process
  # each element containing space-separated words and appending them
  # to a new array.  Finally uniq is called to remove duplicate words
  def clean_up_new_4
    self.inject([]) {
        |array, item|
      array.push(*item.split)
    }.uniq
  end

  # This one uses inject to move through the Array, appending each string entry
  # to the previous ones with a space in between, finally splitting into a new
  # Array and using uniq to remove duplicates
  def clean_up_new_5
    self.inject() {
        |a, b|
      a += ' ' + b
    }.split.uniq
  end

end

list = [
  "a b c", "a b d c d w a l d i q p", "c q v w f j", "c d", "x y z", "a c x r d u", "d o g", "g l a s s", "p l u g", "d o o r",
  "a b c", "a b d c d w a l d i q p", "c q v w f j", "c d", "x y z", "a c x r d u", "d o g", "g l a s s", "p l u g", "d o o r", "a b c",
  "a b d c d w a l d i q p", "c q v w f j", "c d", "x y z", "a c x r d u", "d o g", "g l a s s", "p l u g", "d o o r", "a b c",
  "a b d c d w a l d i q p", "c q v w f j", "c d", "x y z", "a c x r d u", "d o g", "g l a s s", "p l u g", "d o o r", "a b c",
  "a b d c d w a l d i q p", "c q v w f j", "c d", "x y z", "a c x r d u", "d o g", "g l a s s", "p l u g", "d o o r", "a b c",
  "a b d c d w a l d i q p", "c q v w f j", "c d", "x y z", "a c x r d u", "d o g", "g l a s s", "p l u g", "d o o r", "a b c",
  "a b d c d w a l d i q p", "c q v w f j", "c d", "x y z", "a c x r d u", "d o g", "g l a s s", "p l u g", "d o o r", "a b c",
  "a b d c d w a l d i q p", "c q v w f j", "c d", "x y z", "a c x r d u", "d o g", "g l a s s", "p l u g", "d o o r", "a b c",
  "a b d c d w a l d i q p", "c q v w f j", "c d", "x y z", "a c x r d u", "d o g", "g l a s s", "p l u g", "d o o r", "a b c",
  "a b d c d w a l d i q p", "c q v w f j", "c d", "x y z", "a c x r d u", "d o g", "g l a s s", "p l u g", "d o o r", "a b c",
  "a b d c d w a l d i q p", "c q v w f j", "c d", "x y z", "a c x r d u", "d o g", "g l a s s", "p l u g", "d o o r", "a b c",
  "a b d c d w a l d i q p", "c q v w f j", "c d", "x y z", "a c x r d u", "d o g", "g l a s s", "p l u g", "d o o r", "a b c",
  "a b d c d w a l d i q p", "c q v w f j", "c d", "x y z", "a c x r d u", "d o g", "g l a s s", "p l u g", "d o o r", "a b c",
  "a b d c d w a l d i q p", "c q v w f j", "c d", "x y z", "a c x r d u", "d o g", "g l a s s", "p l u g", "d o o r", "a b c",
  "a b d c d w a l d i q p", "c q v w f j", "c d", "x y z", "a c x r d u", "d o g", "g l a s s", "p l u g", "d o o r", "a b c",
  "a b d c d w a l d i q p", "c q v w f j", "c d", "x y z", "a c x r d u", "d o g", "g l a s s", "p l u g", "d o o r", "a b c",
  "a b d c d w a l d i q p", "c q v w f j", "c d", "x y z", "a c x r d u", "d o g", "g l a s s", "p l u g", "d o o r", "a b c",
  "a b d c d w a l d i q p", "c q v w f j", "c d", "x y z", "a c x r d u", "d o g", "g l a s s", "p l u g", "d o o r", "a b c",
  "a b d c d w a l d i q p", "c q v w f j", "c d", "x y z", "a c x r d u", "d o g", "g l a s s", "p l u g", "d o o r", "a b c",
  "a b d c d w a l d i q p", "c q v w f j", "c d", "x y z", "a c x r d u", "d o g", "g l a s s", "p l u g", "d o o r", "a b c",
  "a b d c d w a l d i q p", "c q v w f j", "c d", "x y z", "a c x r d u", "d o g", "g l a s s", "p l u g", "d o o r", "a b c",
]

i =0
while i<30000 #get a list whose words are repeating 
       i=i+1
     list<<list[i/5]
end


puts "                    user       "+"system      "+"total        "+"real    "
puts "old      method  "+Benchmark.measure{list.clean_up_old}.to_s          #output the new's running time
puts "new      method1  "+Benchmark.measure{list.clean_up_new_1}.to_s
puts "new      method2  "+Benchmark.measure{list.clean_up_new_2}.to_s
puts "new      method3  "+Benchmark.measure{list.clean_up_new_3}.to_s
puts "new      method4  "+Benchmark.measure{list.clean_up_new_4}.to_s
puts "new      method5  "+Benchmark.measure{list.clean_up_new_5}.to_s