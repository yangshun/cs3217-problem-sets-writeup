/*
 Node represents an immutable vertex in a graph structure. Each node 
 is identified by its label. In this version, the label is
 defined as type 'id'. This allows us to create a generic implementation
 of a graph, wherein the node label can be a NSString object, NSNumber
 object, or even a custom-defined object.
 
 An immutable class is simply a class whose instances cannot be
 modified. All of the information contained in each instance is
 provided when it is created and is fixed for the lifetime of the
 object. In Objective-C, we can make a class immutable by providing
 only readonly accessors. Also, there is no analogue for the
 "final" keyword in java.
 */

#import <Foundation/Foundation.h>

@interface Node : NSObject <NSCopying> {
    id label;
    
    // Representation invariant for every Node n:
	// n.label != nil
	// (A representation invariant tells us something that is true for all
	// instances of a Node)
}

//readonly properties only have getters, not setters
@property (readonly) id label;

-(id) initWithLabel:(id)l;
// MODIFIES: self
// EFFECTS: Initializes a new Node object with the value of l.

+(id) nodeWithLabel:(id)l;
// EFFECTS: Factory method that creates a new Node object with
//          the value of l.

-(BOOL) isEqual:(id)object;
// REQUIRES: self != nil, object != nil
// EFFECTS: override NSObject's isEqual method.
//          returns YES if object represents the same node as self

@end