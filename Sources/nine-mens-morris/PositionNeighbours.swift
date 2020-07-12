struct PositionNeighbours {
    private var neighbours: [Position: [Position]]
    
    /// Initialize dictionary with the neighours for each game position
    init() {
        let positions = ValidPositions()
        let namesOfPositions = positions.getPositions()
        neighbours = [Position: [Position]]()
        neighbours[namesOfPositions["A1"]!] = [namesOfPositions["A4"]!, namesOfPositions["D1"]!]
        neighbours[namesOfPositions["A4"]!] = [namesOfPositions["A1"]!, namesOfPositions["A7"]!, namesOfPositions["B4"]!]
        neighbours[namesOfPositions["A7"]!] = [namesOfPositions["A4"]!, namesOfPositions["D7"]!]
        neighbours[namesOfPositions["D1"]!] = [namesOfPositions["A1"]!, namesOfPositions["D2"]!, namesOfPositions["G1"]!]
        neighbours[namesOfPositions["G1"]!] = [namesOfPositions["D1"]!, namesOfPositions["G4"]!]
        neighbours[namesOfPositions["D7"]!] = [namesOfPositions["A7"]!, namesOfPositions["D7"]!, namesOfPositions["D6"]!]
        neighbours[namesOfPositions["G7"]!] = [namesOfPositions["G4"]!, namesOfPositions["D7"]!]
        neighbours[namesOfPositions["G4"]!] = [namesOfPositions["G1"]!, namesOfPositions["G7"]!, namesOfPositions["F4"]!]
        neighbours[namesOfPositions["B2"]!] = [namesOfPositions["B4"]!, namesOfPositions["D2"]!]
        neighbours[namesOfPositions["B4"]!] = [namesOfPositions["A4"]!, namesOfPositions["C4"]!, namesOfPositions["B2"]!, namesOfPositions["B6"]!]
        neighbours[namesOfPositions["B6"]!] = [namesOfPositions["B4"]!, namesOfPositions["D6"]!]
        neighbours[namesOfPositions["D2"]!] = [namesOfPositions["D1"]!, namesOfPositions["D3"]!, namesOfPositions["B2"]!, namesOfPositions["F2"]!]
        neighbours[namesOfPositions["F2"]!] = [namesOfPositions["D2"]!, namesOfPositions["F4"]!]
        neighbours[namesOfPositions["D6"]!] = [namesOfPositions["D5"]!, namesOfPositions["D7"]!, namesOfPositions["B6"]!, namesOfPositions["F6"]!]
        neighbours[namesOfPositions["F6"]!] = [namesOfPositions["D6"]!, namesOfPositions["F4"]!]
        neighbours[namesOfPositions["F4"]!] = [namesOfPositions["E4"]!, namesOfPositions["G4"]!, namesOfPositions["F2"]!, namesOfPositions["F6"]!]
        neighbours[namesOfPositions["C3"]!] = [namesOfPositions["D3"]!, namesOfPositions["C4"]!]
        neighbours[namesOfPositions["E3"]!] = [namesOfPositions["D3"]!, namesOfPositions["E4"]!]
        neighbours[namesOfPositions["D3"]!] = [namesOfPositions["C3"]!, namesOfPositions["E3"]!, namesOfPositions["D2"]!]
        neighbours[namesOfPositions["C4"]!] = [namesOfPositions["C3"]!, namesOfPositions["C5"]!, namesOfPositions["B4"]!]
        neighbours[namesOfPositions["C5"]!] = [namesOfPositions["C4"]!, namesOfPositions["D5"]!]
        neighbours[namesOfPositions["D5"]!] = [namesOfPositions["C5"]!, namesOfPositions["E5"]!, namesOfPositions["D6"]!]
        neighbours[namesOfPositions["E4"]!] = [namesOfPositions["E3"]!, namesOfPositions["E5"]!, namesOfPositions["F4"]!]
        neighbours[namesOfPositions["E5"]!] = [namesOfPositions["D5"]!, namesOfPositions["E4"]!]
    }
    
    /// Returns the game positions and their neighbours
    /// - Returns: neighbours
    func getNeighbours() ->  [Position: [Position]] {
        return neighbours
    }
}

