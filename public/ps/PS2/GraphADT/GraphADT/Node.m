#import "Node.h"

@interface Node ()

/*
 Re-declare property to be read-write in the implementation file.
 This allows only the methods of this class to change the value
 of this property
*/
@property (readwrite) id label;

@end

@implementation Node

@synthesize label;

// Checks that the representation invariant holds.
-(void)checkRep{
    
	if (self.label == nil){
		[NSException raise:@"Node rep error"
                    format:@"Label of a Node cannot be nil"];
	}
}

-(id) initWithLabel:(id)l {
    // MODIFIES: self
    // EFFECTS: Initializes a new Node object with the value of l.
    
    self = [super init];
    if (self) {
        label = l;
    }
    [self checkRep];
    return self;
}

+(id) nodeWithLabel:(id)l {
    // EFFECTS: Factory method that creates a new Node object with
    //          the value of l.
    
    return [[Node alloc] initWithLabel:l];
}

-(BOOL) isEqual:(id)object {
    // REQUIRES: self != nil, object != nil
    // EFFECTS: override NSObject's isEqual method.
    //          returns YES if object represents the same node as self
    
    if([object isKindOfClass:[Node class]]){
    // isKindOfClass returns true if object can be considered as an
    // instance of the argument class. Each class has a method
    // called "class", which returns the class object. so [Node
    // class] returns the class object of Node class
        Node *n = (Node*)object;
        return [self.label isEqual:n.label];
    }
    else {
        return NO;
    }
}

-(NSUInteger) hash {
    // REQUIRES: self != nil
    // This is a private method that overrides the hash method of NSObject
    return [self.label hash];
}

- (id)copyWithZone:(NSZone *)zone {
    // REQUIRES: self != nil
    // This method is used to implement the NSCopying protocol, and returns
    // a copy of self. By implementing this protocol, Node objects can be
    // used for a variety of purposes, e.g. as keys in a NSDictionary.
    
    id copy = [[[self class] alloc] init];
    if (copy) {
        [copy setLabel:[self.label copyWithZone:zone]];
    }
    [copy checkRep];
    return copy;
}

@end