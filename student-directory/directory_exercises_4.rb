students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Norman Bates", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Patrick Bateman", cohort: :november},
  {name: "Tyler Durden", cohort: :november},
  {name: "Freddy Kreuger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Dr No", cohort: :november}
]

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get first name
  name = gets.chomp
  while !name.empty? do
    # add students to array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return students array
  students
end

def print_header
  puts "The Students of Villains Academy"
  puts "===================="
end

def print_list(students)
  accumulator = 0
  student = 0
  index = 1
  while accumulator < students.length
    puts "#{index}: #{students[student][:name]} (#{students[student][:cohort]} cohort)"
    accumulator += 1
    student += 1
    index += 1
  end
end

def get_first_letter
  puts "Enter the first letter of the names of students you'd like to view"
  letter = gets.chomp
end

def print_footer(students)
print "Overall, we have #{students.count} number of great students"
end

def print_list_by_name_length(students)
    students.each.with_index(1) do |student, index|
    if student[:name].length < 12
      puts "#{index}: #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

students = input_students
print_header
print_list(students)
print_footer(students)
