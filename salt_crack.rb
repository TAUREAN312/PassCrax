#!/usr/bin/env ruby

require 'digest'

def brute_all(hash, hashfunc)
    ylw = "\e[33m"
    red = "\e[31m"
    rst = "\e[0m"
    wordlist_dir = "Wordlist/"
    wordlist_files = Dir.glob("#{wordlist_dir}*.txt")
    if wordlist_files.empty?
        puts "\n#{red}Error: No Files Found In #{wordlist_dir}#{rst}"
    return
   end
    wordlist_files.each do |file|
        puts "\n#{ylw}Scanning File: #{file}...#{rst}"
        
       File.foreach(file) do |word|
           word.chomp!
           return word if
           hashfunc.call(word) == hash
       end
       nil
   end
   end
  
  #main
def salt_crack()
    grn = "\e[32m"
    blu = "\e[34m"
    ylw = "\e[33m"
    red = "\e[31m"
    rst = "\e[0m"
begin
   puts "\n#{blu}Enter Salt:#{rst}"
   salt = gets.chomp.strip.downcase
   puts "\n#{blu}Enter Salted Hash String:#{rst}"
    hash = gets.chomp.strip.downcase
   puts "\n#{blu}SELECT HASH FUNCTIONS\n#{rst} #{grn}[1] MD5\n [2] SHA-1\n [3] SHA-256\n [4] SHA-384\n [5] SHA-512\n#{rst}"
   input = gets.chomp.to_i

   hashfunc = case input
   when 1
   lambda { |word|
   Digest::MD5.hexdigest(salt + word) }


   when 2
   lambda { |word|
   Digest::SHA1.hexdigest(salt + word) }
   

   when 3
   lambda { |word|
   Digest::SHA256.hexdigest(salt + word) }
   

   when 4
   lambda { |word|
   Digest::SHA384.hexdigest(salt + word) }

   when 5
   lambda { |word|
   Digest::SHA512.hexdigest(salt + word) }
   
   else
   puts "\n#{red}Error: Invalid Input!#{rst}"
   end
   
       result = brute_all(hash, hashfunc)
   puts result ?
   "\n#{grn}Password Found:#{rst} #{ylw} #{result} #{rst}" : "\n#{red}Password Not Found!#{rst}"
   
     end
end
