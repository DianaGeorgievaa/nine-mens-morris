enum TokenColor: String, CustomStringConvertible {
    case white = "○"
    case black = "●"
    case empty = "x"
    
    var description: String {
        get {
            return self.rawValue
        }
    }
}