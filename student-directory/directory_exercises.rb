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
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
print "Overall, we have #{students.count} number of great students"
end

students = input_students
print_header
print_list(students)
print_footer(students)
