# Run before committing a banner change: pwsh -File scripts/refresh-banner.ps1
$ErrorActionPreference = 'Stop'
$repoRoot = Split-Path -Parent $PSScriptRoot
$bannerPath = Join-Path $repoRoot 'profile/assets/circuitbreakers-banner.svg'
$profilePath = Join-Path $repoRoot 'profile/README.md'
$utf8 = [System.Text.UTF8Encoding]::new($false)

# Normalize line endings so Git's autocrlf does not change the version.
$banner = [System.IO.File]::ReadAllText($bannerPath).Replace("`r`n", "`n")
$sha256 = [System.Security.Cryptography.SHA256]::Create()
try {
    $digest = $sha256.ComputeHash($utf8.GetBytes($banner))
} finally {
    $sha256.Dispose()
}
$version = ([System.BitConverter]::ToString($digest)).Replace('-', '').ToLowerInvariant().Substring(0, 16)
$url = "https://raw.githubusercontent.com/CircuitBreakersTKM/.github/main/profile/assets/circuitbreakers-banner.svg?v=$version"
$profile = [System.IO.File]::ReadAllText($profilePath)
$pattern = 'src="[^"]*circuitbreakers-banner\.svg(?:\?[^"]*)?"'
if ([regex]::Matches($profile, $pattern).Count -ne 1) {
    throw 'Expected exactly one banner image in profile/README.md.'
}
$updated = [regex]::Replace($profile, $pattern, ('src="' + $url + '"'))
if ($updated -ne $profile) {
    [System.IO.File]::WriteAllText($profilePath, $updated, $utf8)
}
Write-Output "Banner URL: $url"
