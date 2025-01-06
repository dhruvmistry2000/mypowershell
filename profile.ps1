oh-my-posh init pwsh --config "$env:USERPROFILE\AppData\Local\Programs\oh-my-posh\themes\pure.omp.json" | Invoke-Expression
 Invoke-Expression (& { (zoxide init powershell | Out-String) })
 function winutil {
	Invoke-WebRequest -UseBasicP -Uri https://christitus.com/win | Invoke-Expression
}
$env:FZF_DEFAULT_OPTS = @"
  --color=fg:-1,fg+:#d8dee9,bg:#2e3440,bg+:#3b4252
  --color=hl:#81a1c1,hl+:#88c0d0,info:#e5e9f0,marker:#a3be8c
  --color=prompt:#bf616a,spinner:#b48ead,pointer:#b48ead,header:#5e81ac
  --color=border:#3b4252,label:#eceff4,query:#d8dee9
  --border="thinblock" --border-label="$USER" --preview-window="border-double" --prompt="$USER> "
  --marker=">" --pointer="◆" --separator="─"
"@
