class InputHandler {
     func readPlayerName() -> String {
       var playerName = ""
       var isValidName = false
        while isValidName {
           print("Enter your name: ")
            playerName = readLine()
            if(playerName.count <= 1){
                print("Please enter valid name")
            } else {
                isValidName=true
            }
        }
        return playerName
    }

    func readMovePosition() -> String {
       var position = ""
       var isValidPosition = false
        while isValidPosition {
           print("Choose move position: ")
            position = readLine()
                // TODO validate position
                print("Please enter valid position")
                isValidPosition=true
            }
             return position
        }

     func readRemovePosition() -> String {
      var position = ""
       var isValidPosition = false
        while isValidPosition {
           print("Choose opponent's token to remove: ")
            position = readLine()
                // TODO validate position
                print("Please enter valid position")
                isValidPosition=true
            }
             return position
        }

}