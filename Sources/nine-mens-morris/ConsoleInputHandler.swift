class ConsoleInputHandler: InputHandler {
    
    /// Returns the player name. If the entered string is empty or with length 1, the player should enter his name again.
    ///
    /// - Returns: the name of the player
    func readPlayerName() -> String {
        var playerName = ""
        var isValidName = true
        while isValidName {
            print(InputMessages.inputNameMessage.description)
            playerName = readLine()!
            if(playerName.count <= 1){
                print(InputMessages.validNameMessage.description)
            } else {
                isValidName=false
            }
        }
        return playerName
    }
    
    /// Returns string which should represent the coordinates of game position
    ///
    /// - Parameters: the name of the current player
    /// - Returns: string which represents position
    func readPutPosition(playerName: String) -> String {
        print(InputMessages.inputPutPossition(playerName: playerName).description)
        let position = readLine()!
        return position
    }
    
    /// Returns string which should represent the position from which the 
    /// current player wants to remove opponent's token
    ///
    /// - Parameters: the name of the current player
    /// - Returns: string which represents opponent's token for removing
    func readRemovePosition(playerName: String) -> String {
        print(InputMessages.inputRemovePossition(playerName: playerName).description)
        let position = readLine()!
        return position
    }
    
    /// Returns two strings which represent the position of the token which the player wants to move on the board 
    /// and the the position where wants to move the token
    ///
    /// - Returns: the fromPosition and the toPosition
    func readMovePositions(playerName: String) -> (fromPosition: String, toPosition: String) {
        print(InputMessages.inputFirstMovePossition(playerName: playerName).description)
        let fromPosition = readLine()!
        print(InputMessages.inputSecondMovePossition(playerName: playerName).description)
        let toPosition = readLine()!
        return (fromPosition, toPosition)
    }
}