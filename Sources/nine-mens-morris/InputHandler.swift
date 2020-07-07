class InputHandler {
    func readPlayerName() -> String {
        var playerName = ""
        var isValidName = true
        while isValidName {
            print("Enter your name: ")
            playerName = readLine()!
            if(playerName.count <= 1){
                print("Please enter valid name")
            } else {
                isValidName=false
            }
        }
        return playerName
    }
    
    func readPutPosition(playerName: String) -> String {
        print("\(playerName), choose move position: ")
        let position = readLine()!
        return position
    }
    
    func readRemovePosition(playerName: String) -> String {
        print("\(playerName), choose opponent's token to remove: ")
        let position = readLine()!
        return position
    }
    
    func readMovePosition(playerName: String) -> (fromPosition: String, toPosition: String) {
        print("\(playerName), choose which token to move: ")
        let fromPosition = readLine()!
        print("\(playerName), choose where to move: ")
        let toPosition = readLine()!
        return (fromPosition, toPosition)
    }
}
