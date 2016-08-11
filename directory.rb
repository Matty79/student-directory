@students = []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #get the first name and string alternative to .chomp
  name = STDIN.gets.delete("\n")
  #while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    puts "cohort?"
    cohort = STDIN.gets.chomp
    cohort == "" ? cohort = "august" : cohort
    input_into_array(name, cohort)
    if @students.count == 1
      puts "Now we have #{@students.count} student."
    else
      puts "Now we have #{@students.count} students."
    end
    # get another name from the user
    name = STDIN.gets.chomp
  end
  # return the array of students
  @students
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print_students
  count = 0
  while @students.length >= count+1
    puts "#{@students[count][:name]} (#{@students[count][:cohort]} cohort)".center(50)
    count+=1
  end
end

#code by malimichael slightly refactored
def print_by_cohort(students)
  cohort_sorted = students.group_by {|e| e[:cohort]}
  cohort_sorted.each do |k,v|
    puts '-'*50
    puts "#{k}: ".center(50) + " "
    v.each do |student|
      puts "#{student[:name]}" + " "
      puts ''
    end
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students".center(50)
end

def specific_letter
 puts "What's the first letter of the names you want to see?"
 letter = STDIN.gets.chomp
 @students.each.with_index do |student, index|
   if student[:name][0] == letter
     puts "#{index+1}.#{student[:name]} (#{student[:cohort]} cohort)"
   end
 end
end

def short_names
 puts "List of names shorter than 12 characters"
 students.each.with_index do |student, index|
   if student[:name].length < 12
     puts "#{index+1}.#{student[:name]} (#{student[:cohort]} cohort)"
   end
 end
end

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
  puts "9. Exit" # 9 because we'll be adding more items
end

def process(selection)
  case selection
  when "1"
    @students = input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
  puts "I don't know what you meant, try again"
  end
end

def show_students
  print_header
  print_students
  print_footer
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "Students have been saved to students.csv"
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
  input_into_array(name, cohort)
  end
  file.close
  puts "Students have been loaded from " + filename
end

def try_load_students(filename = "students.csv")
  filename = ARGV.first # first argument from the command line
  if filename.nil? ; load_students
    puts "Loaded #{@students.count} from default file"
  elsif File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def input_into_array(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

try_load_students
interactive_menu
if @students.empty?
abort("You haven't entered any students. Program will now quit")
end
