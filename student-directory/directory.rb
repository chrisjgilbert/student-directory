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

print_header
print_list(students)
print_footer(students)
