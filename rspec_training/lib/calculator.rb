class Calculator
  def add(*args)
    args.sum
  end

  def multiply(*args)
    args.inject(:*)
  end

  def subtract(*args)
    if args.length == 1
      return args[0]
    else
      init = args.shift
      args.each { |num| init = init - num }
      return init
    end
  end

  def divide(number, divisor)
    if divisor == 0
      'cannot divide by zero'
    else
      return number/divisor
    end
  end
end