class Position {
    private var coordinate: Coordinate
    private var tokenColor: TokenColor
    
    init(coordinate: Coordinate){
        self.coordinate = coordinate
        self.tokenColor = TokenColor.empty
    }
    
    func getTokenColor() -> TokenColor {
        return tokenColor
    }
    
    func setTokenColor(tokenColor: TokenColor) {
        self.tokenColor = tokenColor
    }
}

extension Position: Equatable {
    static func == (lhs: Position, rhs: Position) -> Bool {
        return lhs.coordinate == rhs.coordinate
    }
}

extension Position: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(coordinate)
    }
}