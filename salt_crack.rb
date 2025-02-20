#!/usr/bin/env ruby

require 'digest'
#This script is meant to
#Salt and hash words in a file
#Compare them to the hashstring for answer

def brute_all(wordlist,  hash, hashfunc)
       File.foreach(wordlist) do |word|
           word.chomp!
           return word if
           hashfunc.call(word) == hash
       end
       nil
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
   salt = gets.chomp
   puts "\n#{blu}Enter Salted Hash String:#{rst}"
    hash = gets.chomp
    puts "\n#{blu}Enter Wordlist Filename:#{rst}"
    wordlist = gets.chomp
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
   
       result = brute_all(wordlist, hash, hashfunc)
   puts result ?
   "#{grn}Password Found:#{rst} #{ylw} #{result} #{rst}" : "#{red}Password Not Found!#{rst}"

rescue Errno::ENOENT
       puts "#{red}Error: Wordlist file not found!#{rst}"
       exit
     end
end
