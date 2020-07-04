struct NineMensMorrisCombinations {
   var combinations: [Position: [[Position]]]

   init() {
     let positions = Positions()
     let namesOfPositions = positions.getPositions()
     combinations = [Position: [[Position]]]()
            combinations[namesOfPositions["A1"]!] = [[namesOfPositions["D1"]!, namesOfPositions["G1"]!], [namesOfPositions["A4"]!, namesOfPositions["A7"]!]]
            combinations[namesOfPositions["A4"]!] = [[namesOfPositions["A1"]!, namesOfPositions["A7"]!], [namesOfPositions["B4"]!, namesOfPositions["C4"]!]]
            combinations[namesOfPositions["A7"]!] = [[namesOfPositions["A1"]!, namesOfPositions["A4"]!], [namesOfPositions["D7"]!, namesOfPositions["G7"]!]]
            combinations[namesOfPositions["D1"]!] = [[namesOfPositions["A1"]!, namesOfPositions["G1"]!], [namesOfPositions["D2"]!, namesOfPositions["D3"]!]]
            combinations[namesOfPositions["G1"]!] = [[namesOfPositions["A1"]!, namesOfPositions["D1"]!], [namesOfPositions["G4"]!, namesOfPositions["G7"]!]]
            combinations[namesOfPositions["D7"]!] = [[namesOfPositions["A7"]!, namesOfPositions["G7"]!], [namesOfPositions["D6"]!, namesOfPositions["D5"]!]]
            combinations[namesOfPositions["G7"]!] = [[namesOfPositions["D7"]!, namesOfPositions["A7"]!], [namesOfPositions["G4"]!, namesOfPositions["G1"]!]]
            combinations[namesOfPositions["G4"]!] = [[namesOfPositions["G1"]!, namesOfPositions["G7"]!], [namesOfPositions["F4"]!, namesOfPositions["E4"]!]]
            combinations[namesOfPositions["B2"]!] = [[namesOfPositions["D2"]!, namesOfPositions["F2"]!], [namesOfPositions["B4"]!, namesOfPositions["B6"]!]]
            combinations[namesOfPositions["B4"]!] = [[namesOfPositions["B2"]!, namesOfPositions["B6"]!], [namesOfPositions["A4"]!, namesOfPositions["C4"]!]]
            combinations[namesOfPositions["B6"]!] = [[namesOfPositions["B2"]!, namesOfPositions["B4"]!], [namesOfPositions["D6"]!, namesOfPositions["F6"]!]]
            combinations[namesOfPositions["D2"]!] = [[namesOfPositions["D1"]!, namesOfPositions["D3"]!], [namesOfPositions["B2"]!, namesOfPositions["F2"]!]]
            combinations[namesOfPositions["F2"]!] = [[namesOfPositions["B2"]!, namesOfPositions["D2"]!], [namesOfPositions["F4"]!, namesOfPositions["F6"]!]]
            combinations[namesOfPositions["D6"]!] = [[namesOfPositions["D5"]!, namesOfPositions["D7"]!], [namesOfPositions["B6"]!, namesOfPositions["F6"]!]]
            combinations[namesOfPositions["F6"]!] = [[namesOfPositions["D6"]!, namesOfPositions["B6"]!], [namesOfPositions["F4"]!, namesOfPositions["F2"]!]]
            combinations[namesOfPositions["F4"]!] = [[namesOfPositions["F2"]!, namesOfPositions["F6"]!], [namesOfPositions["E4"]!, namesOfPositions["G4"]!]]
            combinations[namesOfPositions["C3"]!] = [[namesOfPositions["C4"]!, namesOfPositions["C5"]!], [namesOfPositions["D3"]!, namesOfPositions["E3"]!]]
            combinations[namesOfPositions["E3"]!] = [[namesOfPositions["D5"]!, namesOfPositions["C5"]!], [namesOfPositions["D3"]!, namesOfPositions["C3"]!]]
            combinations[namesOfPositions["D3"]!] = [[namesOfPositions["D2"]!, namesOfPositions["D1"]!], [namesOfPositions["E3"]!, namesOfPositions["C3"]!]]
            combinations[namesOfPositions["C4"]!] = [[namesOfPositions["C3"]!, namesOfPositions["C5"]!], [namesOfPositions["B4"]!, namesOfPositions["A4"]!]]
            combinations[namesOfPositions["C5"]!] = [[namesOfPositions["C4"]!, namesOfPositions["C3"]!], [namesOfPositions["D5"]!, namesOfPositions["E5"]!]]
            combinations[namesOfPositions["D5"]!] = [[namesOfPositions["C5"]!, namesOfPositions["E5"]!], [namesOfPositions["D6"]!, namesOfPositions["D7"]!]]
            combinations[namesOfPositions["E4"]!] = [[namesOfPositions["F4"]!, namesOfPositions["G4"]!], [namesOfPositions["E3"]!, namesOfPositions["E5"]!]]
            combinations[namesOfPositions["E5"]!] = [[namesOfPositions["D5"]!, namesOfPositions["C5"]!], [namesOfPositions["E3"]!, namesOfPositions["E4"]!]]
    }

    func getCombinations() ->  [Position: [[Position]]] {
      return combinations
    }
}
