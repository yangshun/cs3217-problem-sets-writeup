/*
    `Graph` represents a graph (unsurprisingly!) More specifically, `Graph` 
    should be able to represent the following graph types with corresponding
    constraints:
        - Undirected graph
            + An undirected edge is represented by 2 directed edges
        - Directed graph
        - Simple graph
        - Multigraph
            + Edges from the same source to the same destination should have
            different cost
        - Unweighted graph
            + Edges' weights are to set to 1.0
        - Weighted graph

    Hence, the representation invariants for every Graph g:
        - g is either directed or undirected
        - All nodes in g must have unique labels
        - Multiple edges from the same source to the same destination must
        not have the same weight

    Finally, just like `Node` and `Edge`, `Graph` is a generic type with a type
    parameter `T` that defines the type of the nodes' labels.
*/


class Graph<T: Equatable> {
    typealias N = Node<T>
    typealias E = Edge<T>
    
    let isDirected: Bool
    
    //  5 points
    //  Construct a direct or undirected graph.
    init(isDirected: Bool) {
        
        self.isDirected = false // Please remove this line in actual implementation.
    }
    
    //  5 points
    //  Add `addedNode` to the graph. If `addedNode` already exists
    //  in the graph, do nothing.
    func addNode(addedNode: N) {

    }
    
    //  5 points
    //  Remove `removedNode` from the graph. If `removedNode` does
    //  not exist in the graph, do nothing.
    func removeNode(removedNode: N) {

    }
    
    //  5 points
    //  Return true if `targetNode` exists in the graph.
    func containsNode(targetNode: N) -> Bool {
        
        return false // Please remove this line in actual implementation.
    }
    
    //  5 points
    //  Add `addedEdge` to the graph. If `addedEdge` already exists,
    //  do nothing. If any of the nodes referenced in `eddedEdge` does
    //  not exist, add it to the graph.
    func addEdge(addedEdge: E) {
    
    }
    
    //  5 points
    //  Remove `removedEdge` from the graph. If `removedEdge` does not
    //  exist, do nothing.
    func removeEdge(removedEdge: E) {

    }
    
    //  5 points
    //  Return true if `targetEdge` exists in the graph.
    func containsEdge(targetEdge: E) -> Bool {
        
        return false // Please remove this line in actual implementation.
    }
    
    //  5 points
    //  Return edges directed from `fromNode` to `toNode`.
    func edgesFromNode(fromNode: N, toNode: N) -> [E] {
        
        return [E]() // Please remove this line in actual implementation.
    }
    
    //  5 points
    //  Return adjacent nodes of the `fromNode` i.e. there
    //  is an directed edge from `fromNode` to its adjacent node.
    func adjacentNodesFromNode(fromNode: N) -> [N] {
        
        return [N]() // Please remove this line in actual implementation.
    }
    
    //  5 points
    //  A read-only computed property that contains all the nodes 
    //  of the graphs.
    var nodes: [N] {
        
        return [N]() // Please remove this line in actual implementation.
    }
    
    //  5 points
    //  A read-only computed property that contains all the edges 
    //  of the graphs.
    var edges: [E] {
        
        return [E]() // Please remove this line in actual implementation.
    }
    
    //  5 points
    //  Check the representation invariants.
    private func _checkRep() {
        
    }
    
    //  20 points
    //  Return the shortest path from `fromNode` to `toNode`
    //  assuming that the graph is not a multigraph.
    func shortestPathFromNode(fromNode: N, toNode: N) -> [E] {
        
        return [E]() // Please remove this line in actual implementation.
    }
}
