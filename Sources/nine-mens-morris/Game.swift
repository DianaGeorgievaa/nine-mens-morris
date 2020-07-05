class Game {
    private var board: Board
    private var combinations: [Position: [[Position]]]
    private var firstPlayer: Player
    private var secondPlayer: Player
    private var inputhHandler: InputHandler
    private var currentPlayer: Player
    
    init(){
        self.inputhHandler = InputHandler()
        self.board = Board()
        let nineMensMorrisCombinations = NineMensMorrisCombinations()
        self.combinations = nineMensMorrisCombinations.getCombinations()
        let firstPlayerName = inputhHandler.readPlayerName()
        let secondPlayerName = inputhHandler.readPlayerName()
        self.firstPlayer = Player(name: firstPlayerName, tokenColor: TokenColor.white)
        print("Created first player - \(firstPlayerName)")
        self.secondPlayer = Player(name: secondPlayerName, tokenColor: TokenColor.black)
        print("Created second player - \(secondPlayerName)")
        currentPlayer = firstPlayer
    }
    
    func putToken() -> Position {
        var position = inputhHandler.readPutPosition(playerName: currentPlayer.getName())
        while isValidPutOnBoardPosition(position: position) {
            position = inputhHandler.readPutPosition(playerName: currentPlayer.getName())
        }
        let chosenPosition = board.getPosition(positionName: position)
        chosenPosition?.setTokenColor(tokenColor: currentPlayer.getToken())
        board.updatePosition(position: chosenPosition!)
        board.printBoard()
        if currentPlayer == firstPlayer {
            firstPlayer.updatePlayedTokens()
        } else {
            secondPlayer.updatePlayedTokens()
        }
        
        return chosenPosition!
    }
    //todo update current player
    func isValidPutOnBoardPosition(position: String) -> Bool {
        return isExistingPosition(position: position) && isEmptyPosition(position: position)
    }
    
    func isEmptyPosition(position: String) -> Bool {
        let chosenPosition = board.getPosition(positionName: position)
        if chosenPosition?.getTokenColor() != TokenColor.empty {
            print("Please, choose empty position")
            return false
        }
        return true
    }
    
    func isExistingPosition(position: String) -> Bool {
        let chosenPosition = board.getPosition(positionName: position)
        if chosenPosition == nil {
            print("Please, choose valid position")
            return false
        }
        return true
    }
    
    func isOccupiedByCurrentPlayer(position: String) -> Bool {
        let chosenPosition = board.getPosition(positionName: position)
        if chosenPosition?.getTokenColor() != currentPlayer.getToken() {
            print("Please, choose valid position which is occupied by your token")
            return false
        }
        return true
    }
    
    func isValidMoveOnBoardPosition(position: String) -> Bool {
        return isExistingPosition(position: position) && isOccupiedByCurrentPlayer(position: position)
    }
    
    func play() {
        let currentPosition = putToken()
        if checkForNineMensMorrisCombination(position: currentPosition) {
            if currentPlayer == firstPlayer {
                firstPlayer.updatePoints()
            } else {
                secondPlayer.updatePoints()
            }
            var position = inputhHandler.readRemovePosition(playerName: currentPlayer.getName())
            while isValidRemovePosition(position: position) {
                position = inputhHandler.readRemovePosition(playerName: currentPlayer.getName())
            }
            let chosenPosition = board.getPosition(positionName: position)
            chosenPosition?.setTokenColor(tokenColor: TokenColor.empty)
            board.updatePosition(position: chosenPosition!)
            board.printBoard()
        }
        if currentPlayer == firstPlayer {
            currentPlayer = secondPlayer
        } else {
            currentPlayer = firstPlayer
        }
    }
    
    func isValidRemovePosition(position: String) -> Bool {
        let chosenPosition = board.getPosition(positionName: position)
        if chosenPosition == nil {
            print("Please, choose valid position")
            return false
        }
        if chosenPosition?.getTokenColor() != TokenColor.empty && chosenPosition?.getTokenColor() != currentPlayer.getToken() {
            print("Please, choose valid opponent position")
            return false
        }
        if checkForNineMensMorrisCombination(position: chosenPosition!) && areAllOpponentPositionsInCombination() {
            print("Please, choose opponent position which is not in nine mens morris combination")
            return false
        }
        return true
    }
    
    func areAllOpponentPositionsInCombination() -> Bool {
        let positions = board.getPositions()
        let opponentTokenColor = currentPlayer.getToken() == TokenColor.white ? TokenColor.black : TokenColor.white
        for position in positions {
            if position.getTokenColor() == opponentTokenColor {
                if checkForNineMensMorrisCombination(position: position) == false {
                    return false
                }
            }
        }
        return true
    }
    
    func checkForNineMensMorrisCombination(position: Position) -> Bool {
        let neighbours = combinations[position]
        var isNineMensMorrisCombination = false
        for currentNeighbours in neighbours! {
            isNineMensMorrisCombination = checkCombination(positions: currentNeighbours)
            if isNineMensMorrisCombination == true {
                return true
            }
        }
        return isNineMensMorrisCombination
    }
    
    func checkCombination(positions: [Position]) -> Bool {
        for position in positions {
            let positionIndex = board.getPositions().firstIndex(of: position)!
            let currentPosition = board.getPositions()[positionIndex]
            if currentPosition.getTokenColor() != position.getTokenColor() {
                return false
            }
        }
        
        return true
    }
    
    func moveTokenOnBoard(from: Position, to: Position) {
        var position = inputhHandler.readMovePosition(playerName: currentPlayer.getName())
        while isValidMoveOnBoardPosition(position: position.fromPosition) {
            position = inputhHandler.readMovePosition(playerName: currentPlayer.getName())
        }
        //TODO
    }
}
