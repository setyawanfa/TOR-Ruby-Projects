# frozen_string_literal: true
def fibs_rec(num)
  if num == 1
    0
  elsif num == 2
    1
  else
    fibs_rec(num-1)+fibs_rec(num-2)
  end
end

def fibs(num)
  res = [0,1]
  i=1
  for a in 2..(num-1) do
    res.push(res[a-1]+res[a-2])
  end
  res
end

p fibs_rec(8)
p fibs(8)
