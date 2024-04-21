import XCTest
@testable import sudokukit

func testBoardInit() {
  let board = Board()

  XCTAssertEqual(board.rows.count, 9)
  XCTAssertEqual(board.cols.count, 9)
  XCTAssertEqual(board.boxes.count, 9)

  for row in board.rows {
    XCTAssertEqual(row.count, 9)
  }

  for col in board.cols {
    XCTAssertEqual(col.count, 9)
  }

  for box in board.boxes {
    XCTAssertEqual(box.count, 9)
  }
}

func testBoardSetNumber() {
  var board = Board()

  board.set(number: 5, at: Position(row: 0, col: 0))

  XCTAssertEqual(board.rows[0][0], 5)
  XCTAssertEqual(board.cols[0][0], 5)
  XCTAssertEqual(board.boxes[0][0], 5)
}

func testBoardRemoveNumber() {
  var board = Board()

  board.set(number: 5, at: Position(row: 0, col: 0))
  board.remove(at: Position(row: 0, col: 0))

  XCTAssertNil(board.rows[0][0])
  XCTAssertNil(board.cols[0][0])
  XCTAssertNil(board.boxes[0][0])
}

func testIsValidSet() {
  var board = Board()

  XCTAssertTrue(board.isValidSet(number: 1, at: Position(row: 0, col: 0)))

  board.set(number: 1, at: Position(row: 0, col: 0))

  XCTAssertFalse(board.isValidSet(number: 1, at: Position(row: 0, col: 1)))
  XCTAssertFalse(board.isValidSet(number: 1, at: Position(row: 1, col: 0)))
  XCTAssertFalse(board.isValidSet(number: 1, at: Position(row: 0, col: 0)))
}

func testIsComplete() {
  var board = Board()

  XCTAssertFalse(board.isComplete)

  for row in 0..<9 {
    for col in 0..<9 {
      board.set(number: row * 9 + col + 1, at: Position(row: row, col: col))
    }
  }

  XCTAssertTrue(board.isComplete)
}
