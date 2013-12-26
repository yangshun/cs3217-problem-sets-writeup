/*
 Edge represents an individual edge in a graph structure. Each edge
 is associated with a source and a destination Node. An edge can also 
 have a non-negative weight. Like Node, the Edge object is also immutable.
*/

#import <Foundation/Foundation.h>
#import "Node.h"

@interface Edge : NSObject {
    Node *source;
    Node *destination;
    NSNumber *weight;
    
    // Representation invariant for every Edge e:
	// e.source is a valid Node object,
    // e.destination is a valid Node object, and
    // e.weight >= 0
	// (A representation invariant tells us something that is true for all
	// instances of an Edge)
}

//readonly properties only have getters, not setters
@property (readonly) Node *source;
@property (readonly) Node *destination;
@property (readonly) NSNumber *weight;

-(id)initWithSource:(Node*)s andDestination:(Node*)d andWeight:(NSNumber*)w;
// MODIFIES: self
// EFFECTS: returns a new Edge object e with e.source = s,
//          e.destination = d and e.weight = w

-(id)initWithSource:(Node *)s andDestination:(Node *)d;
// MODIFIES: self
// EFFECTS: returns a new Edge object e with e.source = s,
//          e.destination = d and e.weight = 1

+(id)edgeWithSource:(Node*)s andDestination:(Node*)d andWeight:(NSNumber*)w;
// EFFECTS: Factory method that creates a new Edge object e with
//          e.source = s, e.destination = d and e.weight = w

+(id)edgeWithSource:(Node *)s andDestination:(Node *)d;
// EFFECTS: Factory method that creates a new Edge object e with
//          e.source = s, e.destination = d and e.weight = 1

-(BOOL)isEqual:(id)object;
// REQUIRES: self != nil, object != nil
// EFFECTS: override NSObject's isEqual method.
//          returns YES if object represents the same edge as self

@end
