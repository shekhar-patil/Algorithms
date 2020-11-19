# Armstrong number - Sum of power n of each digit should equal to number itself where n is number digits number have.

# Armstrong number's logic
# Ex 1: 153 = 1*1*1 + 5*5*5 + 3*3*3

# Valid input's Output:
# $ ruby Ruby/armstrong_number.rb
# > 154
# > This is not an armstrong number
# > closest floor an armstrong number is: 153
# > closest ceil an armstrong number is:  370

# Invalid input's Output:
# $ ruby Ruby/armstrong_number.rb
# > a
# > This is not an armstrong number
# > Invalid input.


class ArmstrongNumber
  attr_accessor :number

  def initialize(number)
    @number = number
  end

  def is_armstrong?(number = @number)
    # return false if number is not integer or less than zero
    return false if !number.is_a?(Integer) || number <= 0
    digits = number.digits
    result = 0
    return false if digits.size == 0
    digits.each { |digit| result += (digit * digit * digit) }

    result == number
  end

  def floor_armstrong
    num = @number
    while(num != 0)
      return num if self.is_armstrong?(num)
      num -= 1
    end
    return 'No Armstrong number found.'
  end

  def ceil_armstrong
    num = @number
    while(num != 0)
      return num if self.is_armstrong?(num)
      num += 1
    end
    return 'No Armstrong number found.'
  end
end

number = gets.chomp.to_i
num = ArmstrongNumber.new(number)
if num.is_armstrong?
  puts 'This is an armstrong number.'
else
  puts 'This is not an Armstrong number.'
  return (puts 'Invalid input.') if !number.is_a?(Integer) || number <= 0
  puts "closest floor an armstrong number is: #{num.floor_armstrong}"
  puts "closest ceil an armstrong number is:  #{num.ceil_armstrong}"
end
