function ConvertTo-KeyVaultSafeName
{
    <#
            .SYNOPSIS
            Ensure Name is valid for KeyVault

            .DESCRIPTION
            KeyVault only allows letters, numbers, and the hyphen. No other special characters are allowed.
            This function converts any special character to a string '-' + (ASCII value of the character) + '-'

            .PARAMETER Name
            String to convert to valid KeyVault -Name or -VaultName parameter value. Required.

            .PARAMETER DelimiterCount
            Length of '-' used as delimiter. Defaults to '-', can be as long as '----------'

            .EXAMPLE
            ConvertTo-KeyVaultSafeName -Name localadmin
            localadmin

            'localadmin' is a KeyVault-safe name, so it is unchanged.

            .EXAMPLE
            ConvertTo-KeyVaultSafeName -Name Domain\UserName
            Domain-92-UserName

            The '\' character is converted to '-92-', resulting in a KeyVault-safe name.
    #>

    param
    (
        [Parameter(
                Mandatory,
                HelpMessage = 'KeyVault -Name parameter value',
                Position = 0
        )]
        [string]
        $Name,

        [Parameter( Position = 1 )]
        [ValidateRange( 1, 8 )]
        [int]
        $DelimiterCount = 1
    )

    begin
    {
        $ErrorActionPreference = 'Stop'

        # in case 'abc-123-def' is a valid KeyVault -VaultName or -Name value
        [string]$script:delimiter = '-' * $DelimiterCount

        # this regular expression matches on any single character that is not allowed by KeyVault, one at a time.
        # (We can't use the '\W' metacharacter because '\w' matches '_', which KeyVault does not allow.)
        [regex]$disallowedCharacterRegEx = '[^A-Za-z0-9]'

        # this [ScriptBlock] converts that character to an [int] (effectively, it finds it on the ASCII table)
        # it precedes and follows the [int] with dashes. So, 'Domain\UserName' becomes 'Domain-92-UserName'
        $convertToIntScriptBlock =
        {
            param (
                [Parameter(
                        Mandatory,
                        HelpMessage = '[^a-zA-Z0-9] characters to convert to -[int]-'
                )]
                [Text.RegularExpressions.Match]$Matches
            )        $script:delimiter + [int][char]( $Matches[0].ToString() )+ $script:delimiter
        }
    }

    process
    {
        Write-Verbose -Message "`$Name initial value: '$Name'"
    
        # this uses [regex] Replace() to pass the matching values into the [ScriptBlock] and interpolate the result.
        # at this point, the $Name string is KeyVault-safe
        $nameOut = $disallowedCharacterRegEx.Replace( $Name, $convertToIntScriptBlock )

        Write-Verbose -Message "`$Name final value: '$nameOut'"

        $nameOut
    }

    #> # function ConvertTo-KeyVaultSafeName 
}

function ConvertFrom-KeyVaultSafeName
{
    <#
            .SYNOPSIS
            Changes a KeyVault-valid name back normal characters.

            .DESCRIPTION
            KeyVault only allows letters, numbers, and the hyphen. No other special characters are allowed.
            ConvertFrom-KeyVaultSafeName reverts the changes implemented by ConvertTo-KeyVaultSafeName.

            .PARAMETER Name
            String converted to valid KeyVault -Name or -VaultName parameter value by ConvertTo-KeyVaultSafeName to revert. Required.

            .PARAMETER DelimiterCount
            Length of '-' used as delimiter. Defaults to '-', can be as long as '----------'

            .EXAMPLE
            ConvertFrom-KeyVaultSafeName -Name localadmin
            localadmin

            'localadmin' is a KeyVault-safe name, so it is unchanged.

            .EXAMPLE
            ConvertFrom-KeyVaultSafeName -Name Domain-92-UserName
            Domain\UserName

            The '-92-' in the KeyVault-safe name is converted back to '\', resulting in original string
    #>

    param
    (
        [Parameter(
                Mandatory,
                HelpMessage = 'KeyVault -Name parameter value',
                Position = 0
        )]
        [string]
        $Name,

        [Parameter( Position = 1 )]
        [ValidateRange( 1, 8 )]
        [int]
        $DelimiterCount = 1
    )

    begin
    {
        $ErrorActionPreference = 'Stop'

        # in case 'abc-123-def' is a valid KeyVault -VaultName or -Name value
        [string]$script:delimiter = '-' * $DelimiterCount

        # this regular expression matches on any single character that is not allowed by KeyVault, one at a time.
        # (We can't use the '\W' metacharacter because '\w' matches '_', which KeyVault does not allow.)
        [regex]$placeholderRegEx = $script:delimiter + '(\d+)' + $script:delimiter

        # this [ScriptBlock] converts that character to an [int] (effectively, it finds it on the ASCII table)
        # it precedes and follows the [int] with dashes. So, 'REDMOND\M365CIcis' becomes 'REDMOND-92-M365CIcis'
        $convertFromIntScriptBlock =
        {
            param (
                [Parameter(
                        Mandatory,
                        HelpMessage = '-\d+- string to convert back to [char]'
                )]
                [Text.RegularExpressions.Match]$Matches
            )
            [char][int]( $Matches.Groups[1].Value )
        }
    }

    process
    {
        Write-Verbose -Message "`$Name initial value: '$Name'"

        # this uses [regex] Replace() to pass the matching values into the [ScriptBlock] and interpolate the result.
        # at this point, the $Name string is returned to the original value
        [string]$nameOut = $placeholderRegEx.Replace( $Name, $convertFromIntScriptBlock )

        Write-Verbose -Message "`$Name final value: '$nameOut'"

        $nameOut
    }

    #> # function ConvertFrom-KeyVaultSafeName
}

# SIG # Begin signature block
# MIINFAYJKoZIhvcNAQcCoIINBTCCDQECAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQU6N/w86PWLvUTb6c7F8+qBfle
# VfOgggpWMIIFHjCCBAagAwIBAgIQAnIb4KpGQRj54gfOYDw3ATANBgkqhkiG9w0B
# AQsFADByMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYD
# VQQLExB3d3cuZGlnaWNlcnQuY29tMTEwLwYDVQQDEyhEaWdpQ2VydCBTSEEyIEFz
# c3VyZWQgSUQgQ29kZSBTaWduaW5nIENBMB4XDTIwMDgyNTAwMDAwMFoXDTIyMTIx
# MzEyMDAwMFowWzELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xETAP
# BgNVBAcTCEJlbGxldnVlMREwDwYDVQQKEwhUaW0gRHVubjERMA8GA1UEAxMIVGlt
# IER1bm4wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCpX/tMYeonfGWV
# reANhL0prIPNLdRg5n2SRq9u8i8hb5StItbVXK8hijXufYu9pyqyXdUz+uDpGOhF
# Uw3A/fvJS5K9rZk5alxauyqDV7Fv4ZRXShyM5wqpFqmwxI5iMlJlcoee0EobaGU4
# MusAuWVGwhCa+iKrLRfSqGKu5q7WTk0Q16s4kpTwREjHOtUhAlsvP1AKB1XfPgkh
# zTpoMWQf8lYW18qj8myVGKPB0e60KWULZ8+XRiTnMPMB48GOWSL52ndl5ZEZXI5D
# +Tajhnruz0G/7vpHdOim+rFi4mpm4nuCDMXVYdxIOk0UNylGk8cTsaEspqmT6ST4
# ESuwwBqVAgMBAAGjggHFMIIBwTAfBgNVHSMEGDAWgBRaxLl7KgqjpepxA8Bg+S32
# ZXUOWDAdBgNVHQ4EFgQUM3Psp23/Phewx0SE5AF1NepRulswDgYDVR0PAQH/BAQD
# AgeAMBMGA1UdJQQMMAoGCCsGAQUFBwMDMHcGA1UdHwRwMG4wNaAzoDGGL2h0dHA6
# Ly9jcmwzLmRpZ2ljZXJ0LmNvbS9zaGEyLWFzc3VyZWQtY3MtZzEuY3JsMDWgM6Ax
# hi9odHRwOi8vY3JsNC5kaWdpY2VydC5jb20vc2hhMi1hc3N1cmVkLWNzLWcxLmNy
# bDBMBgNVHSAERTBDMDcGCWCGSAGG/WwDATAqMCgGCCsGAQUFBwIBFhxodHRwczov
# L3d3dy5kaWdpY2VydC5jb20vQ1BTMAgGBmeBDAEEATCBhAYIKwYBBQUHAQEEeDB2
# MCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5kaWdpY2VydC5jb20wTgYIKwYBBQUH
# MAKGQmh0dHA6Ly9jYWNlcnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydFNIQTJBc3N1
# cmVkSURDb2RlU2lnbmluZ0NBLmNydDAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3DQEB
# CwUAA4IBAQAeHrSZ4uXs0q8HYtM6DSboLmpHfn8Rf9bYDhH4CyvljhX+nckPleIH
# xxIATDFZTYl4caFonmpCI5X1VxJP6zW0AqZLNb0DbL9bOnlZw5XsemidbPy2uj/j
# XCTLQ/gwRE6elJwiWSfGC/JVDRLWu5umxrlXA28wF3bgvcDGN4VOitBfcdPn42+g
# 6pXN4Kdddg7g5U8dqfsXhlHNvHsutN1I5MKUx3Tkp48qQfZCB4/OrRR6NNiSdWVE
# Ojt/KhkiPbUi7C6J19I/9LXqRsJnSw+LhRhiW8n1kozJF8W5TWMrQriZQ+Mi6j5Q
# v1V2fTCAda8j4VgSpTvOciHP8laYtykjMIIFMDCCBBigAwIBAgIQBAkYG1/Vu2Z1
# U0O1b5VQCDANBgkqhkiG9w0BAQsFADBlMQswCQYDVQQGEwJVUzEVMBMGA1UEChMM
# RGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3d3cuZGlnaWNlcnQuY29tMSQwIgYDVQQD
# ExtEaWdpQ2VydCBBc3N1cmVkIElEIFJvb3QgQ0EwHhcNMTMxMDIyMTIwMDAwWhcN
# MjgxMDIyMTIwMDAwWjByMQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQg
# SW5jMRkwFwYDVQQLExB3d3cuZGlnaWNlcnQuY29tMTEwLwYDVQQDEyhEaWdpQ2Vy
# dCBTSEEyIEFzc3VyZWQgSUQgQ29kZSBTaWduaW5nIENBMIIBIjANBgkqhkiG9w0B
# AQEFAAOCAQ8AMIIBCgKCAQEA+NOzHH8OEa9ndwfTCzFJGc/Q+0WZsTrbRPV/5aid
# 2zLXcep2nQUut4/6kkPApfmJ1DcZ17aq8JyGpdglrA55KDp+6dFn08b7KSfH03sj
# lOSRI5aQd4L5oYQjZhJUM1B0sSgmuyRpwsJS8hRniolF1C2ho+mILCCVrhxKhwjf
# DPXiTWAYvqrEsq5wMWYzcT6scKKrzn/pfMuSoeU7MRzP6vIK5Fe7SrXpdOYr/mzL
# fnQ5Ng2Q7+S1TqSp6moKq4TzrGdOtcT3jNEgJSPrCGQ+UpbB8g8S9MWOD8Gi6CxR
# 93O8vYWxYoNzQYIH5DiLanMg0A9kczyen6Yzqf0Z3yWT0QIDAQABo4IBzTCCAckw
# EgYDVR0TAQH/BAgwBgEB/wIBADAOBgNVHQ8BAf8EBAMCAYYwEwYDVR0lBAwwCgYI
# KwYBBQUHAwMweQYIKwYBBQUHAQEEbTBrMCQGCCsGAQUFBzABhhhodHRwOi8vb2Nz
# cC5kaWdpY2VydC5jb20wQwYIKwYBBQUHMAKGN2h0dHA6Ly9jYWNlcnRzLmRpZ2lj
# ZXJ0LmNvbS9EaWdpQ2VydEFzc3VyZWRJRFJvb3RDQS5jcnQwgYEGA1UdHwR6MHgw
# OqA4oDaGNGh0dHA6Ly9jcmw0LmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEFzc3VyZWRJ
# RFJvb3RDQS5jcmwwOqA4oDaGNGh0dHA6Ly9jcmwzLmRpZ2ljZXJ0LmNvbS9EaWdp
# Q2VydEFzc3VyZWRJRFJvb3RDQS5jcmwwTwYDVR0gBEgwRjA4BgpghkgBhv1sAAIE
# MCowKAYIKwYBBQUHAgEWHGh0dHBzOi8vd3d3LmRpZ2ljZXJ0LmNvbS9DUFMwCgYI
# YIZIAYb9bAMwHQYDVR0OBBYEFFrEuXsqCqOl6nEDwGD5LfZldQ5YMB8GA1UdIwQY
# MBaAFEXroq/0ksuCMS1Ri6enIZ3zbcgPMA0GCSqGSIb3DQEBCwUAA4IBAQA+7A1a
# JLPzItEVyCx8JSl2qB1dHC06GsTvMGHXfgtg/cM9D8Svi/3vKt8gVTew4fbRknUP
# UbRupY5a4l4kgU4QpO4/cY5jDhNLrddfRHnzNhQGivecRk5c/5CxGwcOkRX7uq+1
# UcKNJK4kxscnKqEpKBo6cSgCPC6Ro8AlEeKcFEehemhor5unXCBc2XGxDI+7qPjF
# Emifz0DLQESlE/DmZAwlCEIysjaKJAL+L3J+HNdJRZboWR3p+nRka7LrZkPas7CM
# 1ekN3fYBIM6ZMWM9CBoYs4GbT8aTEAb8B4H6i9r5gkn3Ym6hU/oSlBiFLpKR6mhs
# RDKyZqHnGKSaZFHvMYICKDCCAiQCAQEwgYYwcjELMAkGA1UEBhMCVVMxFTATBgNV
# BAoTDERpZ2lDZXJ0IEluYzEZMBcGA1UECxMQd3d3LmRpZ2ljZXJ0LmNvbTExMC8G
# A1UEAxMoRGlnaUNlcnQgU0hBMiBBc3N1cmVkIElEIENvZGUgU2lnbmluZyBDQQIQ
# AnIb4KpGQRj54gfOYDw3ATAJBgUrDgMCGgUAoHgwGAYKKwYBBAGCNwIBDDEKMAig
# AoAAoQKAADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgorBgEEAYI3AgEL
# MQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQUetel/L+SMBjrNqRgZPb9
# pQ3Is7cwDQYJKoZIhvcNAQEBBQAEggEAJLzGwiwuc8qkCFI6N/kRi7vT6vVxefll
# VgpgbTP1LWPoXc7kxU871Op2v6RT7KyCw73ebcePAa7yCoejJSaDKJfgDIA/F/lm
# zyLNuabu/TGz+cO2clyI2SY4o+hb/BiAxcV8/nJY2AQwsh7to/V0tXc1jNLBh9mE
# A7XQI9Thr4Idv+ijDtmrCAQfWa7ABL2Mb+RvI8Lg9q7JpdYqeaYaowqdH6IWN439
# M+eaycp0QPt/nT2wb33DkBEqt1wAldqgvMrg3u+co/92Hnw0jfQzXaFzyID04FeU
# 5PIwFDZU+DHTaz0PFWfIG+Ypl/pzDVcxxGO7AnPqedrbB2wWDW+7Lg==
# SIG # End signature block
