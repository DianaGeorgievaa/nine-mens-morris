protocol InputHandler {
    func readPlayerName() -> String
    func readPutPosition(playerName: String) -> String
    func readRemovePosition(playerName: String) -> String
    func readMovePositions(playerName: String) -> (fromPosition: String, toPosition: String)
}
