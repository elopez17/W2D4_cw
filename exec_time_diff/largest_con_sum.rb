def largest_contiguous_subsum_I(list)
  arrs = []
  #n * n
  list.length.times do |i|
    (i...list.length).each do |j|
      arrs << list[i..j]
    end
  end
  
  max = arrs[0].reduce(0,:+)
  #n * m (sub_arr.length)
  arrs.each do |sub_arr|
    temp = sub_arr.reduce(0,:+)
    if temp > max
      max = temp
    end
  end
  max
end

def largest_contiguous_subsum_II(list)
  # n complexity
  # max_num = list.max
  # max_sum = list[0]
  # curr_sum = list[0]
  # 
  # if list[0] < 0
  #   max_sum = 0
  #   curr_sum = 0
  # end
  # 
  # list[1..-1].each do |num|
  #   if num > 0
  #     curr_sum += num
  #     if curr_sum > max_sum
  #       max_sum = curr_sum
  #     end
  # 
  #   else
  #     if curr_sum > num.abs
  #       curr_sum += num
  #     else
  #       curr_sum = 0
  #     end
  #   end
  # end
  # return max_num if max_sum == 0
  # return max_sum
  
  max_sum = list.first
  curr_sum = 0
  
  list.each do |el|
    curr_sum += el
    max_sum = curr_sum if curr_sum > max_sum
    curr_sum = 0 if curr_sum < 0
  end
  
  max_sum
end