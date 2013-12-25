/*
 This class represents a weighted graph structure. The graph
 may be directed or undirected. In this assignment, you are
 required to implement the methods given in this specification.
*/

#import <Foundation/Foundation.h>
#import "Edge.h"

@interface Graph : NSObject {
    BOOL isDirected;
    
    // Representation invariant for every Graph g:
	// 1. g should be directed or undirected,
    // 2. all nodes in g should have a unique label,
    // 3. multiple edges with the same source and destination
    //            should not have the same weight
    //
	// (A representation invariant tells us something that is true for all
	// instances of a Graph)
}

//readonly properties only have getters, not setters
@property (readonly) BOOL isDirected;

- (id)initWithIsDirected:(BOOL)d;
// MODIFIES: self
// EFFECTS: returns a new Graph object g with g.isDirected = d

- (void)addNode:(Node*)n;
// REQUIRES: self != nil and n != nil
// MODIFIES: self
// EFFECTS: adds the node n to self

- (void)removeNode:(Node*)n;
// REQUIRES: self != nil and n != nil
// MODIFIES: self
// EFFECTS: removes the node n and all respective edges from self

- (BOOL)containsNode:(Node*)n;
// REQUIRES: self != nil and n != nil
// EFFECTS: returns true if the node n is present in self

- (void)addEdge:(Edge*)e;
// REQUIRES: self != nil and e != nil
// MODIFIES: self
// EFFECTS: adds the edge e to self. If e.source or e.destination is
//          not present in self, add the respective node to self

- (void)removeEdge:(Edge*)e;
// REQUIRES: self != nil and e != nil
// MODIFIES: self
// EFFECTS: removes the edge e from self

- (BOOL)containsEdge:(Edge*)e;
// REQUIRES: self != nil and e != nil
// EFFECTS: returns true if the edge e is present in self

- (NSArray*)getEdgesFromNode:(Node*)sn toNode:(Node*)en;
// REQUIRES: self != nil, sn != nil and en != nil
// EFFECTS: returns the edges between sn and en if present,
//          else, returns nil

- (NSArray*)getAdjacentNodesForNode:(Node*)n;
// REQUIRES: self != nil and n != nil
// EFFECTS: returns all the nodes adjacent to n in self

- (NSArray*)getAllNodes;
// REQUIRES: self != nil
// EFFECTS: returns all the nodes in self

- (NSArray*)getAllEdges;
// REQUIRES: self != nil
// EFFECTS: returns all edges in self

- (NSArray*)getShortestPathFromNode:(Node*)sn toNode:(Node*)en;
// REQUIRES: self != nil, sn != nil and en != nil
// EFFECTS: returns the shortest path from sn to en in self

@end
