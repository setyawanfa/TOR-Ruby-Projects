def bubble_sort(input)
  return input if input.length <=1
  swapped = true
  idx = 0;
  while swapped do
    swapped = false
    for idx in 0..(input.length-2) do
      if input[idx]>input[(idx+1)] 
        input[idx],input[(idx+1)] = input[(idx+1)],input[idx]
        swapped=true
      end
    end
   end
  
  input

  


end

p bubble_sort([4,3,78,2,0,2])
