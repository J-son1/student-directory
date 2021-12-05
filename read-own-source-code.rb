# An exercise to write a program that reads its own source code
# and prints it on the screen.

filename = $0
File.open(filename, "r") do |file|
  file.readlines.each do |line|
    puts line
  end
end