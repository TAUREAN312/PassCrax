#!/usr/bin/env ruby
require './wordlist_cracker'
require './pass_analyzer'
require './salt_crack'
begin
   grn = "\e[32m"
   blu = "\e[34m"
   ylw = "\e[33m"
   red = "\e[31m"
   rst = "\e[0m"
   loop do

   pass_analyze()

  
   puts "\n#{blu}SELECT ONE\n#{rst}#{grn} [1]Salted Password Cracker\n [2]Pure Password Cracker#{rst}"
   slct = gets.chomp.to_i

       case slct
       when 1
           salt_crack()

       when 2
           pass_crack()

       else
           puts "\n#{red}Error: Invalid Input!#{rst}"
   end
   end

rescue Interrupt
    puts "\n#{red}Terminated By User!#{rst}"
end
