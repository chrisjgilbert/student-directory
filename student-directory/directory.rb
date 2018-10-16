students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Norman Bates",
  "Michael Corleone",
  "Patrick Bateman",
  "Tyler Durden",
  "Freddy Kreuger",
  "The Joker",
  "Dr No"
]

def print_header
  puts "The Students of Villains Academy"
  puts "===================="
end

def print_list(names)
  names.each { |name| puts name }
end

def print_footer(names)
print "Overall, we have #{names.count} number of great students"
end

print_header
print_list(students)
print_footer(students)
