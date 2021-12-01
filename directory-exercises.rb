def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array.
  students = []
  # get the first name.
  name = gets.chomp
  # while the name is not empty, repeat this code.
  while !name.empty? do
    # add student hobbies.
    puts "Enter #{name}'s hobbies"
    puts "To finish, just hit return twice"
    hobbies = []
    # get first hobby.
    hobby = gets.chomp.downcase
    while !hobby.empty? do
      hobbies << hobby
      puts "#{name} has #{hobbies.count} hobbies"
      # get another hobby from the user.
      hobby = gets.chomp.downcase
    end

    # add student country of birth.
    puts "Enter #{name}'s country of birth"
    country_of_birth = gets.chomp.capitalize

    # add the student hash to the array.
    students << {name: name, cohort: :november, hobbies: hobbies, country_of_birth: country_of_birth, height: nil}
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "Please enter the name of the next student"
    puts "Or, hit return to finish"
    name = gets.chomp
  end
  # return the array of students.
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  puts "Please enter the first letter of the names you'd like printed."
  letter = gets.chomp.upcase

  i, number = 0, 1
  while i < students.count do
    if students[i][:name].chr == letter and students[i][:name].length < 12
      puts "#{number}. #{students[i][:name]} (#{students[i][:cohort]} cohort)"
      number += 1
    end
  i += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)