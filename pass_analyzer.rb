#!/usr/bin/env ruby
require 'base64'

begin
def pass_analyze
    grn = "\e[32m"
    blu = "\e[34m"
    ylw = "\e[33m"
    red = "\e[31m"
    rst = "\e[0m"
  
puts "\n#{blu}Enter Hash String For Analysis:#{rst}"
hash = gets.chomp

case hash.length
when 32
    puts "\n#{grn}The Hash String Is#{rst} #{ylw} MD5#{rst}"

when 40
    puts "\n#{grn}The Hash String Is#{rst} #{ylw} SHA1#{rst}"
when 64
    puts "\n#{grn}The Hash String Is#{rst} #{ylw} SHA256#{rst}"

when 96
   puts "\n#{grn}The Hash String Is#{rst} #{ylw} SHA384#{rst}"

when 128
    puts "\n#{grn}The Hash String Is#{rst} #{ylw} SHA512#{rst}"

else
    puts "\n#{red}Error: Unknown Hash Format!#{rst}"
    puts "\n#{grn}Decoding Hash String {Maybe Base64 Encoded}...#{rst}"
    decoded = Base64.strict_decode64(hash)
        puts "\n#{grn}Base64 Decoded Hash String:#{rst} #{ylw}#{decoded}#{rst}\n"

end
rescue ArgumentError
    puts "\n#{red}Error: Hash String Isn't Base64 Encoded!#{rst}"
    end
end
