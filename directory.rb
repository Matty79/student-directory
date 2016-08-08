def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  #get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  count = 0
  while students.length >= count+1
    puts "#{students[count][:name]} (#{students[count][:cohort]} cohort)"
    count+=1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
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
specific_letter(students)
short_names(students)
