struct Coordinate: Hashable {
    private var row: Int
    private var column: Character
    
    init(row: Int, column: Character) {
        self.row = row
        self.column = column
    }
}

extension Coordinate: Equatable {
    static func == (lhs: Coordinate, rhs: Coordinate) -> Bool {
        return (lhs.row == rhs.row && lhs.column == rhs.column)
    }
}