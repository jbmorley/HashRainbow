import XCTest
import SwiftUI
@testable import HashRainbow

final class HashRainbowTests: XCTestCase {
    
    func testHash() throws {
        XCTAssertEqual(HashRainbow.hashValueFor("poop"), HashRainbow.hashValueFor("poop"))
        XCTAssertEqual(HashRainbow.hashValueFor("bar"), HashRainbow.hashValueFor("bar"))
        XCTAssertNotEqual(HashRainbow.hashValueFor("poop"), HashRainbow.hashValueFor("bar"))
    }
    
    func testSanity() throws {
        print(HashRainbow.hashValueFor("cheese"))
        XCTAssertEqual(HashRainbow.colorForString("cheese"), Color.orange)
    }
    
    func testGrayscale() throws {
        XCTAssertEqual(HashRainbow.colorForString("b", colors: HashRainbow.GrayscaleColors), Color.black)
    }
    
    func testStability() throws {
        XCTAssertEqual(HashRainbow.colorForString("contacted", colors: HashRainbow.RainbowColors), Color.blue)
        XCTAssertEqual(HashRainbow.colorForString("seen", colors: HashRainbow.RainbowColors), Color.blue)
        XCTAssertEqual(HashRainbow.colorForString("has fireplace", colors: HashRainbow.RainbowColors), Color.green)
        XCTAssertEqual(HashRainbow.colorForString("bathtub", colors: HashRainbow.RainbowColors), Color.yellow)
        XCTAssertEqual(HashRainbow.colorForString("gas", colors: HashRainbow.RainbowColors), Color.orange)
    }
}
