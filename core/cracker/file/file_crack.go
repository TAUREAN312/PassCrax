package file

import(
"passcrax/core/cracker"
)

import (
 "fmt"
 "os"
 "bufio"
 "strings"
 "time"
 )
 
 const (
    borng = "\033[1;38;5;208m"
    bgrn = "\033[1;32m"
	bblu = "\033[1;34m"
	bred = "\033[1;31m"
	bylw = "\033[1;33m"
	grn = "\033[32m"
	blu = "\033[34m"
	ylw = "\033[33m"
	red = "\033[31m"
	orng = "\033[38;5;208m"
	rst = "\033[0m"
)
 
func DictFile(hashFile string, hashtype string, outputFile string) string {
  filename, err := os.OpenFile(hashFile, os.O_RDWR, 0755)
  if err != nil {
  fmt.Printf("\n%s[!] Error: %s%s", bred, err, rst)
  }
  defer filename.Close()
   file, _:= os.OpenFile(outputFile, os.O_CREATE|os.O_WRONLY|os.O_APPEND, 0644)
   defer file.Close()
   header := fmt.Sprintf("\n\n\n###---These Are Results From %s---\n### Time: %v\n\n", hashFile, time.Now())
   file.Write([]byte(header))

  scanner := bufio.NewScanner(filename)
  for scanner.Scan(){
      targetHash := scanner.Text()
      targetHash = strings.TrimSpace(targetHash)

      if true {
      now := cracker.PassCrack(targetHash, hashtype, "")     
      results := fmt.Sprintf("%s : %s\n", targetHash, now)
      file.Write([]byte(results))
      }
      } 
      return "" 
}


func BruteFile(hashFile string,  hashtype string, outputFile string, min int, max int) {
  filename, err := os.OpenFile(hashFile, os.O_RDWR, 0644)
  if err != nil {
  fmt.Printf("\n%s[!] Error: %s%s", bred, err, rst)
  }
   file, _:= os.OpenFile(outputFile, os.O_CREATE|os.O_WRONLY|os.O_APPEND, 0644)
       header := fmt.Sprintf("\n\n\n###---These Are Results From %s---\n### Time: %v\n\n", hashFile, time.Now())
   file.Write([]byte(header))
   
  scanner := bufio.NewScanner(filename)
  for scanner.Scan(){
      targetHash := scanner.Text()
      targetHash = strings.TrimSpace(targetHash)

      if true {
      non := cracker.BruteGen(targetHash, hashtype, min, max)     
      bond := fmt.Sprintf("%s : %s\n", targetHash, non)
      file.Write([]byte(bond))
      }
      }  
      file.Close()
}


