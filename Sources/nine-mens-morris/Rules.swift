class Rules {
    private var combinations: [Position: [[Position]]]
    private var positionNeighbours: [Position: [Position]]
    
    init() {
        let nineMensMorrisCombinations = NineMensMorrisCombinations()
        self.combinations = nineMensMorrisCombinations.getCombinations()
        let neighbours = PositionNeighbours()
        self.positionNeighbours = neighbours.getNeighbours()
    }
    
    /// Checks if the position where the player wants to put token is valid
    ///
    /// - Parameters: position - the position where the player wants to put token
    ///               board - the current game board with the occupied positions
    /// - Returns: true - if the token can be placed on the position and false otherwise
    func isValidPutOnBoardPosition(position: String, board: Board) -> Bool {
        return isExistingPosition(position: position, board: board) && isEmptyPosition(position: position, board: board)
    }
    
    /// Checks if the position from which the player wants to move his token is valid
    ///
    /// - Parameters: position - the position from which the player wants to move his token
    ///               player - the current player
    ///               board - the current game board with the occupied positions
    /// - Returns: true - if the token can be moved from the position and false otherwise
    func isValidFirstMoveOnBoardPosition(position: String, player: Player, board: Board) -> Bool {
        return isExistingPosition(position: position, board: board) && isOccupiedByCurrentPlayer(position: position, player: player, board: board)
    }
    
    /// Checks if the position where the player wants to move his token is valid
    ///
    /// - Parameters: position - the position where the player wants to move his token
    ///               player - the current player
    ///               board - the current game board with the occupied positions
    /// - Returns: true - if the token can be moved to the position and false otherwise
    func isValidSecondMoveOnBoardPosition(position: String, board: Board) -> Bool {
        return isExistingPosition(position: position, board: board) && isEmptyPosition(position: position, board: board)
    }
    
    /// Checks if position is existing
    ///
    /// - Parameters: position - the name od the position
    ///               board - the current game board with the occupied positions
    /// - Returns: true - if the position is existing and false otherwise
    func isExistingPosition(position: String, board: Board) -> Bool {
        let chosenPosition = board.getPositionByName(positionName: position)
        if chosenPosition == nil {
            print(GameMessages.validPositionMessage.description)
            return false
        }
        return true
    }
    
    /// Checks if position is occuppied
    ///
    /// - Parameters: position - the name od the position
    ///               board - the current game board with the occupied positions
    /// - Returns: true - if the position is not occupied and false otherwise
    func isEmptyPosition(position: String, board: Board) -> Bool {
        let chosenPosition = board.getPositionByName(positionName: position)
        if chosenPosition?.getTokenColor() != TokenColor.empty {
            print(GameMessages.emptyPositionMessage.description)
            return false
        }
        return true
    }
    
    /// Checks if position is occuppied by current player's token
    ///
    /// - Parameters: position - the name od the position
    ///               player - the current player
    ///               board - the current game board with the occupied positions
    /// - Returns: true - if the position is occupied by the current player's token and false otherwise
    func isOccupiedByCurrentPlayer(position: String, player: Player, board: Board) -> Bool {
        let chosenPosition = board.getPositionByName(positionName: position)
        if chosenPosition?.getTokenColor() != player.tokenColor {
            print(GameMessages.positionOccupiedBySelfTokenMessage.description)
            return false
        }
        return true
    }
    
    /// Checks if the player can remove opponent's token from the specified possition
    ///
    /// - Parameters: position - the name od the position
    ///               player - the current player
    ///               board - the current game board with the occupied positions
    /// - Returns: true - if the player can remove the opponent's token from the passed possition
    func isValidRemovePosition(position: String, board: Board, player: Player) -> Bool {
        let chosenPosition = board.getPositionByName(positionName: position)
        if chosenPosition == nil {
            print(GameMessages.validPositionMessage.description)
            return false
        }
        if chosenPosition?.getTokenColor() == TokenColor.empty || chosenPosition?.getTokenColor() == player.tokenColor {
            print(GameMessages.validOpponentPositionMessage.description)
            return false
        }
        if checkForNineMensMorrisCombination(position: chosenPosition!, board: board) && !areAllOpponentPositionsInCombination(board: board, player: player) {
            print(GameMessages.positionNotInCombinationMessage.description)
            return false
        }
        return true
    }
    
    /// Checks if all opponent's tokens which are on the board are in nine mens morris combination
    ///
    /// - Parameters: player - the opponent player
    ///               board - the current game board with the occupied positions
    /// - Returns: true - if all opponent's tokens are in nine mens morris combination and false otherwise
    func areAllOpponentPositionsInCombination(board: Board, player: Player) -> Bool {
        let positions = board.getPositions()
        let opponentTokenColor = player.tokenColor == TokenColor.white ? TokenColor.black : TokenColor.white
        for position in positions {
            if position.getTokenColor() == opponentTokenColor {
                if checkForNineMensMorrisCombination(position: position, board: board) == false {
                    return false
                }
            }
        }
        return true
    }
    
    /// Checks if the passed position makes nine mens morris combination with the tokens on the board
    ///
    /// - Parameters: position - the position for which the check is made
    ///               board - the current game board with the occupied positions
    /// - Returns: true - if the position is in nine mens morris combination and false otherwise
    func checkForNineMensMorrisCombination(position: Position, board: Board) -> Bool {
        let neighbours = combinations[position]
        var isNineMensMorrisCombination = false
        for currentNeighbours in neighbours! {
            isNineMensMorrisCombination = checkCombination(position: position, positions: currentNeighbours, board: board)
            if isNineMensMorrisCombination {
                return true
            }
        }
        return isNineMensMorrisCombination
    }
    
    func checkCombination(position: Position, positions: [Position], board: Board) -> Bool {
        for currentPosition in positions {
            let positionIndex = board.getPositions().firstIndex(of: currentPosition)!
            let boardPosition = board.getPositions()[positionIndex]
            if boardPosition.getTokenColor() != position.getTokenColor() {
                return false
            }
        }
        
        return true
    }
    
    /// Checks if two positions are neighbours
    /// 
    /// - Parameters: from - the first position
    ///               to - the second position
    /// - Returns: true if the positions are neighbours and false otherwise
    func areNeighbourPosition(from: Position, to: Position) -> Bool {
        let neighbours = positionNeighbours[from]!
        for neighbour in neighbours {
            if neighbour == to {
                return true
            }
        }
        print(GameMessages.validNeighbourPositionMessage.description)
        return false
    }
}
