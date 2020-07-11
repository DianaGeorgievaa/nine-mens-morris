/// Represents the game board with the occupied positions
class Board {
    private var currentGamePositions: [Position]
    private var validPositions: ValidPositions
    private var positionsWithNames: [String: Position]
    
    init() {
        validPositions = ValidPositions()
        positionsWithNames = validPositions.getPositions()
        currentGamePositions = Array(positionsWithNames.values)
    }
    
    /// Returns position by given name. Gets the position from the dictionary which contains
    /// the game positions and their names and then finds the position in the current games positions
    ///
    /// - Parameter: positionName - the name of the position
    /// - Returns: position
    func getPositionByName(positionName: String) -> Position? {
        let position = positionsWithNames[positionName]
        for p in currentGamePositions {
            if p == position  {
                return p
            }
        }
        return nil
    }
    
    /// Returns the current game possions
    func getPositions() -> [Position] {
        return currentGamePositions
    }
    
    /// Returns the number of the specified player's tokens which are on the board by iterrating through the current 
    /// game positions and checking the position's token color and the token color with which the player plays
    ///
    /// - Parameter: player
    /// - Returns: number of tokens
    func getNumberOfPlayerTokensOnBoard(player: RealPlayer) -> Int {
        var numberOfTokens = 0
        for position in currentGamePositions {
            if position.getTokenColor() == player.getToken() {
                numberOfTokens += 1
            }
        }
        return numberOfTokens
    }
     
    /// Updates the token color of the passed position in the array with the current game positions
    ///
    /// - Parameter: position
    func updatePositionTokenColor(position: Position) {
        let positionIndex = currentGamePositions.firstIndex(of: position)!
        currentGamePositions[positionIndex].setTokenColor(tokenColor: position.getTokenColor())
    }
    
    /// Prints the board with the current occupied positions
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
    
    /// Returns the symbol which represents if the passed possition is occupied
    ///
    /// - Parameter: position - the position which token will be checked
    /// - Returns: the symbol which represents if the position is occupied
    internal func getTokenSymbol(position: String) -> String {
        let position = getPositionByName(positionName: position)
        let positionTokenColor = position!.getTokenColor()
        return positionTokenColor.description
    }
}
