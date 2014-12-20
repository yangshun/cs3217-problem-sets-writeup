/*
    `Node` represents a vertex in a graph. `Node` is a generic type
    with a type parameter `T` that is the type of the node's label.
    For example, `Node<String>` is the type of nodes with a String label
    and `Node<Int>` is the type of nodes with a Int Label.

    Because labels can be the same, nodes are uniquely identified
    by their `id`.
*/


struct Node<T> {
    var id: Int
    var label: T
}

//  Return true if `lhs` node is equal to `rhs` node.
func ==<T>(lhs: Node<T>, rhs: Node<T>) -> Bool {
    return lhs.id == rhs.id
}

extension Node : Hashable {
    
    //  Return hash value of the node.
    var hashValue: Int {
        return id.hashValue
    }
}

extension Node : Printable {
    
    //  Return a textual representation of the node.
    var description: String {
        return "Node: (\(id), \(label))"
    }
}
