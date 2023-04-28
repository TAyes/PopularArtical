
import Foundation
import Security
import CommonCrypto


class CertificatePinningURLSessionDelegate: NSObject, URLSessionDelegate {
    
    var pinnedPublicKeyHash: [UInt8] = [105,074,073,110,076,087,120,090,077,087,078,043,078,098,098,089,115,110,065,110,078, 081,086,104,051,076,115,122,116,054,073,098,115,112,054,111,120,102,048,086,089,103,081,061]

        let rsa2048Asn1Header:[UInt8] = [
            0x30, 0x82, 0x01, 0x22, 0x30, 0x0d, 0x06, 0x09, 0x2a, 0x86, 0x48, 0x86,
            0xf7, 0x0d, 0x01, 0x01, 0x01, 0x05, 0x00, 0x03, 0x82, 0x01, 0x0f, 0x00
        ]

        private func sha256(data : Data) -> String {
            var keyWithHeader = Data(rsa2048Asn1Header)
            keyWithHeader.append(data)
            var hash = [UInt8](repeating: 0,  count: Int(CC_SHA256_DIGEST_LENGTH))
            keyWithHeader.withUnsafeBytes({ pointer in
                _ = CC_SHA256(pointer, CC_LONG(keyWithHeader.count), &hash)
            })
            return Data(hash).base64EncodedString()
        }
    
    
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Swift.Void) {
        
         if (challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust) {
             if let serverTrust = challenge.protectionSpace.serverTrust {
                 var secresult = SecTrustResultType.invalid
                 let status = SecTrustEvaluate(serverTrust, &secresult)
                 if(errSecSuccess == status) {
                     if let serverCertificate = SecTrustGetCertificateAtIndex(serverTrust, 0) {
                         // Public key pinning
                         if let serverPublicKey = SecCertificateCopyPublicKey(serverCertificate) {
                             if let serverPublicKeyData:NSData = SecKeyCopyExternalRepresentation(serverPublicKey, nil ) {
                                 let keyHash = sha256(data: serverPublicKeyData as Data)
                                 if (keyHash == String(decoding: pinnedPublicKeyHash, as: UTF8.self) ) {
                                     // Success! This is our server
                                     completionHandler(.useCredential, URLCredential(trust:serverTrust))
                                     return
                                 }
                             }
                         }
                     }
                 }
             }
         }
         // Pinning failed
         completionHandler(.cancelAuthenticationChallenge, nil)
     }
}
