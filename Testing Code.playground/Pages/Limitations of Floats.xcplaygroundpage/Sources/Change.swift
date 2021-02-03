/// Represents denominations of US currency, from ten dollars to one penny.
public enum Denomination: String, CustomStringConvertible {
    case oneHundred,fifty,ten, five, one, quarter, dime, nickel, penny
    
    /// The value of the denomination expressed in pennies.
    public var valueInPennies: Int {
        switch self {
        case .oneHundred: return 10000
        case .fifty: return 5000
        case .ten: return 1000
        case .five: return 500
        case .one: return 100
        case .quarter: return 25
        case .dime: return 10
        case .nickel: return 5
        case .penny: return 1
        }
    }
    
    public var description: String {
        return self.rawValue
    }
}
