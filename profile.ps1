 oh-my-posh init pwsh --config 'C:\Users\dhruv\AppData\Local\Programs\oh-my-posh\themes\pure.omp.json' | Invoke-Expression
 Invoke-Expression (& { (zoxide init powershell | Out-String) })
 function winutil {
	iwr -useb https://christitus.com/win | iex
}