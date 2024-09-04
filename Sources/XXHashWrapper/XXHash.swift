import Foundation
import xxHash

public enum XXHash {
    
    // MARK: - XXH32
    
    public static func XXH32(data: Data, seed: UInt32 = 0) -> UInt32 {
        data.withUnsafeBytes {
            XXH_INLINE_XXH32($0.baseAddress!, $0.count, seed)
        }
    }

    public static func XXH32(input: UnsafeRawPointer, length: Int, seed: UInt32 = 0) -> UInt32 {
        XXH_INLINE_XXH32(input, length, seed)
    }
    
    // MARK: - XXH64
    
    public static func XXH64(data: Data, seed: UInt64 = 0) -> UInt64 {
        data.withUnsafeBytes {
            XXH64(input: $0.baseAddress!, length: $0.count, seed: seed)
        }
    }

    public static func XXH64(input: UnsafeRawPointer, length: Int, seed: UInt64 = 0) -> UInt64 {
        XXH_INLINE_XXH64(input, length, seed)
    }

    // MARK: - XXH3_64bits
    
    public static func XXH3_64bits(data: Data) -> UInt64 {
        data.withUnsafeBytes {
            XXH_INLINE_XXH3_64bits($0.baseAddress!, $0.count)
        }
    }

    public static func XXH3_64bits(input: UnsafeRawPointer, length: Int) -> UInt64 {
        XXH_INLINE_XXH3_64bits(input, length)
    }

    // MARK: - XXH3_128bits
    
    public static func XXH3_128bits(data: Data) -> XXH128Hash {
        XXH128Hash(from: data.withUnsafeBytes {
            XXH_INLINE_XXH3_128bits($0.baseAddress!, $0.count)
        })
    }
    
    
    @available(iOS 18.0, macOS 15.0, *)
    public static func XXH3_128bits(data: Data) -> UInt128 {
        let xxh3_128bits = data.withUnsafeBytes {
            XXH_INLINE_XXH3_128bits($0.baseAddress!, $0.count)
        }
        
        return UInt128(xxh3_128bits.high64 << 64) | UInt128(xxh3_128bits.low64)
    }

    public static func XXH3_128bits(input: UnsafeRawPointer, length: Int) -> XXH128Hash {
        XXH128Hash(from: XXH_INLINE_XXH3_128bits(input, length))
    }
    
    @available(iOS 18.0, macOS 15.0, *)
    public static func XXH3_128bits(input: UnsafeRawPointer, length: Int) -> UInt128 {
        let xxh3_128bits = XXH_INLINE_XXH3_128bits(input, length)
        
        return UInt128(xxh3_128bits.high64 << 64) | UInt128(xxh3_128bits.low64)
    }

    // MARK: - XXH128
    
    public static func XXH128(data: Data, seed: UInt64 = 0) -> XXH128Hash {
        XXH128Hash(from: data.withUnsafeBytes {
            XXH_INLINE_XXH128($0.baseAddress!, $0.count, seed)
        })
    }
    
    @available(iOS 18.0, macOS 15.0, *)
    public static func XXH128(data: Data, seed: UInt64 = 0) -> UInt128 {
        let xxh3_128bits = data.withUnsafeBytes {
            XXH_INLINE_XXH128($0.baseAddress!, $0.count, seed)
        }
        
        return UInt128(xxh3_128bits.high64 << 64) | UInt128(xxh3_128bits.low64)
    }

    public static func XXH128(input: UnsafeRawPointer, length: Int, seed: UInt64 = 0) -> XXH128Hash {
        XXH128Hash(from: XXH_INLINE_XXH128(input, length, seed))
    }
    
    @available(iOS 18.0, macOS 15.0, *)
    public static func XXH128(input: UnsafeRawPointer, length: Int, seed: UInt64 = 0) -> UInt128 {
        let xxh3_128bits = XXH_INLINE_XXH128(input, length, seed)
        
        return UInt128(xxh3_128bits.high64 << 64) | UInt128(xxh3_128bits.low64)
    }
    
    // MARK: - Hash state operations for streaming (XXH32)
    
    public static func XXH32_createState() -> UnsafeMutablePointer<XXH_NAMESPACEXXH32_state_t>? {
        XXH_INLINE_XXH32_createState()
    }

    public static func XXH32_freeState(state: UnsafeMutablePointer<XXH_NAMESPACEXXH32_state_t>?) -> Bool {
        XXH_INLINE_XXH32_freeState(state).rawValue == 0
    }

    public static func XXH32_reset(state: UnsafeMutablePointer<XXH_NAMESPACEXXH32_state_t>?, seed: UInt32) -> Bool {
        XXH_INLINE_XXH32_reset(state, seed).rawValue == 0
    }

    public static func XXH32_update(state: UnsafeMutablePointer<XXH_NAMESPACEXXH32_state_t>?, input: UnsafeRawPointer, length: Int) -> Bool {
        XXH_INLINE_XXH32_update(state, input, length).rawValue == 0
    }

    public static func XXH32_digest(state: UnsafeMutablePointer<XXH_NAMESPACEXXH32_state_t>?) -> UInt32 {
        XXH_INLINE_XXH32_digest(state)
    }
    
    // MARK: - Hash state operations for streaming (XXH64)
    
    public static func XXH64_createState() -> UnsafeMutablePointer<XXH_NAMESPACEXXH64_state_t>? {
        XXH_INLINE_XXH64_createState()
    }

    public static func XXH64_freeState(state: UnsafeMutablePointer<XXH_NAMESPACEXXH64_state_t>?) -> Bool {
        XXH_INLINE_XXH64_freeState(state).rawValue == 0
    }

    public static func XXH64_reset(state: UnsafeMutablePointer<XXH_NAMESPACEXXH64_state_t>?, seed: UInt64) -> Bool {
        XXH_INLINE_XXH64_reset(state, seed).rawValue == 0
    }

    public static func XXH64_update(state: UnsafeMutablePointer<XXH_NAMESPACEXXH64_state_t>?, input: UnsafeRawPointer, length: Int) -> Bool {
        XXH_INLINE_XXH64_update(state, input, length).rawValue == 0
    }

    public static func XXH64_digest(state: UnsafeMutablePointer<XXH_NAMESPACEXXH64_state_t>?) -> UInt64 {
        XXH_INLINE_XXH64_digest(state)
    }
    
    // MARK: - Hash state operations for streaming (XXH3)
    
    public static func XXH3_createState() -> OpaquePointer? {
        XXH_INLINE_XXH3_createState()
    }

    public static func XXH3_freeState(state: OpaquePointer?) -> Bool {
        XXH_INLINE_XXH3_freeState(state).rawValue == 0
    }

    public static func XXH3_64bits_reset(state: OpaquePointer?) -> Bool {
        XXH_INLINE_XXH3_64bits_reset(state).rawValue == 0
    }

    public static func XXH3_64bits_update(state: OpaquePointer?, input: UnsafeRawPointer, length: Int) -> Bool {
        XXH_INLINE_XXH3_64bits_update(state, input, length).rawValue == 0
    }

    public static func XXH3_64bits_digest(state: OpaquePointer?) -> UInt64 {
        XXH_INLINE_XXH3_64bits_digest(state)
    }

    public static func XXH3_128bits_reset(state: OpaquePointer?) -> Bool {
        XXH_INLINE_XXH3_128bits_reset(state).rawValue == 0
    }

    public static func XXH3_128bits_update(state: OpaquePointer?, input: UnsafeRawPointer, length: Int) -> Bool {
        XXH_INLINE_XXH3_128bits_update(state, input, length).rawValue == 0
    }

    public static func XXH3_128bits_digest(state: OpaquePointer?) -> XXH128Hash {
        XXH128Hash(from: XXH_INLINE_XXH3_128bits_digest(state))
    }
    
    @available(iOS 18.0, macOS 15.0, *)
    public static func XXH3_128bits_digest(state: OpaquePointer?) -> UInt128 {
        let xxh3_128bits = XXH_INLINE_XXH3_128bits_digest(state)
        
        return UInt128(xxh3_128bits.high64 << 64) | UInt128(xxh3_128bits.low64)
    }
}
