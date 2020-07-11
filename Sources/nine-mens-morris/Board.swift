class Board {
    private var currentGamePositions: [Position]
    private var validPositions: ValidPositions
    private var positionsWithNames: [String: Position]
    
    init() {
        validPositions = ValidPositions()
        positionsWithNames = validPositions.getPositions()
        currentGamePositions = Array(positionsWithNames.values)
    }
    
    func getPositionByName(positionName: String) -> Position? {
        let position = positionsWithNames[positionName]
        for p in currentGamePositions {
            if p == position  {
                return p
            }
        }
        return nil
    }
    
    func getPositions() -> [Position] {
        return currentGamePositions
    }
    
    func getNumberOfPlayerTokensOnBoard(player: RealPlayer) -> Int {
        var numberOfTokens = 0
        for position in currentGamePositions {
            if position.getTokenColor() == player.getToken() {
                numberOfTokens += 1
            }
        }
        return numberOfTokens
    }
    
    func updatePositionTokenColor(position: Position) {
        let positionIndex = currentGamePositions.firstIndex(of: position)!
        currentGamePositions[positionIndex].setTokenColor(tokenColor: position.getTokenColor())
    }
    
    func printBoard() {
        print("   A   B   C   D   E   F   G\n")
        print("1  \(getTokenSymbol(position: "A1"))-----------\(getTokenSymbol(position: "D1"))-----------\(getTokenSymbol(position: "G1"))")
        print("   |           |           |")
        print("2  |   \(getTokenSymbol(position: "B2"))-------\(getTokenSymbol(position: "D2"))-------\(getTokenSymbol(position: "F2"))   |")
        print("   |   |       |       |   |")
        print("3  |   |   \(getTokenSymbol(position: "C3"))---\(getTokenSymbol(position: "D3"))---\(getTokenSymbol(position: "E3"))   |   |")
        print("   |   |   |       |   |   |")
        print("4  \(getTokenSymbol(position: "A4"))---\(getTokenSymbol(position: "B4"))---\(getTokenSymbol(position: "C4"))       \(getTokenSymbol(position: "E4"))---\(getTokenSymbol(position: "F4"))---\(getTokenSymbol(position: "G4"))")
        print("   |   |   |       |   |   |")
        print("5  |   |   \(getTokenSymbol(position: "C5"))---\(getTokenSymbol(position: "D5"))---\(getTokenSymbol(position: "E5"))   |   |")
        print("   |   |       |       |   |")
        print("6  |   \(getTokenSymbol(position: "B6"))-------\(getTokenSymbol(position: "D6"))-------\(getTokenSymbol(position: "F6"))   |")
        print("   |           |           |")
        print("7  \(getTokenSymbol(position: "A7"))-----------\(getTokenSymbol(position: "D7"))-----------\(getTokenSymbol(position: "G7"))")
    }
    
    internal func getTokenSymbol(position: String) -> String {
        let position = getPositionByName(positionName: position)
        let positionTokenColor = position!.getTokenColor()
        return positionTokenColor.description
    }
}
