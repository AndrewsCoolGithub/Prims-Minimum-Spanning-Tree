import Foundation

public struct ComparableTuple: Comparable{
    public static func < (lhs: ComparableTuple, rhs: ComparableTuple) -> Bool {
        lhs.cost < rhs.cost
    }
    
    public init(_ cost: Int, _ pointsIndex: Int){
        self.cost = cost
        self.pointsIndex = pointsIndex
    }
    
    public let cost: Int
    public let pointsIndex: Int
    
}
