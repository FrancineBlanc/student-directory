@students = []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = gets.chomp
  until name.empty? do
    @students << {name: name, cohort: :november}
    string = "Now we have #{@students.count}"
    puts @students.count == 1 ? "#{string} student" : "#{string} students"
    name = gets.chomp
  end
end

def print_header
  puts "The students of Villains Academy".center(20)
  puts "--------------".center(30)
end

def print_students_list
  unless @students.empty?
    @students.each_with_index do |student, index| 
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  else
    puts "There are no students in the list to print"
  end
end

def print_footer
  string = "Overall, we have #{@students.count} great"
  puts @students.count == 1? "#{string} student" : "#{string} students"
end

def begins_with
  puts "Please enter the letter that the student name begins with"
  char = gets.downcase.chomp
  matched_names = @students.select { |student| student[:name].downcase.start_with?(char) }
  unless matched_names.empty?
    puts "The following students start with the letter \"#{char.upcase}\""
    puts matched_names
  else 
    puts "No students start with the letter \"#{char.upcase}\"."
  end
end

def shorter_names
  short_names = @students.select { |student| student[:name].length < 12 }
  unless short_names.empty?
    puts "The following students' names are less than 12 characters long:"
    puts short_names
  else
    puts "No students have a name less than 12 characters long."
  end
end

def print_menu
  puts "1. Input the students."
  puts "2. Show the students."
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "9"
    exit
  else
    puts "I don't know what you meant, try again."
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def save_students
  #open the file for writing
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

interactive_menu
