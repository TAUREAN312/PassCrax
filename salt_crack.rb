#!/usr/bin/env ruby

require 'digest'
#This script is meant to
#Salt and hash words in a file
#Compare them to the hashstring for answer

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
  def brute_md5(wordlist, salt, hash)
       File.foreach(wordlist) do |word|
           word.chomp!
           return word if
           Digest::MD5.hexdigest(salt + word) == hash
       end
       nil
   end

   def brute_sha256(wordlist, salt,  hash)
       File.foreach(wordlist) do |word|
           word.chomp!
           return word if
           Digest::SHA256.hexdigest(salt + word) == hash
       end
       nil
   end

   def brute_sha1(wordlist, salt, hash)
       File.foreach(wordlist) do |word|
           word.chomp!
           return word if
           Digest::SHA1.hexdigest(salt + word) == hash
       end
       nil
   end

   def brute_sha384(wordlist, salt, hash)
       File.foreach(wordlist) do |word|
           word.chomp!
           return word if
           Digest::SHA384.hexdigest(salt + word) == hash
       end
       nil
   end

   def brute_sha512(wordlist, salt, hash)
       File.foreach(wordlist) do |word|
           word.chomp!
           return word if
           Digest::SHA512.hexdigest(salt + word) == hash
       end
       nil
   end
   case input
   when 1
    result = brute_md5(wordlist, salt, hash)
   puts result ?
   "#{grn}Password Found:#{rst} #{ylw} #{result} #{rst}" : "#{red}Password Not Found!#{rst}"

   when 2
    result = brute_sha1(wordlist, salt, hash)
   puts result ?
   "#{grn}Password Found:#{rst} #{ylw}#{result}#{rst}" : "#{red}Password Not Found!#{rst}"
   

   when 3
    result = brute_sha256(wordlist, salt, hash)
   puts result ?
   "#{grn}Password Found:#{rst} #{ylw}#{result}#{rst}" : "#{red}Password Not Found!#{rst}"
   

   when 4
    result = brute_sha384(wordlist, salt, hash)
   puts result ?
   "#{grn}Password Found:#{rst} #{ylw} #{result}#{rst}" : "#{red}Password Not Found!#{rst}"

   else
    result = brute_sha512(wordlist, salt, hash)
   puts result ?
   "#{grn}Password Found:#{rst} #{ylw}#{result}#{rst}" : "#{red}Password Not Found!#{rst}"
   end
end
rescue Errno::ENOENT
       puts "#{red}Error: Wordlist file not found!#{rst}"
       exit
end
