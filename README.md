# KeyVaultSafeName

Azure KeyVault exposes assets as URI, so all `-VaultName` and `-Name` parameter values must be in the character set `[A-Za-z0-9-]` so they can be interpolated into the resulting URI values.

KeyVaultSafeName encodes/decodes 7-bit printable characters outside the above character set into strings such as `-64-` for `@` and vice versa using the ASCII table decimal value.

## Usage

### Importing

```PowerShell
# If downloaded to $home\KeyVaultSafeName
ipmo ~\KeyVaultSafeName

# If installed to folder in $env:PSModulePath
ipmo KeyVaultSafeName
```

### Encoding

```Powershell
$uri = 'https://github.com/microsoft/KeyVaultSafeName'
$safe = ConvertTo-KeyVaultSafeName $uri
```

`$safe` will contain the following string:

```text
https-58--47--47-github-46-com-47-microsoft-47-KeyVaultSafeName
```

### Decoding

```PowerShell
$encoded = 'https-58--47--47-github-46-com-47-microsoft-47-KeyVaultSafeName'
$original = ConvertFrom-KeyVaultSafeName $encoded
```

`$original` will have the same value as `$uri`:

```text
https://github.com/microsoft/KeyVaultSafeName
```

## Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.opensource.microsoft.com.

When you submit a pull request, a CLA bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

### Need Help

1. Code Review: Security. Style. Linting. Security.

1. Documentation: Readability. Conformance to ecosystem standards. Wiki.

1. Code Optimization: Besides the base PSH, also the specific class types such as `[RegEx]` and `[ScriptBlock]`

1. Design: `SupportsShouldProcess`/`.ShouldContinue`? `ValueFromPipeline`? Changing `-Name <string>` to `-InputObject <Object>`?

## Trademarks

This project may contain trademarks or logos for projects, products, or services. Authorized use of Microsoft 
trademarks or logos is subject to and must follow 
[Microsoft's Trademark & Brand Guidelines](https://www.microsoft.com/en-us/legal/intellectualproperty/trademarks/usage/general).
Use of Microsoft trademarks or logos in modified versions of this project must not cause confusion or imply Microsoft sponsorship.
Any use of third-party trademarks or logos are subject to those third-party's policies.
