require 'csv'

@students = [] # an empty array accessible to all methods
@default_filename = "students.csv"

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list"
  puts "4. Load a list"
  puts "5. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  puts "You chose option #{selection}"
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    filename = get_filename
    load_students(filename)
  when "5"
    exit
  else 
    puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    add_student_to_list(name, "november")
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

def add_student_to_list(name, cohort) # _to_list added to method name for clarity
  @students << {name: name, cohort: cohort.to_sym}
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  filename = get_filename # get filename from user
  CSV.open(filename, "w") do |csv|
    @students.each do |student|
      csv << [student[:name], student[:cohort]]
    end
  end

  puts "Saved #{@students.count} to #{filename}" # add feedback message
end

def load_students(filename = @default_filename)
  CSV.foreach(filename) do |row|
    name, cohort = row
    add_student_to_list(name, cohort)
  end
  puts "Loaded #{@students.count} from #{filename}"
end

def get_filename
  puts "Please enter a filename"
  filename = STDIN.gets.chomp
  filename.empty? ? filename = @default_filename : filename
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  if filename.nil? # load students.csv by default if it isn't given
    filename = "students.csv"
    load_students(filename)
  elsif File.exists?(filename) # if it exists
    load_students(filename)
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

try_load_students
interactive_menu