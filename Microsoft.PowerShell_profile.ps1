# $PROFILE
# Use Get-Alias to show all aliases

# ls
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

# Git aliases
function git-add { git add --verbose $args }
Set-Alias -Name "ga" -Value git-add -Force

function git-add-all { git add --all --verbose $args }
Set-Alias -Name "gaa" -Value git-add-all -Force

function git-branch { git branch $args }
Set-Alias -Name "gb" -Value git-branch -Force

function git-commit-amend { git commit --verbose --amend $args }
Set-Alias -Name "gc!" -Value git-commit-amend -Force

function git-commit { git commit --verbose $args }
Set-Alias -Name "gc" -Value git-commit -Force

function git-checkout-branch { git checkout -b $args }
Set-Alias -Name "gcb" -Value git-checkout-branch -Force

function git-clone { git clone --recurse-submodules $args }
Set-Alias -Name "gcl" -Value git-clone -Force

function git-checkout { git checkout $args }
Set-Alias -Name "gco" -Value git-checkout -Force

function git-cherry-pick { git cherry-pick $args }
Set-Alias -Name "gcp" -Value git-cherry-pick -Force

function git-diff { git diff $args }
Set-Alias -Name "gd" -Value git-diff -Force

function git-fetch { git fetch $args }
Set-Alias -Name "gf" -Value git-fetch -Force

function git-pull { git pull $args }
Set-Alias -Name "gl" -Value git-pull -Force

function git-log { git log --oneline --decorate --graph $args }
Set-Alias -Name "glog" -Value git-log -Force

function git-merge { git merge $args }
Set-Alias -Name "gm" -Value git-merge -Force

function git-push { git push $args }
Set-Alias -Name "gp" -Value git-push -Force

function git-remote { git remote $args }
Set-Alias -Name "gr" -Value git-remote -Force

function git-rebase { git rebase $args }
Set-Alias -Name "grb" -Value git-rebase -Force

function git-reflog { git reflog $args }
Set-Alias -Name "grf" -Value git-reflog -Force

function git-reset-hard { git reset --hard $args }
Set-Alias -Name "grhh" -Value git-reset-hard -Force

function git-rm { git rm $args }
Set-Alias -Name "grm" -Value git-rm -Force

function git-restore { git restore $args }
Set-Alias -Name "grs" -Value git-restore -Force

function git-restore-staged { git restore --staged $args }
Set-Alias -Name "grst" -Value git-restore-staged -Force

function git-show { git show $args }
Set-Alias -Name "gsh" -Value git-show -Force

function git-status-short { git status --short $args }
Set-Alias -Name "gss" -Value git-status-short -Force

function git-status { git status $args }
Set-Alias -Name "gst" -Value git-status -Force

function git-stash { git stash push $args }
Set-Alias -Name "gsta" -Value git-stash -Force

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
