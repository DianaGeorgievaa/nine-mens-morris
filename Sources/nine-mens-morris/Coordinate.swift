struct Coordinate: Hashable, Equatable {
    var row: Int
    var column: Character

    init(row: Int, column: Character) {
       self.row = row
       self.column = column
    }
    
    static func == (lhs: Coordinate, rhs: Coordinate) -> Bool {
        return (lhs.row == rhs.row && lhs.column == rhs.column)
    }
}