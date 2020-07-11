class RealPlayer: Player {
    var name: String
    var tokenColor: TokenColor
    var playedTokens: Int
    var points: Int
    
    required init(name: String, tokenColor: TokenColor){
        self.name=name
        self.tokenColor=tokenColor
        self.points=0
        self.playedTokens=0
    }
    
    func getName() -> String {
        return name
    }
    
    func getToken() -> TokenColor {
        return tokenColor
    }
    
    func getPlayedTokens() -> Int {
        return playedTokens
    }
    
    func getPoints() -> Int {
        return points
    }
    
    /// Prints the name and the points of the player
    func printDetails(){
        print("Player: \(name) \n" + "Points: \(points)")
    }
    
    func updatePoints() {
        points+=1
    }
    
    /// Increases the played tokens by 1
    func increasePlayedTokens() {
        playedTokens+=1
    }
    
    /// Decreases the played tokens by 1
    func decresePlayedTokens() {
        playedTokens-=1
    }
}

extension RealPlayer: Equatable {
    static func == (lhs: RealPlayer, rhs: RealPlayer) -> Bool {
        return (lhs.name == rhs.name && lhs.tokenColor == rhs.tokenColor)
    }
}