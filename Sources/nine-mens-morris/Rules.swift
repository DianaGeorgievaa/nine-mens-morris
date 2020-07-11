class Rules {
    private var combinations: [Position: [[Position]]]
    private var positionNeighbours: [Position: [Position]]
    
    init() {
        let nineMensMorrisCombinations = NineMensMorrisCombinations()
        self.combinations = nineMensMorrisCombinations.getCombinations()
        let neighbours = PositionNeighbours()
        self.positionNeighbours = neighbours.getNeighbours()
    }
    
    func isValidPutOnBoardPosition(position: String, board: Board) -> Bool {
        return isExistingPosition(position: position, board: board) && isEmptyPosition(position: position, board: board)
    }
    
    func isValidFirstMoveOnBoardPosition(position: String, player: RealPlayer, board: Board) -> Bool {
        return isExistingPosition(position: position, board: board) && isOccupiedByCurrentPlayer(position: position, player: player, board: board)
    }
    
    func isValidSecondMoveOnBoardPosition(position: String, board: Board) -> Bool {
        return isExistingPosition(position: position, board: board) && isEmptyPosition(position: position, board: board)
    }
    
    func isExistingPosition(position: String, board: Board) -> Bool {
        let chosenPosition = board.getPositionByName(positionName: position)
        if chosenPosition == nil {
            print(GameMessages.validPositionMessage.description)
            return false
        }
        return true
    }
    
    func isEmptyPosition(position: String, board: Board) -> Bool {
        let chosenPosition = board.getPositionByName(positionName: position)
        if chosenPosition?.getTokenColor() != TokenColor.empty {
            print(GameMessages.emptyPositionMessage.description)
            return false
        }
        return true
    }
    
    func isOccupiedByCurrentPlayer(position: String, player: RealPlayer, board: Board) -> Bool {
        let chosenPosition = board.getPositionByName(positionName: position)
        if chosenPosition?.getTokenColor() != player.getToken() {
            print(GameMessages.positionOccupiedBySelfTokenMessage.description)
            return false
        }
        return true
    }
    
    func isValidRemovePosition(position: String, board: Board, player: RealPlayer) -> Bool {
        let chosenPosition = board.getPositionByName(positionName: position)
        if chosenPosition == nil {
            print(GameMessages.validPositionMessage.description)
            return false
        }
        if chosenPosition?.getTokenColor() == TokenColor.empty || chosenPosition?.getTokenColor() == player.getToken() {
            print(GameMessages.validOpponentPositionMessage.description)
            return false
        }
        if checkForNineMensMorrisCombination(position: chosenPosition!, board: board) && !areAllOpponentPositionsInCombination(board: board, player: player) {
            print(GameMessages.positionNotInCombinationMessage.description)
            return false
        }
        return true
    }
    
    func areAllOpponentPositionsInCombination(board: Board, player: RealPlayer) -> Bool {
        let positions = board.getPositions()
        let opponentTokenColor = player.getToken() == TokenColor.white ? TokenColor.black : TokenColor.white
        for position in positions {
            if position.getTokenColor() == opponentTokenColor {
                if checkForNineMensMorrisCombination(position: position, board: board) == false {
                    return false
                }
            }
        }
        return true
    }
    
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