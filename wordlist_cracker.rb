#!/usr/bin/env ruby
require 'digest'

    GRN = "\e[32m"
    BLU = "\e[34m"
    YLW = "\e[33m"
    RED = "\e[31m"
    RST = "\e[0m"
    
def brute_all( hash, hashfunc)
    wordlist_dir = "Wordlist/"
    wordlist_files = Dir.glob("#{wordlist_dir}/*.txt")
    if wordlist_files.empty?
        puts "\n#{RED}Error: No Wordlist Files Found In #{wordlist_dir}!#{RST}"
    return
    end
       wordlist_files.each do |file|
           puts "\n#{YLW}Scanning File: #{file}#{RST}"
           File.foreach(file) do |word|
           word.chomp!
           return word if
           hashfunc.call(word) == hash
       end
       nil
   end
   end

#main
def pass_crack()
    begin
       puts "\n#{BLU}Enter Hash String:#{RST}"
       hash = gets.chomp

       puts "\n#{BLU}SELECT HASH FUNCTIONS\n#{RST} #{GRN}[1] MD5\n [2] SHA-1\n [3] SHA-256\n [4] SHA-384\n [5] SHA-512\n#{RST}"
       input = gets.chomp.to_i

   hashfunc = case input
   when 1
       lambda { |word|
       Digest::MD5.hexdigest(word) }

   when 2
       lambda { |word|
       Digest::SHA1.hexdigest(word) }

   when 3
       lambda { |word|
       Digest::SHA256.hexdigest(word) }
   

   when 4
       lambda { |word|
       Digest::SHA384.hexdigest(word) }

   when 5
       lambda { |word|
       Digest::SHA512.hexdigest(word) }

   else
       puts "\n#{RED}Error: Invalid Input!#{RST}"
   end

  result = brute_all( hash, hashfunc)
  puts result ?
   "\n#{GRN}Password Found:#{RST} #{YLW} #{result} #{RST}" : "\n#{RED}Password Not Found!#{RST}"
  end
end
