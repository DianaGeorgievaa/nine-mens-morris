enum GameMessages: CustomStringConvertible {
    case emptyPositionMessage
    case validPositionMessage
    case positionOccupiedBySelfTokenMessage
    case validOpponentPositionMessage
    case positionNotInCombinationMessage
    case validNeighbourPositionMessage
    
    var description: String {
        switch self {
        case .emptyPositionMessage:
            return "Please, choose empty position"
        case .validPositionMessage:
            return "Please, choose valid position"
        case .positionOccupiedBySelfTokenMessage:
            return "Please, choose valid position which is occupied by your token"
        case .validOpponentPositionMessage:
            return "Please, choose valid opponent position"
        case .positionNotInCombinationMessage:
            return "Please, choose opponent position which is not in nine mens morris combination"
        case .validNeighbourPositionMessage:
            return "Please, choose valid neighbour position"
        }
    }
}