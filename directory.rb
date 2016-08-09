def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  def_cohort = :august
  students = []
  #get the first name
  name = gets.chomp
  #spellcheck stolen from tommy williams
  puts "Is #{name} spelt correctly? y/n"
spell = gets.chomp.downcase
until spell == "n" || spell == "y"
  puts "You didn't enter 'y' or 'n', please re-enter:"
  spell = gets.chomp.downcase
end
while spell == "n"
  puts "Please re-enter the name spelt correctly:"
  name = gets.chomp
  puts "Is #{name} spelt correctly? y/n"
  spell = gets.chomp.downcase
until spell == "n" || spell == "y"
  puts "You didn't enter 'y' or 'n', please re-enter:"
  spell = gets.chomp.downcase
  end
end
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
    students << {name: name, cohort: cohort, hobby: hobby, nationality: nationality}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print(students)
  count = 0
  while students.length >= count+1
    puts "#{students[count][:name]} (#{students[count][:cohort]} cohort) likes #{students[count][:hobby]} nationality is #{students[count][:nationality]}".center(50)
    count+=1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(50)
end

def specific_letter(students)
 puts "What's the first letter of the names you want to see?"
 letter = gets.chomp
 students.each.with_index do |student, index|
   if student[:name][0] == letter
     puts "#{index+1}.#{student[:name]} (#{student[:cohort]} cohort)"
   end
 end
end

def short_names(students)
 puts "List of names shorter than 12 characters"
 students.each.with_index do |student, index|
   if student[:name].length < 12
     puts "#{index+1}.#{student[:name]} (#{student[:cohort]} cohort)"
   end
 end
end

#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
puts student_sort(students)
