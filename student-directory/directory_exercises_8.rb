def input_students
  students = []
  num_of_students = 0
  puts "Please enter the names of the students."
  puts "To print the list, press 'print' instead of a student name."
  name = check_for_typo(gets.chomp)
  until name == "print"
    students << {name: name, cohort: valid_cohort?(get_cohort)}
    num_of_students += 1
    show_student_count(num_of_students)
    puts "Please enter the name of the next student or 'print' to print the list."
    name = check_for_typo(gets.chomp)
  end
  students
end

def show_student_count(num_of_students)
  if num_of_students == 1
    puts "Now we have just #{num_of_students} student."
  else
    puts "Now we have #{num_of_students} students."
  end
end

def check_for_typo(input)
  if input == "print"
    input
  else
    puts "are you sure you want to add '#{input}'? y/n?"
    answer = gets.chomp
    if answer == "y"
      input
    elsif answer == "n" || answer == ""
      puts "Please re-enter the name of the student..."
      check_for_typo(gets.chomp)
    end
  end
end

def valid_cohort?(cohort_input)
  valid_cohorts = [
    "jan", "feb", "mar",
    "apr", "may", "jun",
    "jul", "aug", "sept",
    "oct", "nov", "dec"
  ]
  if valid_cohorts.include?(cohort_input)
    cohort_input
  else
    puts "Please enter a valid cohort."
    cohort = valid_cohort?(gets.chomp)
  end
end

def get_cohort
  puts "Please enter the name of cohort the student belongs to ('jan', 'feb', 'mar', 'apr', 'may', 'jun', 'jul', 'aug', 'sept', 'oct', 'nov', 'dec')"
  cohort = gets.chomp
end

def print_header
  puts center_text("The Students of Villains Academy")
  puts center_text("====================")
end

def print_list(students)
  students.each.with_index(1) do |student, index|
    puts center_text("#{index}: #{student[:name]} (#{student[:cohort]} cohort).")
  end
end

def print_list_by_cohort(students)
  puts "Enter the name of the cohort you would like to view"
  cohort = valid_cohort?(gets.chomp)
  print_header
  students.each.with_index(1) do |student, index|
    if student[:cohort] == cohort
      puts center_text("#{index}: #{student[:name]} (#{student[:cohort]} cohort)")
    end
  end
  students
end

def print_footer(students)
  if students.count == 1
    print center_text("Overall, we have just #{students.count} great student.")
  else
    print center_text("Overall, we have #{students.count} great students.")
  end
end

def center_text(text)
  text.center(170)
end

students = input_students
print_list_by_cohort(students)
print_footer(students)
