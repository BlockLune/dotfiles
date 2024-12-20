# BlockLune's PowerShell Profile ($PROFILE)
# Reference: https://github.com/ChrisTitusTech/powershell-profile/blob/0640373cec48a32c9bb510730a34c6e121b077b3/Microsoft.PowerShell_profile.ps1

# Helpful commands:
# Get-Alias: show all aliases

$env:LC_ALL = 'C.UTF-8'

# util function
function Test-CommandExists {
    param($command)
    $exists = $null -ne (Get-Command $command -ErrorAction SilentlyContinue)
    return $exists
}

# emacs mode
Set-PSReadLineOption -EditMode Emacs

# editor
$EDITOR = if (Test-CommandExists nvim) { 'nvim' }
elseif (Test-CommandExists vim) { 'vim' }
elseif (Test-CommandExists vi) { 'vi' }
elseif (Test-CommandExists code) { 'code' }
else { 'notepad' }
Set-Alias -Name vim -Value $EDITOR

# touch
function touch($file) { "" | Out-File $file -Encoding ASCII }

# grep
function grep($regex, $dir) {
    if ( $dir ) {
        Get-ChildItem $dir | select-string $regex
        return
    }
    $input | select-string $regex
}

# pgrep
function pgrep($name) {
    Get-Process $name
}

# sed
function sed($file, $find, $replace) {
    (Get-Content $file).replace("$find", $replace) | Set-Content $file
}

# which
function which($name) {
    Get-Command $name | Select-Object -ExpandProperty Definition
}

# head
function head {
    param($Path, $n = 10)
    Get-Content $Path -Head $n
}

# tail
function tail {
    param($Path, $n = 10, [switch]$f = $false)
    Get-Content $Path -Tail $n -Wait:$f
}

# ls (lsd required)
function Get-ChildItem-With-Lsd { lsd -F $args }
Set-Alias -Name "ls" -Value Get-ChildItem-With-Lsd -Force

function Get-ChildItem-With-Lsd-All { lsd -F -a $args }
Set-Alias -Name "la" -Value Get-ChildItem-With-Lsd-All -Force

function Get-ChildItem-With-Lsd-Long { lsd -F -l $args }
Set-Alias -Name "ll" -Value Get-ChildItem-With-Lsd-Long -Force

function Get-ChildItem-With-Lsd-Long-All { lsd -F -l -a $args }
Set-Alias -Name "l" -Value Get-ChildItem-With-Lsd-Long-All -Force

# cd
function Enter-Parent-Dir { Set-Location .. }
Set-Alias -Name ".." -Value Enter-Parent-Dir

function Enter-Grand-Parent-Dir { Set-Location ../.. }
Set-Alias -Name "..." -Value Enter-Grand-Parent-Dir

# git
function ga { git add --verbose $args }
function gaa { git add --all --verbose $args }
function gb { git branch $args }
function gcl { git clone $args }
function gco { git checkout $args }
function gcp { git cherry-pick $args }
function gd { git diff $args }
function gf { git fetch $args }
function glog { git log --oneline --decorate --graph $args }
function gr { git remote $args }
function grb { git rebase $args }
function grf { git reflog $args }
function grhh { git reset --hard $args }
function grm { git rm $args }
function grs { git restore --staged $args }
function grst { git restore --staged $args }
function gsh { git show $args }
function gss { git status --short $args }
function gst { git status $args }
function gsta { git stash push $args }
function Start-Git-Commit { git commit --verbose $args }
Set-Alias -Name "gc" -Value Start-Git-Commit -Force
function Start-Git-Commit-Amend { git commit --verbose --amend $args }
Set-Alias -Name "gc!" -Value Start-Git-Commit-Amend -Force
function Start-Git-Checkout { git checkout -b $args }
Set-Alias -Name "gcb" -Value Start-Git-Checkout -Force
function Start-Git-Pull { git pull $args }
Set-Alias -Name "gl" -Value Start-Git-Pull -Force
function Start-Git-Merge { git merge $args }
Set-Alias -Name "gm" -Value Start-Git-Merge -Force
function Start-Git-Push { git push $args }
Set-Alias -Name "gp" -Value Start-Git-Push -Force

# proxy
function proxy {
    [CmdletBinding(DefaultParameterSetName = 'Enable')]
    param(
        [Parameter(ParameterSetName = 'Disable')]
        [switch]$Disable,

        [Parameter(ParameterSetName = 'Check')]
        [switch]$Check
    )

    if ($Disable) {
        $env:https_proxy = $null
        $env:http_proxy = $null
        $env:all_proxy = $null
        Write-Host "Proxy disabled"
        return
    }

    if ($Check) {
        try {
            $proxyUri = "http://127.0.0.1:7890"

            $params = @{
                Uri             = "http://google.com"
                Method          = "Head"
                Proxy           = $proxyUri
                TimeoutSec      = 10
                UseBasicParsing = $true
            }

            $null = Invoke-WebRequest @params
            Write-Host "Proxy is working"
        }
        catch {
            Write-Host "Proxy is not working"
        }
        return
    }

    $env:https_proxy = "http://127.0.0.1:7890"
    $env:http_proxy = "http://127.0.0.1:7890"
    $env:all_proxy = "socks5://127.0.0.1:7890"
    Write-Host "Proxy enabled"
}

# starship
Invoke-Expression (&starship init powershell)

