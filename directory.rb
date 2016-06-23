@students = []

@months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
   end
end

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "4. Load the list from students.csv"
    puts "9. Exit"
end

def process(selection)
    case selection
        when "1"
            input_students
        when "2"
            show_students
        when "3"
            save_students
        when "4"
            load_students
        when "9"
            exit
        else
            puts "Please enter a valid option."
    end
end


def show_students
    print_header
    print_students_list
    print_footer
end
    

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    name = STDIN.gets.chomp
    while !name.empty? do
        puts "What's cohort(month) is #{name} in?"
            month = STDIN.gets.chomp.capitalize
            month = "November" if month == ""
            if @months.include?(month) == false 
                puts "Please enter a correct month"
                month = STDIN.gets.chomp
            end
            cohort = month
        puts "What's #{name}'s DOB? (DD/MM/YYYY)"
            date = STDIN.gets.chomp
        add_to_students(name, cohort, date)
            if @students.count > 1
                puts "Now we have #{@students.count} students"
            else
                puts "Now we have #{@students.count} student"
            end
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
index = 1
@months.each do |month|
    @students.each do |student|
        if student[:cohort] == month
           puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)..........DOB: #{student[:date]}".center(100)
            index += 1
        end
    end
end
end
end


def print_footer
    if !@students.empty?
    if @students.count == 1
        puts "\n" + "Overall, we have #{@students.count} great student".center(100)
    else
        puts "\n" + "Overall, we have #{@students.count} great students".center(100)
    end
    end
end

def save_students
    file = File.open("students.csv", "w")
     @students.each do |student|
         student_data = [student[:name], student[:cohort], student[:date]]
         csv_line = student_data.join(',')
         file.puts csv_line
    end
    file.close
end
    
def load_students(filename = "students.csv")
    #@students = []
    file = File.open(filename, "r")
    file.readlines.each do |line|
        name, cohort, date = line.chomp.split(',')
        add_to_students(name, cohort, date)
    end
    file.close
end

def try_load_students
    filename = ARGV.first
    if filename.nil?
        load_students("students.csv")
        puts "Loaded #{@students.count} from students.csv"
    elsif File.exists?(filename)
        load_students(filename)
        puts "Loaded #{@students.count} from #{filename}"
    else
        puts "Sorry, #{filename} doesn't exist"
        exit
    end
end

def add_to_students(name, cohort, date)
     @students << {name: name, cohort: cohort, date: date}
end
    
    

try_load_students
interactive_menu
