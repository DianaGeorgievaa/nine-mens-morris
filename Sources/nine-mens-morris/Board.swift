class Board {
    private var currentGamePositions: [Position]
    private var positions: Positions
    private var positionsWithNames: [String: Position]

    
    init(){
       positions = Positions()
       positionsWithNames = positions.getPositions()
       currentGamePositions = Array(positionsWithNames.values)
    }

    func getPosition(positionName: String) -> Position? {
        let position = positionsWithNames[positionName]
        for p in currentGamePositions {
            if p == position  {
                return p
            }
        }
        return nil
    }
    
    func printToken(position: String) {
        let position = getPosition(positionName: position)
        let positionTokenColor = position!.getTokenColor()
       switch positionTokenColor {
        case TokenColor.white:
         print("")
        case TokenColor.black:
           print("")
        case TokenColor.empty:
         print("")

        }

    }

}

