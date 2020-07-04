class InputHandler {
     func readPlayerName() -> String {
       var playerName = ""
       var isValidName = false
        while isValidName {
           print("Enter your name: ")
            playerName = readLine()!
            if(playerName.count <= 1){
                print("Please enter valid name")
            } else {
                isValidName=true
            }
        }
        return playerName
    }

    func readMovePosition() -> String {
            print("Choose move position: ")
            let position = readLine()!
            return position
        }

     func readRemovePosition() -> String {
           print("Choose opponent's token to remove: ")
           let position = readLine()!
            return position
        }

}