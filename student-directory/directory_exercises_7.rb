def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp

  while !name.empty? do
    students << {name: name, cohort: check_for_input(get_cohort)}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end

  students
end

def check_for_input(input)
  input == "" ? "unassigned" : input
end

def get_cohort
  puts "Please enter the name of cohort the student belongs to"
  cohort = gets.chomp
end

def print_header
  puts center_text("The Students of Villains Academy")
end

def print_line_break
  puts center_text("====================")
end

def print_list(students)
  students.each.with_index(1) do |student, index|
    puts center_text("#{index}: #{student[:name]} (#{student[:cohort]} cohort).")
  end
end

def get_first_letter
  puts "Enter the first letter of the names of students you'd like to view"
  letter = gets.chomp
end

def print_footer(students)
  print center_text("Overall, we have #{students.count} number of great students")
end

def center_text(text)
  text.center(170)
end

students = input_students
print_header
print_line_break
print_list(students)
print_line_break
print_footer(students)
