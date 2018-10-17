def input_students
  puts "Please enter the names of the students"
  puts "To print the list, press 'print' instead of a student name"
  students = []
  name = check_for_typo(gets.chomp)
  until name == "print"
    students << {name: name, cohort: assigned_cohort?(get_cohort)}
    puts "Now we have #{students.count} students"
    name = check_for_typo(gets.chomp)
  end
  students
end

def check_for_typo(input)
  if input == "print"
    input
  else
    puts "are you sure you want to add #{input}? y/n?"
    answer = gets.chomp
    if answer == "y"
      input
    elsif answer == "n"
      puts "Please re-enter your input..."
      check_for_typo(gets.chomp)
    end
  end
end

def assigned_cohort?(cohort)
  cohort == "" ? "unassigned" : cohort
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
