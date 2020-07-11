/// The protocol which should be implemented by every specific type of player
/// The current version of the application has only one type of player - RealPlayer
protocol Player {
    var name: String {get}
    var tokenColor: TokenColor {get}
    var playedTokens: Int {get }
    var points: Int {get}
    
    init(name: String, tokenColor: TokenColor)
    
    func printDetails()
    func updatePoints()
    func increasePlayedTokens()
    func decresePlayedTokens()
}