$ErrorActionPreference = 'Stop'

$projectRoot = Split-Path -Parent $PSScriptRoot
$stagePath = Join-Path ([System.IO.Path]::GetTempPath()) (
    'FlowYoutubeRedirect-' + [guid]::NewGuid().ToString('N')
)
$outputPath = Join-Path $projectRoot 'FlowYoutubeRedirect.zip'

try {
    New-Item -ItemType Directory -Path $stagePath | Out-Null

    $rootFiles = @(
        'plugin.json',
        'run.py',
        'SettingsTemplate.yaml',
        'regions.json',
        'languages.json',
        'icon.png',
        'README.md'
    )

    foreach ($file in $rootFiles) {
        Copy-Item -LiteralPath (Join-Path $projectRoot $file) -Destination $stagePath
    }

    Copy-Item -LiteralPath (Join-Path $projectRoot 'lib') -Destination $stagePath -Recurse
    New-Item -ItemType Directory -Path (Join-Path $stagePath 'plugin') | Out-Null
    Copy-Item -LiteralPath (Join-Path $projectRoot 'plugin/main.py') `
        -Destination (Join-Path $stagePath 'plugin')

    Compress-Archive -Path (Join-Path $stagePath '*') `
        -DestinationPath $outputPath -CompressionLevel Optimal -Force

    Write-Output "Created $outputPath"
}
finally {
    if (Test-Path -LiteralPath $stagePath) {
        Remove-Item -LiteralPath $stagePath -Recurse -Force
    }
}
