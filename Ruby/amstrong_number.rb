# Amstrong number - Sum of power n of each digit should equal to number itself where n is number digits number have.

# Amstrong number's logic
# Ex 1: 153 = 1*1*1 + 5*5*5 + 3*3*3

# Valid input's Output:
# $ ruby Ruby/amstrong_number.rb
# > 154
# > This is not an amstrong number
# > closest floor an amstrong number is: 153
# > closest ceil an amstrong number is:  370

# Invalid input's Output:
# $ ruby Ruby/amstrong_number.rb
# > a
# > This is not an amstrong number
# > Invalid input.


class AmstrongNumber
  attr_accessor :number

  def initialize(number)
    @number = number
  end

  def is_amstrong?(number = @number)
    # return false if number is not integer or less than zero
    return false if !number.is_a?(Integer) || number <= 0
    digits = number.digits
    result = 0
    return false if digits.size == 0
    digits.each { |digit| result += (digit * digit * digit) }

    result == number
  end

  def floor_amstrong
    num = @number
    while(num != 0)
      return num if self.is_amstrong?(num)
      num -= 1
    end
    return 'No amstrong number found.'
  end

  def ceil_amstrong
    num = @number
    while(num != 0)
      return num if self.is_amstrong?(num)
      num += 1
    end
    return 'No amstrong number found.'
  end
end

number = gets.chomp.to_i
num = AmstrongNumber.new(number)
if num.is_amstrong?
  puts 'This is an amstrong number.'
else
  puts 'This is not an amstrong number.'
  return (puts 'Invalid input.') if !number.is_a?(Integer) || number <= 0
  puts "closest floor an amstrong number is: #{num.floor_amstrong}"
  puts "closest ceil an amstrong number is:  #{num.ceil_amstrong}"
end
