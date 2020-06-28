class Position {
    private var coordinate: Coordinate
    private var tokenColor: TokenColor?
    private var neighboursCoordinates: [Coordinate]

    init(coordinate: Coordinate){
        self.coordinate = coordinate
        self.neighboursCoordinates = [Coordinate]()
    }
}