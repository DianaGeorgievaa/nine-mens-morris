class Position: Hashable, Equatable {
    private var coordinate: Coordinate
    private var tokenColor: TokenColor?
    private var neighboursCoordinates: [Coordinate]

    init(coordinate: Coordinate){
        self.coordinate = coordinate
        self.neighboursCoordinates = [Coordinate]()
    }

    static func == (lhs: Position, rhs: Position) -> Bool {
        return lhs.coordinate == rhs.coordinate
    }

    func hash(into hasher: inout Hasher) {
         hasher.combine(coordinate)
    }

}