require_relative 'enigma'
require_relative 'key_gen'
key_gen = KeyGen.new

message = File.read(ARGV[0]).chomp
key = key_gen.key
date = key_gen.date

encrypted = Enigma.new.encrypt(message, key, date)

File.write(ARGV[1], encrypted[:encryption])

puts "Created #{ARGV[1]} with the key #{key} and date #{date}"
