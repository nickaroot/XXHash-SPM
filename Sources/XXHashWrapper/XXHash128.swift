import Foundation
import xxHash

public struct XXH128Hash {
    public let low64: UInt64
    public let high64: UInt64
    
    public init(from cHash: XXH_NAMESPACEXXH128_hash_t) {
        self.low64 = cHash.low64
        self.high64 = cHash.high64
    }
}
