# Putting all the students into an array
students = [
    "Dr. Hannibal Lecter",
    "Darth Vader",
    "Nurse Ratched",
    "Michael Corleone",
    "Alex DeLarge",
    "The Wicked Witch of the West",
    "Terminator",
    "Freddy Krueger",
    "The Joker",
    "Joffrey Baratheon",
    "Norman Bates"
    ]
    
#Printing all the students 
puts "The students of Villains Academy"
puts "-------------"
students.each do |student|
    puts student
end


# Printing the total number of students
print "Overall, we have #{students.count} great students"