struct Board {

  private var cells: [[Int]]

  init() {
    cells = Array(repeating: Array(repeating: 0, count: 9), count: 9)
  }

  subscript(row: Int, col: Int) -> Int {
    get {
      return cells[row][col]
    }
    set {
      cells[row][col] = newValue
    }
  }

  func isValid(value: Int, row: Int, col: Int) -> Bool {
    return !cells[row].contains(value) && !cells.contains { $0[col] == value }
  }

  func isSolved() -> Bool {
    return cells.allSatisfy { $0.allSatisfy { $0 != 0 } }
  }

}
