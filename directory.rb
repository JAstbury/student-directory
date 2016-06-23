@students = []
@months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]


#Loops printing menu and getting user choice
def interactive_menu
  loop do
    print_menu
    user_choice(STDIN.gets.chomp)
   end
end

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "4. Load the list from students.csv"
    puts "9. Exit"
end

def user_choice(selection)
    case selection
        when "1"
            input_students
        when "2"
            show_students
        when "3"
            puts "What file do you want to save to?"
            save_students(STDIN.gets.chomp)
        when "4"
            puts "What file do you want to load from?"
            load_students(STDIN.gets.chomp)
        when "9"
            puts "Program exitted"
            exit
        else
            puts "Please enter a valid option."
    end
end

#Prints out the list of students
def show_students
    print_header
    print_students_list
    print_footer
end
    
#Adds a new student
def input_students
    puts "Please enter the names of the students \nTo finish, hit return twice"
    name = STDIN.gets.chomp
    
    while !name.empty? do
        
        puts "What's cohort(month) is #{name} in?"
            month = STDIN.gets.chomp.capitalize
            #Sets default month to November
            month = "November" if month == ""
            while @months.include?(month) == false 
                puts "Please enter a correct month"
                month = STDIN.gets.chomp
            end
            cohort = month
        
        puts "What's #{name}'s DOB? (DD/MM/YYYY)"
            date = STDIN.gets.chomp
        
        add_to_students(name, cohort, date)
            puts "Now we have #{@students.count} student#{@students.count == 1 ? '' : 's'}"

        name = STDIN.gets.chomp
    end
end


def print_header
    puts "The Students of Villains Academy".center(100,".")
    puts "..........".center(100,".")
    puts
end


def print_students_list
if @students.empty?
    puts "No students have been inputted".center(100)
else
#Arranges students by cohort
index = 1
@months.each do |month|
    @students.each do |student|
        if student[:cohort] == month
           puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)..........DOB: #{student[:date]}".center(100)
            index += 1
        end; end; end
end
end


def print_footer
    if !@students.empty?
        puts "\n" + "Overall, we have #{@students.count} great student#{@students.count == 1 ? '' : 's'}".center(100)
    end
end

def save_students(filename)
    File.open(filename, "w") do |file|
     @students.each do |student|
         student_data = [student[:name], student[:cohort], student[:date]]
         csv_line = student_data.join(',')
         file.puts csv_line
    end
    end
    puts "Saved #{@students.count} to #{filename}"
end
    
def load_students(filename)
    filename = "students.csv" if filename == ""
    while !File.exists?(filename)
    puts "Sorry, #{filename} doesn't exist. Please enter the correct file..."
    filename = STDIN.gets.chomp
    end
    File.open(filename, "r") do |file|
    file.readlines.each do |line|
        name, cohort, date = line.chomp.split(',')
        add_to_students(name, cohort, date)
    end
    end
    puts "Loaded #{@students.count} from #{filename}"
end

def try_load_students
    filename = ARGV.first
    if filename.nil?
        load_students("students.csv")
    elsif File.exists?(filename)
        load_students(filename)
    else
        puts "Sorry, #{filename} doesn't exist."
        exit
    end
end

def add_to_students(name, cohort, date)
     @students << {name: name, cohort: cohort, date: date}
end
    
    
try_load_students
interactive_menu