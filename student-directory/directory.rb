# require CSV library
require 'csv'

@students = [] # an empty array accessible to all methods

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def get_filename
  puts "Please enter a filename"
  filename = gets.chomp
end

def save_students
  File.open(get_filename, "w") do |f|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      f.puts(csv_line)
    end
  end
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

def load_students
  filename = get_filename
  if File.exists?(filename)
    File.open(filename, "r").each do |line|
      name, cohort = line.chomp.split(',')
      add_student_to_list(name, cohort.to_sym)
    end
    puts "Loaded #{@students.count} students from #{filename}"
  else
    puts "Sorry, '#{filename}' doesn't exist!"
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save student list to file"
  puts "4. Load the student list from file"
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
  puts "You chose option #{selection}"
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

interactive_menu
