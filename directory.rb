def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  @students = []
  #get the first name and string alternative to .chomp
  name = gets.delete("\n")
  #while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    puts 'hobby?'
    hobby = gets.chomp
    puts 'nationality?'
    nationality = gets.chomp
    puts "cohort?"
    cohort = gets.chomp
    cohort == "" ? cohort = "august" : cohort
    cohort.to_sym
    @students << {name: name, cohort: cohort, hobby: hobby, nationality: nationality}
    if @students.count == 1
      puts "Now we have #{@students.count} student."
    else
      puts "Now we have #{@students.count} students."
    end

    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  @students
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print
  count = 0
  while @students.length >= count+1
    puts "#{@students[count][:name]} (#{@students[count][:cohort]} cohort) likes #{@students[count][:hobby]} nationality is #{@students[count][:nationality]}".center(50)
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
 letter = gets.chomp
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
    # 1. print the menu and ask the user what to do
    print_menu
# 9 because we'll be adding more items
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
    when "1"
      #input the students
      @students = input_students
    when "2"
      # show the students
      show_students
    when "3"
      save_students
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  print
  print_footer
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

#nothing happens until we call the methods
interactive_menu
if @students.empty?
abort("You haven't entered any students. Program will now quit")
end
