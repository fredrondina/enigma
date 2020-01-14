require_relative 'enigma'

encrypted_message = File.read(ARGV[0]).chomp
key = ARGV[2].to_s
date = ARGV[3].to_s

decrypted_message = Enigma.new.decrypt(encrypted_message, key, date)
File.write(ARGV[1], decrypted_message[:decryption])

puts "Created #{ARGV[1]} with the key #{key} and the date #{date}"
