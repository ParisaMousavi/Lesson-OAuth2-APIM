$cert = New-SelfSignedCertificate -CertStoreLocation 'cert:\currentuser\my' -Subject "cn=learn-apim-tekaris.azure-api.net" -DnsName "learn-apim-tekaris.azure-api.net"

$pwd = ConvertTo-SecureString -String 'parisa' -Force -AsPlainText

$path = 'cert:\currentuser\my\'+ $cert.thumbprint

Export-PfxCertificate -cert $path -FilePath C:\OpenSSL\lesson-cert\powershellcert.pfx -Password $pwd