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
