#import "Edge.h"

@implementation Edge

@synthesize source;
@synthesize destination;
@synthesize weight;

// Checks that the representation invariant holds.
-(void)checkRep{
    
	if (self.source == nil ){
		[NSException raise:@"Edge rep error" format:
		 @"Source of an Edge must be a valid Node object"];
	}
    
    if (self.destination == nil ){
		[NSException raise:@"Edge rep error" format:
		 @"Source of an Edge must be a valid Node object"];
	}
    
    if (self.weight == nil || ([self.weight compare:[NSNumber numberWithInt:0]] == NSOrderedAscending)){
		[NSException raise:@"Edge rep error" format:
		 @"Weight of an Edge must be a valid NSNumber greater than 0"];
	}
}

-(id)initWithSource:(Node*)s andDestination:(Node*)d andWeight:(NSNumber*)w {
    // MODIFIES: self
    // EFFECTS: returns a new Edge object e with e.source = s,
    //          e.destination = d and e.weight = w
    
    self = [super init];
    if (self) {
        source = s;
        destination = d;
        weight = w;
    }
    [self checkRep];
    return self;
}

-(id)initWithSource:(Node *)s andDestination:(Node *)d {
    // MODIFIES: self
    // EFFECTS: returns a new Edge object e with e.source = s,
    //          e.destination = d and e.weight = 1
    
    return [self initWithSource:s andDestination:d andWeight:[NSNumber numberWithInt:1]];
}

+(id)edgeWithSource:(Node*)s andDestination:(Node*)d andWeight:(NSNumber*)w {
    // EFFECTS: Factory method that creates a new Edge object e with
    //          e.source = s, e.destination = d and e.weight = w
    
    return [[Edge alloc] initWithSource:s andDestination:d andWeight:w];
}

+(id)edgeWithSource:(Node *)s andDestination:(Node *)d {
    // EFFECTS: Factory method that creates a new Edge object e with
    //          e.source = s, e.destination = d and e.weight = 1
    
    return [Edge edgeWithSource:s andDestination:d andWeight:[NSNumber numberWithInt:1]];
}

-(BOOL)isEqual:(id)object {
    // REQUIRES: self != nil, object != nil
    // EFFECTS: override NSObject's isEqual method.
    //          returns YES if object represents the same edge as self
    
    if([object isKindOfClass:[Edge class]]){
        // isKindOfClass returns true if object can be considered as an
        // instance of the argument class. Each class has a method
        // called "class", which returns the class object. so [Edge
        // class] returns the class object of Edge class
        
        Edge *e = (Edge*)object;
        return ([self.source isEqual:e.source] && [self.destination isEqual:e.destination] && [self.weight isEqualToNumber:e.weight]);
    }
    else {
        return NO;
    }
}

-(NSUInteger) hash {
    // REQUIRES: self != nil
    //  This is a private method that overrides the hash method of NSObject
    return [self.source hash];
}

@end
