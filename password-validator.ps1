clear-host
 
$pass = $Args[0]

# Set default validity to True , if any condition does not meet - will turn to false.
$pass_validity = $true

"First argument is " +$pass

write-host

write-host

write-host 

if ($pass -eq '-f')
{
    write-host "flag -f tuned on"
    $filePath = $Args[1]
    "reading password from file" + $filePath
    write-host
    $pass =  get-content "$filePath" | select -first 1
      
      write-host "pass is: $pass"
}

write-host
write-host $pass


if (!($pass.length -ge 10))
{
     Write-Host "`n pass MUST have at least 10 charachters )-: `n "
     $pass_validity = $false
}
if(!(($pass -cmatch '[a-z]') -and ($pass -cmatch '[A-Z]')))
{ 
    Write-Host "`n pass must have at least ONE Lower case and ONE Upper case characters in it ! )-: `n "
         $pass_validity = $false
} 
if(!($pass -match '\d'))
{
     Write-Host "`n  pass must contain At least one digit! )-: `n "
          $pass_validity = $false
}

if ($pass_validity -eq $false)
{
    exit
}
else
{ 
     Write-Host "`nCongrats! - pass does meet the requirements!`n"
}