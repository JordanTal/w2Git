clear-host

# Put the first argument into the password variable 
$pass = $Args[0]

# Set default validity to True , if any condition does not meet - will turn to false.
$pass_validity = $true

write-host

write-host

write-host 

# If flag -f was truned on 
if ($pass -eq '-f')
{
    write-host "flag -f tuned on"
    $filePath = $Args[1]
    "reading password from file" + $filePath
    write-host
    # Place the passwor from file into the password variable
    $pass =  get-content "$filePath" | select -first 1
}

# Check password's length
if (!($pass.length -ge 10))
{
     Write-Host "`n Pay attention, pass MUST have at least 10 charachters )-: `n "
     $pass_validity = $false
}
# Check that the password uses both lower and upper case charachters
if(!(($pass -cmatch '[a-z]') -and ($pass -cmatch '[A-Z]')))
{ 
    Write-Host "`n Pay attention, pass must have at least ONE Lower case and ONE Upper case characters in it ! )-: `n "
         $pass_validity = $false
}
# Check that password includes at least one digit 
if(!($pass -match '\d'))
{
     Write-Host "`n Pay attention, pass must contain At least one digit! )-: `n "
          $pass_validity = $false
}

# If at least one of the reuirements does not meet 
if ($pass_validity -eq $false)
{
    Write-Host "`n`n`n)-: As seen above - password didn't meet at least one of the requirements... `n"
    exit
}
# If password passed the test ( does meet all the reuirements)
else
{ 
     Write-Host "`nCongrats! - pass does meet the requirements!`n"
     exit
}