class Game {
    let MAX_NUMBER_OF_PLAYER_TOKENS = 9
    let MIN_NUMBER_OF_PLAYER_TOKENS_ON_BOARD = 3
    
    private var board: Board
    private var firstPlayer: Player
    private var secondPlayer: Player
    private var currentPlayer: Player
    private var inputhHandler: InputHandler
    private var rules: Rules;
    
    init() {
        self.inputhHandler = ConsoleInputHandler()
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
        while firstPlayer.playedTokens + secondPlayer.points < MAX_NUMBER_OF_PLAYER_TOKENS || secondPlayer.playedTokens + firstPlayer.points < MAX_NUMBER_OF_PLAYER_TOKENS {
            let currentPosition = putToken()
            play(position: currentPosition)
        }
        while firstPlayer.playedTokens >= MIN_NUMBER_OF_PLAYER_TOKENS_ON_BOARD && secondPlayer.playedTokens >= MIN_NUMBER_OF_PLAYER_TOKENS_ON_BOARD {
            let currentPosition = moveTokenOnBoard()
            play(position: currentPosition)
        }
        printGameResult()
    }
    
    /// Puts a new token on the board if the choosen by the current player position is valid
    /// and increases the current player's played tokens by 1.
    ///
    /// - Returns: position - the board position where the token is put
    internal func putToken() -> Position {
        var position = inputhHandler.readPutPosition(playerName: currentPlayer.name)
        while !rules.isValidPutOnBoardPosition(position: position, board: board) {
            position = inputhHandler.readPutPosition(playerName: currentPlayer.name)
        }
        let chosenPosition = board.getPositionByName(positionName: position)
        chosenPosition?.setTokenColor(tokenColor: currentPlayer.tokenColor)
        board.updatePositionTokenColor(position: chosenPosition!)
        board.printBoard()
        
        if currentPlayer as! RealPlayer == firstPlayer as! RealPlayer {
            firstPlayer.increasePlayedTokens()
        } else {
            secondPlayer.increasePlayedTokens()
        }
        
        return chosenPosition!
    }
    
    /// The method represent a player turn - checks for nine mens morris comnination
    ///  the position which the player has chosen. If the position is in combination, the current
    ///  player's points are being increased and the player has to choose which opponen's token to remove
    ///
    /// - Parameters: position - the position which the player has chosen
    internal func play(position: Position) {
        if rules.checkForNineMensMorrisCombination(position: position, board: board) {
            var opponent: RealPlayer
            if currentPlayer as! RealPlayer == firstPlayer as! RealPlayer {
                firstPlayer.updatePoints()
                opponent = secondPlayer as! RealPlayer
            } else {
                secondPlayer.updatePoints()
                opponent = firstPlayer as! RealPlayer
            }
            var position = inputhHandler.readRemovePosition(playerName: currentPlayer.name)
            while !rules.isValidRemovePosition(position: position, board: board, player: currentPlayer) {
                position = inputhHandler.readRemovePosition(playerName: currentPlayer.name)
            }
            opponent.decresePlayedTokens()
            let chosenPosition = board.getPositionByName(positionName: position)
            chosenPosition?.setTokenColor(tokenColor: TokenColor.empty)
            board.updatePositionTokenColor(position: chosenPosition!)
            board.printBoard()
        }
        if currentPlayer as! RealPlayer == firstPlayer as! RealPlayer {
            currentPlayer = secondPlayer
        } else {
            currentPlayer = firstPlayer
        }
    }
    
    /// Reads two positions - the position from which the player wants to move his token and the position
    /// where wants to put the token. The two positions are validated by the rules and if they are valid
    /// the board is being updated
    ///
    /// - Returns: position - the position where the token is being moved
    internal func moveTokenOnBoard() -> Position {
        var positions = inputhHandler.readMovePositions(playerName: currentPlayer.name)
        if board.getNumberOfPlayerTokensOnBoard(player: currentPlayer) == 3 {
            while !rules.isValidFirstMoveOnBoardPosition(position: positions.fromPosition, player: currentPlayer, board: board) ||
                !rules.isValidPutOnBoardPosition(position: positions.toPosition, board: board) {
                    
                    positions = inputhHandler.readMovePositions(playerName: currentPlayer.name)
            }
            
            let fromPosition = board.getPositionByName(positionName: positions.fromPosition)
            fromPosition?.setTokenColor(tokenColor: TokenColor.empty)
            
            let toPosition = board.getPositionByName(positionName: positions.toPosition)
            toPosition?.setTokenColor(tokenColor: currentPlayer.tokenColor)
            
            board.updatePositionTokenColor(position: fromPosition!)
            board.updatePositionTokenColor(position: toPosition!)
            board.printBoard()
        } else {
            var fromPosition = board.getPositionByName(positionName: positions.fromPosition)
            var toPosition = board.getPositionByName(positionName: positions.toPosition)
            while !rules.isValidFirstMoveOnBoardPosition(position: positions.fromPosition, player: currentPlayer, board: board) ||
                !rules.isValidSecondMoveOnBoardPosition(position: positions.toPosition, board: board) ||
                !rules.areNeighbourPosition(from: fromPosition!, to: toPosition!) {
                    positions = inputhHandler.readMovePositions(playerName: currentPlayer.name)
                    fromPosition = board.getPositionByName(positionName: positions.fromPosition)
                    toPosition = board.getPositionByName(positionName: positions.toPosition)
            }
            fromPosition?.setTokenColor(tokenColor: TokenColor.empty)
            toPosition?.setTokenColor(tokenColor: currentPlayer.tokenColor)
            
            board.updatePositionTokenColor(position: fromPosition!)
            board.updatePositionTokenColor(position: toPosition!)
            board.printBoard()
        }
        
        return board.getPositionByName(positionName: positions.toPosition)!
    }
    
    /// Prints the game result
    internal func printGameResult() {
        print("END GAME")
        print("Result: ")
        firstPlayer.printDetails()
        secondPlayer.printDetails()
    }
}
