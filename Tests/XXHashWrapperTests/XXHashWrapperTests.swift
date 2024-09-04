import XCTest
import XXHashWrapper

final class XXHashWrapperTests: XCTestCase {
    func testXXH32() {
        let data = "Hello, World!".data(using: .utf8)!
        let hash = XXHash.XXH32(data: data)
        
        XCTAssertEqual(hash, 0x4007de50)
    }
    
    func testXXH64() {
        let data = "Hello, World!".data(using: .utf8)!
        let hash = XXHash.XXH64(data: data)
        
        XCTAssertEqual(hash, 0xc49aacf8080fe47f)
    }
    
    func testXXH3_64bits() {
        let data = "Hello, World!".data(using: .utf8)!
        let hash = XXHash.XXH3_64bits(data: data)
        
        XCTAssertEqual(hash, 0x60415d5f616602aa)
    }
    
    func testXXH3_128bits() {
        let data = "Hello, World!".data(using: .utf8)!
        let hash = XXHash.XXH3_128bits(data: data)
        XCTAssertEqual(hash.high64, 0x531df2844447dd50)
        XCTAssertEqual(hash.low64, 0x77db03842cd75395)
    }
}
