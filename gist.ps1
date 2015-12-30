Set-ExplorerOptions -showHidenFilesFoldersDrives -showProtectedOSFiles -showFileExtensions
Set-ExecutionPolicy RemoteSigned

cinst fiddler4
cinst git-credential-winstore
cinst sublimetext3
cinst poshgit
cinst awscli
cinst awstools.powershell
cinst google-chrome-x64
cinst python2
cinst nodejs
cinst vagrant
cinst virtualbox
cinst packer
cinst packer-windows-plugins

$UNPIN = (
	("C:\Program Files\Internet Explorer\","iexplore.exe"),
	$null)

foreach ($item in $UNPIN)
{
    if ($item){
        $shell = new-object -com "Shell.Application"  
        $folder = $shell.Namespace($item[0])    
        $item = $folder.Parsename($item[1])
        $verb = $item.Verbs() | ? {$_.Name -eq 'Unpin from Tas&kbar'}
        if ($verb) {$verb.DoIt()}
    }
}

$PIN = (
	("C:\Program Files (x86)\Google\Chrome\Application\","chrome.exe"),
	("C:\Program Files (x86)\Atlassian\SourceTree\","SourceTree.exe"),
    ("C:\windows\system32\WindowsPowerShell\v1.0\","powershell.exe"),
    ("C:\Program Files\Sublime Text 3","sublime_text.exe"),
	$null)
foreach ($item in $PIN)
{
    if ($item){
        $shell = new-object -com "Shell.Application"  
        $folder = $shell.Namespace($item[0])    
        $item = $folder.Parsename($item[1])
        $verb = $item.Verbs() | ? {$_.Name -eq 'Pin to Tas&kbar'}
        if ($verb) {$verb.DoIt()}
    }
}

