def get_input_new
  puts "\nWelcome to the Ruby Calculator\n\n"
  print "Enter first number: "
  first_num = $stdin.gets.strip
  if first_num == "0"
    zero_input = true
  else
    zero_input = false
  end
  first_num = first_num.to_f
  check_input_num(first_num, zero_input)
  print "Enter operator (+, -, *, or /): "
  operator1 = $stdin.gets.strip
  check_input_operator(operator1)
  print "Enter second number: "
  second_num = $stdin.gets.strip
  if second_num == "0"
    zero_input = true
  else
    zero_input = false
  end
  second_num = second_num.to_f
  check_input_num(second_num, zero_input)
  calculate1(first_num, operator1, second_num)
end

def check_input_num(num, zero_input)
  if(num == 0) && (!zero_input)
    puts "Entry must be a number. Please try again."
    get_input_new
  end
end

def check_input_operator(operator1)
  valid_ops = ["+", "-", "*", "/"]
  unless valid_ops.include?(operator1)
    puts "Invalid operator. Please try again."
    get_input_new
  end
end

def calculate1(first_num, operator1, second_num)
  case operator1
  when "+"
    result1 = first_num + second_num
    puts "\n#{first_num} + #{second_num} = #{result1}"
    post_result_option(result1)
  when "-"
    result1 = first_num - second_num
    puts "\n#{first_num} - #{second_num} = #{result1}"
    post_result_option(result1)
  when "*"
    result1 = first_num * second_num
    puts "\n#{first_num} * #{second_num} = #{result1}"
    post_result_option(result1)
  when "/"
    result1 = first_num / second_num
    puts "\n#{first_num} / #{second_num} = #{result1}"
    post_result_option(result1)
  end
end

def post_result_option(result1)
  print "\n(1) Clear and enter another calculation \n(2) Use result for another operation \n(3) Quit \n\nEnter option: "
  option1 = $stdin.gets.strip
  case option1
  when "1"
    get_input_new
  when "2"
    get_input_use_result(result1)
  when "3"
    puts "\nThanks for using the Ruby Calculator.\n\n"
    exit
  else
    puts "Invalid option."
    post_result_option(result1)
  end
end

def get_input_use_result(result1)
  print "\nEnter operator to apply to previous result (#{result1}) (+, -, *, or /): "
  operator1 = $stdin.gets.strip
  check_input_operator(operator1)
  print "Enter second number: "
  second_num = $stdin.gets.strip
  if second_num == "0"
    zero_input = true
  else
    zero_input = false
  end
  second_num = second_num.to_f
  check_input_num(second_num, zero_input)
  calculate1(result1, operator1, second_num)
end

get_input_new
