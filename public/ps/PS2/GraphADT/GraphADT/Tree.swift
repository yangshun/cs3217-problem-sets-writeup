/*
    `Tree` represents a tree or an undirected connected graph
    without simple cycles. Like `Graph`, `Tree` is a generic 
    type with a type parameter `T` that defines the type of 
    the nodes' labels.

    Please state the representation invariants here and implement
    them accordingly.
        - ...
        - ...
*/


class Tree<T> : Graph<T> {
    
    //  Construct a directed or undirected graph.
    override init(isDirected: Bool) {
         super.init(isDirected: isDirected)
    }
}

//  This tree extension provides functions to convert a tree in a 
//  representative string.
//
//  Nodes' labels should be convertible to String and concatenated
//  into a final String. You can assume that label of type `T`
//  can be converted to a String via String interpolationn
//  e.g. "\(node.label)"
extension Tree {
    
    //  Return a string that represents the tree when it is traversed
    //  in breadth-first order.
    func breadthFirstToString() -> String {

        return "" // Please remove this line in actual implementation
    }
    
    //  Return a string that represents the tree when it is traversed
    //  in depth-first order.
    func depthFistToString() -> String {
        
        return "" // Please remove this line in actual implementation
    }
}
