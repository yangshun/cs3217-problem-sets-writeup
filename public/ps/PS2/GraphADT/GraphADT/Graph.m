#import "Graph.h"

@implementation Graph

@synthesize isDirected;

// Checks that the representation invariant holds.
-(void)checkRep{
    // 5 points

}

- (id)initWithIsDirected:(BOOL)d {
    // MODIFIES: self
    // EFFECTS: returns a new Graph object g with g.isDirected = d
    // 5 points
    
    return nil; //Remove this line in actual implementation
}

- (void)addNode:(Node*)n {
    // REQUIRES: self != nil and n != nil
    // MODIFIES: self
    // EFFECTS: adds the node n to self
    // 5 points

    return; //Remove this line in actual implementation
}

- (void)removeNode:(Node*)n {
    // REQUIRES: self != nil and n != nil
    // MODIFIES: self
    // EFFECTS: removes the node n and all respective edges from self
    // 5 points

    return; //Remove this line in actual implementation
}

- (BOOL)containsNode:(Node*)n {
    // REQUIRES: self != nil and n != nil
    // EFFECTS: returns true if the node n is present in self
    // 5 points

    return nil; //Remove this line in actual implementation
}

- (void)addEdge:(Edge*)e {
    // REQUIRES: self != nil and e != nil
    // MODIFIES: self
    // EFFECTS: adds the edge e to self
    // 5 points

    return; //Remove this line in actual implementation
}

- (void)removeEdge:(Edge*)e {
    // REQUIRES: self != nil and e != nil
    // MODIFIES: self
    // EFFECTS: removes the edge e from self
    // 5 points

    return; //Remove this line in actual implementation
}

- (BOOL)containsEdge:(Edge*)e {
    // REQUIRES: self != nil and e != nil
    // EFFECTS: returns true if the edge e is present in self
    // 5 points

    return nil; //Remove this line in actual implementation
}

- (NSArray*)getEdgesFromNode:(Node*)sn toNode:(Node*)en {
    // REQUIRES: self != nil, sn != nil and en != nil
    // EFFECTS: returns the edges between sn and en if present,
    //          else, returns nil
    // 5 points

    return nil; //Remove this line in actual implementation
}

- (NSArray*)getAdjacentNodesForNode:(Node*)n {
    // REQUIRES: self != nil and n != nil
    // EFFECTS: returns all the nodes adjacent to n in self
    // 5 points

    return nil; //Remove this line in actual implementation
}

- (NSArray*)getAllNodes {
    // REQUIRES: self != nil
    // EFFECTS: returns all the nodes in self
    // 5 points

    return nil; //Remove this line in actual implementation
}

- (NSArray*)getAllEdges {
    // REQUIRES: self != nil
    // EFFECTS: returns all edges in self
    // 5 points

    return nil; //Remove this line in actual implementation
}

- (NSArray*)getShortestPathFromNode:(Node*)sn toNode:(Node*)en {
    // REQUIRES: self != nil, sn != nil and en != nil
    // EFFECTS: returns the shortest path from sn to en in self
    // 20 points

    return nil; //Remove this line in actual implementation
}

@end

