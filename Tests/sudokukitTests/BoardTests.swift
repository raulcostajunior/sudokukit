import XCTest

@testable import sudokukit

final class BoardTests: XCTestCase {
  func testBoardInit() {
    let board = Board()
    print("Board: \(board)")
  }
}
