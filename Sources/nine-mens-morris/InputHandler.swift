class InputHandler {
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
    
    func readPutPosition(playerName: String) -> String {
        print(InputMessages.inputPutPossition(playerName: playerName).description)
        let position = readLine()!
        return position
    }
    
    func readRemovePosition(playerName: String) -> String {
        print(InputMessages.inputRemovePossition(playerName: playerName).description)
        let position = readLine()!
        return position
    }
    
    func readMovePositions(playerName: String) -> (fromPosition: String, toPosition: String) {
        print(InputMessages.inputFirstMovePossition(playerName: playerName).description)
        let fromPosition = readLine()!
        print(InputMessages.inputSecondMovePossition(playerName: playerName).description)
        let toPosition = readLine()!
        return (fromPosition, toPosition)
    }
}
