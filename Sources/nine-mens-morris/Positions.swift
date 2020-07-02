class Positions {
     var namesOfPositions: [String: Position]

     init(){
            namesOfPositions = [String: Position]()

            namesOfPositions["A1"] = Position(coordinate: Coordinate(row: 1, column: "A"))
            namesOfPositions["A4"] = Position(coordinate: Coordinate(row: 4, column: "A"))
            namesOfPositions["A7"] = Position(coordinate: Coordinate(row: 7, column: "A"))
            namesOfPositions["D1"] = Position(coordinate: Coordinate(row: 1, column: "D"))
            namesOfPositions["G1"] = Position(coordinate: Coordinate(row: 1, column: "G"))
            namesOfPositions["D7"] = Position(coordinate: Coordinate(row: 7, column: "D"))
            namesOfPositions["G7"] = Position(coordinate: Coordinate(row: 7, column: "G"))
            namesOfPositions["G4"] = Position(coordinate: Coordinate(row: 4, column: "G"))
            namesOfPositions["B2"] = Position(coordinate: Coordinate(row: 2, column: "B"))
            namesOfPositions["B4"] = Position(coordinate: Coordinate(row: 4, column: "B"))
            namesOfPositions["B6"] = Position(coordinate: Coordinate(row: 6, column: "B"))
            namesOfPositions["D2"] = Position(coordinate: Coordinate(row: 2, column: "D"))
            namesOfPositions["F2"] = Position(coordinate: Coordinate(row: 2, column: "F"))
            namesOfPositions["D6"] = Position(coordinate: Coordinate(row: 6, column: "D"))
            namesOfPositions["F6"] = Position(coordinate: Coordinate(row: 6, column: "F"))
            namesOfPositions["F4"] = Position(coordinate: Coordinate(row: 4, column: "F"))
            namesOfPositions["C3"] = Position(coordinate: Coordinate(row: 3, column: "C"))
            namesOfPositions["E3"] = Position(coordinate: Coordinate(row: 3, column: "E"))
            namesOfPositions["D3"] = Position(coordinate: Coordinate(row: 3, column: "D"))
            namesOfPositions["C4"] = Position(coordinate: Coordinate(row: 4, column: "C"))
            namesOfPositions["C5"] = Position(coordinate: Coordinate(row: 5, column: "C"))
            namesOfPositions["D5"] = Position(coordinate: Coordinate(row: 5, column: "D"))
            namesOfPositions["E4"] = Position(coordinate: Coordinate(row: 4, column: "E"))
            namesOfPositions["E5"] = Position(coordinate: Coordinate(row: 5, column: "E"))
     }

     func getPositions() -> [String: Position] {
         return namesOfPositions
     }
}
