struct Board {

  static let dimension = 9

  private var cells: [[Int]]

  init() {
    cells = Array(repeating: Array(repeating: 0, count: Board.dimension), count: Board.dimension)
  }

  init(board: Board) {
    cells = board.cells
  }

  subscript(row: Int, col: Int) -> Int {
    get {
      return cells[row][col]
    }
    set {
      // TODO: only assign if newValue doesn't violate the Board invariants
      cells[row][col] = newValue
    }
  }

}
