# Putting all the students into an array


def print_header
    puts "The students of Villains Academy".center(60)
    puts "-------------".center(60)
end
 
def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    students = []
    name = gets.chomp
    while !name.empty? do
        puts "What's cohort(month) is #{name} in?"
            month = gets.chomp.capitalize
            month = "November" if month == ""
            if ("January February March April May June July August September October November December").include?(month) == false 
                puts "Please enter a correct month"
                month = gets.chomp
            end
            cohort = month
        puts "What's #{name}'s DOB? (DD/MM/YYYY)"
            date = gets.chomp
            date = "N/A" if date == ""
        puts "How tall(cm) is #{name}?"
            height = gets.chomp 
            height = "N/A" if height == ""
        puts "What's #{name}'s hobbies?"
            hobbies = gets.chomp
            hobbies = "N/A" if hobbies == ""
        students << {name: name, cohort: cohort, dob: date, height: height, hobbies: hobbies}
            puts "Now we have #{students.count} students"
        name = gets.chomp
    end
    students
end



def print_names(students)

index = 0

while index < students.length
    student = students[index]
    if (student[:name][0] == "R") && (student[:name].length < 12)
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort).........hobbies = #{student[:hobbies]}".center(60)
    end
    index += 1
end

end
    
    

def print_footer(students)
    puts "Overall, we have #{students.count} great students".center(60)
end


#nothing happens until we call the methods
students = input_students
print_header
print_names(students)
print_footer(students)
