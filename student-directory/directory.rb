# put the students in an array
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
# print the list of students
puts "The Students of Villains Academy"
puts "===================="
students.each { |student| puts student }
# then print the total number of students
print "Overall, we have #{students.count} number of great students"
