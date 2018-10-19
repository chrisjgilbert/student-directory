@students = [] # an empty array accessible to all methods

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts(csv_line)
  end
  file.close
end

def add_student_to_list(name, cohort=:november)
  @students << {name: name, cohort: cohort}
end

def input_menu
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
end

def input_students
  input_menu
  name = STDIN.gets.chomp
  while !name.empty? do
    add_student_to_list(name)
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

def load_students(filename= "students.csv")
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_student_to_list(name, cohort.to_sym)
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument given from command line
  return load_students if filename.nil? # get out of method if no argument given
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry #{filename} doesn't exist!"
    exit
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save student list to students.csv"
  puts "4. Load the student list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      puts user_menu_feedback(selection)
      input_students
    when "2"
      puts user_menu_feedback(selection)
      show_students
    when "3"
      puts user_menu_feedback(selection)
      save_students
    when "4"
      puts user_menu_feedback(selection)
      load_students
    when "9"
      puts "Goodbye!"
      exit
    else
      puts "I don't know what you mean. Please try again."
  end
end

def user_menu_feedback(selection)
  puts "You chose #{selection}"
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print_student_list
  @students.each.with_index(1) do |student, index|
    puts "#{index}: #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

try_load_students
interactive_menu
