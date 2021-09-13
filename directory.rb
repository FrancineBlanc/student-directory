def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  until name.empty? do
    students << {name: name, cohort: :november}
    string = "Now we have #{students.count}"
    puts students.count == 1 ? "#{string} student" : "#{string} students"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy".center(20)
  puts "--------------".center(30)
end

def print(students)
  unless students.empty?
    students.each_with_index do |student, index| 
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  else
    puts "There are no students in the list to print"
  end
end

def print_footer(names)
  string = "Overall, we have #{names.count} great"
  puts names.count == 1? "#{string} student" : "#{string} students"
end

def begins_with(students)
  puts "Please enter the letter that the student name begins with"
  char = gets.downcase.chomp
  matched_names = students.select { |student| student[:name].downcase.start_with?(char) }
  unless matched_names.empty?
    puts "The following students start with the letter \"#{char.upcase}\""
    puts matched_names
  else 
    puts "No students start with the letter \"#{char.upcase}\"."
  end
end

def shorter_names(students)
  short_names = students.select { |student| student[:name].length < 12 }
  unless short_names.empty?
    puts "The following students' names are less than 12 characters long:"
    puts short_names
  else
    puts "No students have a name less than 12 characters long."
  end
end


students = input_students
print_header
print(students)
print_footer(students)
puts
begins_with(students)
puts
shorter_names(students)
