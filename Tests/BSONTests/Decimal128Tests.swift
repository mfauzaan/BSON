import XCTest
import BSON

final class Decimal128Tests: XCTestCase {
    func testPublicMemberwiseInit() {
        let value = Decimal128(low: 0, high: 0)
        XCTAssertFalse(value.isInfinity)
        XCTAssertFalse(value.isNaN)
    }

    func testInfinityBitPattern() {
        let value = Decimal128(low: 0, high: 0b11110 << 58)
        XCTAssertTrue(value.isInfinity)
        XCTAssertFalse(value.isNaN)
    }

    func testNaNBitPattern() {
        let value = Decimal128(low: 0, high: 0b11111 << 58)
        XCTAssertTrue(value.isNaN)
        XCTAssertFalse(value.isInfinity)
    }

    func testHashableEquatable() {
        let a = Decimal128(low: 42, high: 99)
        let b = Decimal128(low: 42, high: 99)
        let c = Decimal128(low: 43, high: 99)
        XCTAssertEqual(a, b)
        XCTAssertNotEqual(a, c)
        XCTAssertEqual(a.hashValue, b.hashValue)
    }
}
