@students = []

def print_menu
  puts "1. Input the students."
  puts "2. Show the students."
  puts "3. Save the students list to a nominated file"
  puts "4. Load the list from a nominated file"
  puts "5. Display students beginning with a particular letter"
  puts "6. Display students with short names"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1" then input_students
  when "2" then show_students
  when "3" then save_students
  when "4" then load_students
  when "5" then begins_with
  when "6" then shorter_names
  when "9" then exit
  else puts "I don't know what you meant, try again."
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  until name.empty? do
    add_students(name, :november)
    string = "Now we have #{@students.count}"
    puts @students.count == 1 ? "#{string} student" : "#{string} students"
    name = STDIN.gets.chomp
  end
end

def add_students(name, cohort)
  @students << {name: name, cohort: cohort}
end

def show_students
  print_header
  print_students_list
  print_footer
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

def save_students
  puts "Please enter the file name to save to"
  filename = STDIN.gets.chomp
  File.open(filename, "w") do |file|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      line = student_data.join(",")
      file.puts line
    end
  end
end

def load_students
  puts "Please enter the file to load from"
  filename = STDIN.gets.chomp
  get_students(filename)
end

def try_load_students
  filename = ARGV.first
  filename ||= "students.csv"
  if File.exist?(filename)
    get_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
end

def get_students(filename)
  File.open(filename, "r") do |file|
    file.readlines.each do |line|
      name, cohort = line.chomp.split(",")
      add_students(name, cohort.to_sym)
    end
  end
end

def begins_with
  puts "Please enter the letter that the student name begins with"
  char = STDIN.gets.downcase.chomp
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

try_load_students
interactive_menu
