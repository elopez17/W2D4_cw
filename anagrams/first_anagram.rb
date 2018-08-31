
def shift_idx(arrs)
  result = []
  arrs.each do |arr|
    result << arr
    (1...arr.length).each do |i|
      result << arr[i..-1] + arr[0...i]
    end
  end
  result
end

def perm(arr)
  return [ [ arr[0], arr[1] ], [ arr[1], arr[0] ] ] if arr.length == 2
  nested = perm(arr[1..-1])
  anchor = arr[0]
  combo = []
  nested.each do |nest|
    combo << [anchor] + nest
  end
  shift_idx(combo)
end

def first_anagram?(str1, str2)# => !n
  if str1.length <= 1
    return false unless str1 == str2
    return true
  end
  arr = perm(str1.split(//))
  str2 = str2.split(//)
  arr.include?(str2)
end

def second_anagram?(str1, str2)#  n ^ 2
  str1 = str1.split(//)
  str2 = str2.split(//)
  str1.each do |chr|
    index = str2.find_index(chr)
    if index
      str2.delete_at(index)
    else
      return false
    end
  end
  str2.empty?
end

def third_anagram?(str1, str2)
  str1 = str1.split(//).sort!
  str2 = str2.split(//).sort!
  str1 == str2
end


def fourth_anagram?(str1,str2)
  counterHash = Hash.new() {|h,k| h[k] = 0}
  str1.each_char do |chr|
    counterHash[chr] += 1
  end
  
  counterHash.keys.each do |key|
    if str2.count(key) != counterHash[key]
      return false
    end
  end
  return true
end

