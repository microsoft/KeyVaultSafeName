#
# Module manifest for module 'KeyVaultSafeName'
#
# Generated by: tim-dunn@github
#
# Generated on: 3/1/2021
#

@{

    # Script module or binary module file associated with this manifest.
    RootModule = 'KeyVaultSafeName.psm1'

    # Version number of this module.
    ModuleVersion = '1.0.0.0'

    # ID used to uniquely identify this module
    GUID = '2a7a6eb8-d9cf-45be-a452-34ebfa18bc9a'

    # Author of this module
    Author = 'Tim Dunn'

    # Copyright statement for this module
    Copyright = '(c) 2021. All rights reserved.'

    # Description of the functionality provided by this module
    Description = 'Use all printable 7-bit ascii characters as KeyVault -VaultName and -Name parameter values.'

    # Minimum version of the Windows PowerShell engine required by this module
    PowerShellVersion = '3.0'

    # Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
    DotNetFrameworkVersion = '4.0'

    # Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
    CLRVersion = '4.0'

    # Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
    FunctionsToExport = 'ConvertTo-KeyVaultSafeName', 'ConvertFrom-KeyVaultSafeName'

    # List of all files packaged with this module
    FileList = 'KeyVaultSafeName.psm1', 'KeyVaultSafeName.psd1'

    # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData = @{

        PSData = @{

            # Tags applied to this module. These help with module discovery in online galleries.
            Tags = 'KeyVault', 'VaultName'

            # A URL to the license for this module.
            # LicenseUri = 'https://github.com/microsoft/KeyVaultSafeName/blob/main/LICENSE'

            # A URL to the main website for this project.
            ProjectUri = 'https://github.com/microsoft/KeyVaultSafeName/'

        } # End of PSData hashtable

    } # End of PrivateData hashtable

    # HelpInfo URI of this module
    HelpInfoURI = 'https://github.com/microsoft/KeyVaultSafeName/wiki'
}



# SIG # Begin signature block
# MIINFAYJKoZIhvcNAQcCoIINBTCCDQECAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUE8BvL4aj+++EouWuLc9rmlxG
# BTigggpWMIIFHjCCBAagAwIBAgIQAnIb4KpGQRj54gfOYDw3ATANBgkqhkiG9w0B
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
# MQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQUYNOqNTL6RHSIqEKoMG0f
# TD2N36swDQYJKoZIhvcNAQEBBQAEggEAolN/gga+k4XmWxqFzVZ07gB4BYZzl1K+
# 9UiRgtfeyIeW7BtO6+yIgyqKN1kKnInjKn1+Fmuz2nb8Hou9afcKqD/eTcSMp+2f
# NSMbR/jYTqW4bdcfYIMD6epSEyFYq2WlziRBWuidc+FL26VL2QtNKs61AUR/qx2N
# aYb4QmJCNgCVzpF9NafUCoGnn6Jjx9Bm/Bp2dSfQTj6joparGO01lqNYA9r2CtuS
# Mm3UPqvdviXZvP9nqMrnRXHh160lpCltN6gJnu2Day/+Ay+CmUv1x5wxXdkwl/1y
# DnuwNqekYSwWHnoLcV8yZ9VUqrQ2HPZBQZEaD6uKR1NYoTrE7zop+g==
# SIG # End signature block
