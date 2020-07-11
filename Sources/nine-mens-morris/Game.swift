class Game {
    private var board: Board
    private var firstPlayer: RealPlayer
    private var secondPlayer: RealPlayer
    private var currentPlayer: RealPlayer
    private var inputhHandler: InputHandler
    private var rules: Rules;
    
    init() {
        self.inputhHandler = InputHandler()
        self.board = Board()
        self.rules = Rules()
        
        print("Creating first player")
        let firstPlayerName = inputhHandler.readPlayerName()
        self.firstPlayer = RealPlayer(name: firstPlayerName, tokenColor: TokenColor.white)
        print("Created first player - \(firstPlayerName)")
        print("Creating second player")
        let secondPlayerName = inputhHandler.readPlayerName()
        self.secondPlayer = RealPlayer(name: secondPlayerName, tokenColor: TokenColor.black)
        print("Created second player - \(secondPlayerName)")
        currentPlayer = firstPlayer
    }
    
    /// Represents the whole playing process. While the two players have more than 9 tokens, 
    /// they put them one by one on the board. When all the tokens are played,
    /// the players can move the tokens which are on the board. When one of the players is with less than 3 tokens,
    /// the game ends and the result is printed on the console.
    func playGame() {
        board.printBoard()
        while firstPlayer.getPlayedTokens() + secondPlayer.getPoints() < 9 || secondPlayer.getPlayedTokens() + firstPlayer.getPoints() < 9 {
            let currentPosition = putToken()
            play(position: currentPosition)
        }
        while firstPlayer.getPlayedTokens() >= 3 && secondPlayer.getPlayedTokens() >= 3 {
            let currentPosition = moveTokenOnBoard()
            play(position: currentPosition)
        }
        printGameResult()
    }
    
    /// Puts a new token on the board if the choosen by the current player position is valid
    /// and increases the current player's played tokens by 1.
    ///
    /// Returns: position - the board position where the token is put
    internal func putToken() -> Position {
        var position = inputhHandler.readPutPosition(playerName: currentPlayer.getName())
        while !rules.isValidPutOnBoardPosition(position: position, board: board) {
            position = inputhHandler.readPutPosition(playerName: currentPlayer.getName())
        }
        let chosenPosition = board.getPositionByName(positionName: position)
        chosenPosition?.setTokenColor(tokenColor: currentPlayer.getToken())
        board.updatePositionTokenColor(position: chosenPosition!)
        board.printBoard()
        
        if currentPlayer == firstPlayer {
            firstPlayer.increasePlayedTokens()
        } else {
            secondPlayer.increasePlayedTokens()
        }
        
        return chosenPosition!
    }
    
    
    internal func play(position: Position) {
        if rules.checkForNineMensMorrisCombination(position: position, board: board) {
            var opponent: RealPlayer
            if currentPlayer == firstPlayer {
                firstPlayer.updatePoints()
                opponent = secondPlayer
            } else {
                secondPlayer.updatePoints()
                opponent = firstPlayer
            }
            var position = inputhHandler.readRemovePosition(playerName: currentPlayer.getName())
            while !rules.isValidRemovePosition(position: position, board: board, player: currentPlayer) {
                position = inputhHandler.readRemovePosition(playerName: currentPlayer.getName())
            }
            opponent.decresePlayedTokens()
            let chosenPosition = board.getPositionByName(positionName: position)
            chosenPosition?.setTokenColor(tokenColor: TokenColor.empty)
            board.updatePositionTokenColor(position: chosenPosition!)
            board.printBoard()
        }
        if currentPlayer == firstPlayer {
            currentPlayer = secondPlayer
        } else {
            currentPlayer = firstPlayer
        }
    }
    
    internal func moveTokenOnBoard() -> Position {
        var positions = inputhHandler.readMovePositions(playerName: currentPlayer.getName())
        if board.getNumberOfPlayerTokensOnBoard(player: currentPlayer) == 3 {
            while !rules.isValidFirstMoveOnBoardPosition(position: positions.fromPosition, player: currentPlayer, board: board) ||
                !rules.isValidPutOnBoardPosition(position: positions.toPosition, board: board) {
                    
                    positions = inputhHandler.readMovePositions(playerName: currentPlayer.getName())
            }
            
            let fromPosition = board.getPositionByName(positionName: positions.fromPosition)
            fromPosition?.setTokenColor(tokenColor: TokenColor.empty)
            
            let toPosition = board.getPositionByName(positionName: positions.toPosition)
            toPosition?.setTokenColor(tokenColor: currentPlayer.getToken())
            
            board.updatePositionTokenColor(position: fromPosition!)
            board.updatePositionTokenColor(position: toPosition!)
            board.printBoard()
        } else {
            var fromPosition = board.getPositionByName(positionName: positions.fromPosition)
            var toPosition = board.getPositionByName(positionName: positions.toPosition)
            while !rules.isValidFirstMoveOnBoardPosition(position: positions.fromPosition, player: currentPlayer, board: board) ||
                !rules.isValidSecondMoveOnBoardPosition(position: positions.toPosition, board: board) ||
                !rules.areNeighbourPosition(from: fromPosition!, to: toPosition!) {
                    positions = inputhHandler.readMovePositions(playerName: currentPlayer.getName())
                    fromPosition = board.getPositionByName(positionName: positions.fromPosition)
                    toPosition = board.getPositionByName(positionName: positions.toPosition)
            }
            fromPosition?.setTokenColor(tokenColor: TokenColor.empty)
            toPosition?.setTokenColor(tokenColor: currentPlayer.getToken())
            
            board.updatePositionTokenColor(position: fromPosition!)
            board.updatePositionTokenColor(position: toPosition!)
            board.printBoard()
        }
        
        return board.getPositionByName(positionName: positions.toPosition)!
    }
    
    internal func printGameResult() {
        print("END GAME")
        print("Result: ")
        firstPlayer.printDetails()
        secondPlayer.printDetails()
    }
}
