param (
    [Parameter(Mandatory=$true)][string]$filepath,
    [Parameter(Mandatory=$true)][string]$matchLine,
    [Parameter(Mandatory=$true)][int]$makeIndividual,
    [string]$outputFolder="Output Sections",
    [string]$outputFileName="Section"
)
$sections=[System.Collections.ArrayList]@()
$currentSection=[System.Collections.ArrayList]@()
foreach ($line in [System.IO.File]::ReadLines($filepath)) {
    if($line -eq $matchLine) {
        if($currentSection.Count -gt 0) {
            $sections.Add($currentSection) | Out-Null
        }
        $currentSection=[System.Collections.ArrayList]@()
    } else {
        if($line.Length -gt 0) {
            $currentSection.Add($line) | Out-Null
        }
    }
}
if($currentSection.Count -gt 0) {
    $sections.Add($currentSection) | Out-Null
}

if(($makeIndividual -eq 1) -And (-not (Test-Path (".\"+$outputFolder) -PathType Container))) {
    New-Item -Path ".\" -Name $outputFolder -ItemType "directory" | Out-Null
}

$count = 1
$outputStr = ""
foreach($section in $sections) {
    $sortedSection = $section | Sort-Object {
        if($_.IndexOf(".") -ne -1) {
            [int]($_.substring(0, $_.IndexOf('.')))
        } else {
            9999
        }
    }
    
    if($makeIndividual -eq 1) {
        $sortedSection | Out-File -Filepath (".\"+$outputFolder+"\"+$outputFileName+$count+".txt") 
        $count++
    } else {
        $outputStr += $matchLine + "`n"
        foreach($s in $sortedSection) {
            $outputStr += $s+"`n"
        }
    }
}

if($makeIndividual -ne 1) {
    $outputStr | Out-File -Filepath (".\" + $outputFileName + ".txt")
}