/*
    `Edge` represents an edge in a graph. An `Edge` is associated with
    a source Node, a destination Node and a non-negative cost (or weight). 
    This means that `Edge` is a directed edge from the source to 
    the destination.

    The representation invariants:
        - The cose is non-negative

    Similar to `Node`, `Edge` is a generic type with a type parameter
    `T` that is the type of a node's label.
*/


struct Edge<T> {
    typealias N = Node<T>
    
    var source: N
    var destination: N
    var weight = 1.0
    
    //  Construct an edge from `source` to `destination` with the
    //  default cost of 1.0.
    init(source: N, destination: N) {
        self.source = source
        self.destination = destination
        _checkRep()
    }
    
    //  Construct an edge from `source` to `destination` with the
    //  cost of `weight`.
    init(source: N, destination: N, weight: Double) {
        self.source = source
        self.destination = destination
        self.weight = weight
        _checkRep()
    }
    
    //  Return an edge in the opposite direction with the same cost.
    func reverse() -> Edge<T> {
        return Edge(source: destination, destination: source, weight: weight)
    }
    
    //  Check the representation invariants.
    private func _checkRep() {
        assert(weight >= 0)
    }
}

//  Return true if `lhs` edge is equal to `rhs` edge.
func ==<Label>(lhs: Edge<Label>, rhs: Edge<Label>) -> Bool {
    return lhs.source == rhs.source && lhs.destination == rhs.destination
}

extension Edge : Hashable {
    
    //  Return a hash value for the edge.
    var hashValue: Int {
        return "\(source)\(destination)\(weight)".hashValue
    }
}

extension Edge : Printable {
    
    //  Return a textual representation for the edge.
    var description: String {
        return "Edge from \(source.description) to \(destination.description)"
    }
}
