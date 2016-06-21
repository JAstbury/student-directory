# Getting input about the students

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    students = []
    name = gets.chomp
    while !name.empty? do
        puts "What's cohort(month) is #{name} in?"
            month = gets.chomp.capitalize
            month = "November" if month == ""
            $months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
            if $months.include?(month) == false 
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
            if students.count > 1
                puts "Now we have #{students.count} students"
            else
                puts "Now we have #{students.count} student"
            end
        name = gets.chomp
    end
    students
end


def print_header
    puts "The students of Villains Academy".center(60)
    puts "-------------".center(60)
end

def print_names(students)
index = 1
$months.each do |month|
    students.each do |student|
        if student[:cohort] == month
            if (student[:name][0] == "R") && (student[:name].length < 12)
                puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort).........hobbies = #{student[:hobbies]}".center(60)
            end
            index += 1
        end
    end
end
end


    

def print_footer(students)
    if students.count == 1
        puts "Overall, we have #{students.count} great student".center(60)
    else
        puts "Overall, we have #{students.count} great students".center(60)
    end
end


#nothing happens until we call the methods
students = input_students
print_header
print_names(students)
print_footer(students)