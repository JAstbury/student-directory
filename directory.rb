# Getting input about the students

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    students = []
    name = gets.gsub("\n", "")
    while !name.empty? do
        puts "What's cohort(month) is #{name} in?"
            month = gets.gsub("\n", "").capitalize
            month = "November" if month == ""
            $months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
            if $months.include?(month) == false 
                puts "Please enter a correct month"
                month = gets.gsub("\n", "")
            end
            cohort = month
        puts "What's #{name}'s DOB? (DD/MM/YYYY)"
            date = gets.gsub("\n", "")
            date = "N/A" if date == ""
        puts "How tall(cm) is #{name}?"
            height = gets.gsub("\n", "")
            height = "N/A" if height == ""
        puts "What's #{name}'s hobbies?"
            hobbies = gets.gsub("\n", "")
            hobbies = "N/A" if hobbies == ""
        students << {name: name, cohort: cohort, dob: date, height: height, hobbies: hobbies}
            if students.count > 1
                puts "Now we have #{students.count} students"
            else
                puts "Now we have #{students.count} student"
            end
        name = gets.gsub("\n", "")
    end
    students
end


def print_header
    puts "The students of Villains Academy".center(60)
    puts "-------------".center(60)
end

def print_names(students)
if students.empty?
    puts "No students have been inputted".center(60)
else
index = 1
$months.each do |month|
    students.each do |student|
        if student[:cohort] == month
           puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort).........hobbies = #{student[:hobbies]}".center(60)
            index += 1
        end
    end
end
end
end



def print_footer(students)
    if !students.empty?
    if students.count == 1
        puts "Overall, we have #{students.count} great student".center(60)
    else
        puts "Overall, we have #{students.count} great students".center(60)
    end
    end
end


#nothing happens until we call the methods
students = input_students
print_header
print_names(students)
print_footer(students)