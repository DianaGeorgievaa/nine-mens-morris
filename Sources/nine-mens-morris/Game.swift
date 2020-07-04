class Game {
   private var board: Board
   private var combinations: [Position: [[Position]]]
   private var firstPlayer: Player
   private var secondPlayer: Player
   private var inputhHandler: InputHandler

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
    }

}