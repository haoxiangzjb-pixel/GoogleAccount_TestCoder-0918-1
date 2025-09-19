# Generate a random filename
random_num = Random.rand(1000..9999)
filename = "time_output_#{random_num}.cr"

# Crystal program content
program_content = <<-CRYSTAL
# Current time output program
puts "Current time: #{Time.local}"
puts "UTC time: #{Time.utc}"
CRYSTAL

# Write to file
File.write(filename, program_content)
puts "Created Crystal program: #{filename}"

# Compile and run the program
compiled_name = filename.gsub(".cr", "")
status = Process.run("crystal", args: ["build", filename, "-o", compiled_name])
if status.success?
  puts "Compiled program to: #{compiled_name}"
  
  # Run the compiled program
  puts "\\nRunning the program:"
  puts "==================="
  Process.run("./#{compiled_name}")
else
  puts "Compilation failed"
end