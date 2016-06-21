# Putting all the students into an array


def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end
 
def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    students = []
    name = gets.chomp
    while !name.empty? do
        students << {name: name, cohort: :november}
        puts "Now we have #{students.count} students"
        name = gets.chomp
    end
    students
end


def print_names(students)
students.each.with_index(1) do |student, index|
    if student[:name][0] == "R" && student[:name].length < 12
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
end
end
    
    


def print_footer(students)
    puts "Overall, we have #{students.count} great students"
end


#nothing happens until we call the methods
students = input_students
print_header
print_names(students)
print_footer(students)
