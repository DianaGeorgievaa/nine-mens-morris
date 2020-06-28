class Player{
    private var name: String
    private var tokenColor: TokenColor
    private var playedTokens: Int
    private var points: Int

    init(name: String, tokenColor: TokenColor){
        self.name=name
        self.tokenColor=tokenColor
        self.points=0
        self.playedTokens=0
    }

    func printPlayerDetails(){
        print("Player: \(name) \n" + "Points: \(points)")
    }

}