#!/usr/bin/env ruby

# Generate a hash with contact information
contact_info = {
  name: "Juan Pérez",
  email: "juan.perez@example.com",
  phone: "+1-555-123-4567",
  address: {
    street: "Calle Principal 123",
    city: "Ciudad Ejemplo",
    country: "País Ejemplo",
    zip_code: "12345"
  },
  social_media: {
    twitter: "@juanperez",
    linkedin: "juan-perez-profile"
  },
  notes: "Cliente importante"
}

# Generate a random filename
random_filename = "contact_#{Time.now.to_i}_#{rand(1000..9999)}.rb"

# Save the hash to the file
File.open(random_filename, 'w') do |file|
  file.puts "# Contact Information - Generated on #{Time.now}"
  file.puts "CONTACT_INFO = #{contact_info.inspect}"
end

puts "Contact information saved to: #{random_filename}"
puts "Content:"
puts contact_info