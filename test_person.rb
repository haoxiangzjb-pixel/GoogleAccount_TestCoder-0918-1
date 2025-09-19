require_relative 'person_class'

# Create a new person
person = Person.new("Alice", 30)

# Display the person's information
puts person

# Modify the person's attributes
person.name = "Bob"
person.age = 25

# Display the updated information
puts person