package file
import (
"math/rand"
"fmt"
)


func IterName()string{
var namet, result string
var j, num int
names := []string{"cracked", "resolved", "pwned", "digest_match", "result", "reveal", "decrypted", "valid", "unlocked", "matched", "done", "found", "success", "completed"}
for _, namet = range names{ 
for j=1; j<100; j++{

namet = names[rand.Intn(len(names))]
num = rand.Intn(j)
result = fmt.Sprintf("%s%d", namet, num)
}
}
return result
}

