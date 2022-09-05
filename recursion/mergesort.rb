# frozen_string_literal: true

def merge_sort(arr)
  if arr.length > 1
    mid = arr.length / 2
    left = arr[0...mid]
    right = arr[mid..arr.length]
    merge(merge_sort(left), merge_sort(right))
  else
    arr
  end
end

def merge(left, right)
  result = []
  while (left.size + right.size)>0 
    if left.empty?
      result.push(right.shift)
    elsif right.empty?
      result.push(left.shift)
    else
      if left.first <= right.first
        result.push(left.shift)
      else
        result.push(right.shift)
      end
    end
  end
  result
end

p merge_sort([3, 4, 2, 1, 7, 5, 9, 0, 6])
