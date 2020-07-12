/// Enum with the input messages
enum InputMessages {
    case inputNameMessage
    case validNameMessage
    case inputPutPossition(playerName: String)
    case inputRemovePossition(playerName: String)
    case inputFirstMovePossition(playerName: String)
    case inputSecondMovePossition(playerName: String)
    
    var description: String {
        switch self {
        case .inputNameMessage:
            return "Enter your name: "
        case .validNameMessage:
            return "Please, enter valid name"
        case .inputPutPossition(let playerName):
            return "\(playerName), choose position to put a token: "
        case .inputRemovePossition(let playerName):
            return "\(playerName), choose opponent's token to remove: "
        case .inputFirstMovePossition(let playerName):
            return "\(playerName), choose which token to move: "
        case .inputSecondMovePossition(let playerName):
            return "\(playerName), choose where to move: "
        }
    }
}

