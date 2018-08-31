def my_min_I(list)
  list.each do |el1|
    min = true
    list.each do |el2|
      min = false if el2 < el1
    end
    return el1 if min
    
  end
end

def my_min_II(list)
  min = list[0]
  list.each do |el|
    min = el if el < min
  end
  min
end