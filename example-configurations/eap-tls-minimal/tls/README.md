# Certificates for the example configurations

These are certificates to be used by the example configurations.
They are intended to be installed under /var/lib/radiator/tls directory
in the respective sub-directories:

For example:

keys => /var/lib/radiator/tls/keys

certs => /var/lib/radiator/tls/certs

ca => /var/lib/radiator/tls/ca

These are demo certificates for testing only. Do not use them in
production.

All private keys, certificate chain files and PKCS#12 files are
protected with the password `whatever`.

Every end entity certificate has a PKCS#12 file `certs/*-certchain.p12`
that contains the certificate, the intermediate CA certificate when the
certificate is signed by an intermediate CA, and the private key. The
root CA certificate `ca/root-CA-crt.pem` is not included, so import it
separately as a trusted CA. Use the PKCS#12 files to import the demo
certificates to client devices, Apple Configurator profiles and other
servers. They use legacy SHA1 and
3DES based encryption so that Apple Configurator and older Windows,
macOS and Android versions can import them.

Each CA publishes a certificate revocation list (CRL) in
`ca/*-crl.pem`. The CRLs list the `certs/revoked-*` certificates, which
can be used to test that revoked certificates are rejected when a TLS
configuration uses the CRLs.

Files with `-mldsa44` in their names, such as `ca/root-CA-mldsa44-crt.pem`
and `certs/client-I1-mldsa44-certchain.p12`, are the same set of demo
certificates with ML-DSA-44 post-quantum keys and signatures (RFC 9881).
They have their own CAs and CRLs. Use them to test post-quantum
certificates with clients and servers that support ML-DSA. The example
configurations use the EC certificates.
