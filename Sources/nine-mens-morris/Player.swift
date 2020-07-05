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
    
    func updatePoints() {
        self.points+=1
    }
    
    func updatePlayedTokens() {
        self.playedTokens+=1
    }
    
    static func == (lhs: Player, rhs: Player) -> Bool {
        return (lhs.name == rhs.name && lhs.tokenColor == rhs.tokenColor)
    }
}
