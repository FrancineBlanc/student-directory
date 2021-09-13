def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
  end
  #return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

def print(students)
  students.each_with_index do |student, index| 
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def begins_with(students)
  puts "Please enter the letter that the student name begins with"
  char = gets.downcase.chomp
  puts students.select { |student| student[:name].downcase.start_with?(char) }
end

def shorter_names(students)
  puts students.select { |student| student[:name].length < 12 }
end


students = input_students
# nothing happens until the methods are called
print_header
print(students)
print_footer(students)
begins_with(students)
shorter_names(students)
