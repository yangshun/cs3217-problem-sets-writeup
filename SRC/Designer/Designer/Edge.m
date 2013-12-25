//
//  Edge.m
//  PS2
//
//  Created by Ishaan Singal on 13/12/13.
//  Copyright (c) 2013 ishaan.practise. All rights reserved.
//

#import "Edge.h"

@interface Edge ()
@property (readwrite) id  source;
@property (readwrite) id destination;
@property (readwrite) int weight;
@end

@implementation Edge

- (id)initWithSource:(id)source andDestination:(id)destination {
    return [[Edge alloc]initWithSource:source andDestination:destination andWeight:1];
}

- (id)initWithSource:(id)source andDestination:(id)destination andWeight:(int)weight {
    self = [super init];
    if (self) {
        _source = source;
        _destination = destination;
        _weight = weight;
    }
    return self;
}

+ (id)edgeWithSource:(id)source andDestination:(id)destination {
    return [[Edge alloc]initWithSource:source andDestination:destination];
}

- (BOOL)isEqual:(id)object {
    return (self.source == ((Edge*)object).source && self.destination == ((Edge*)object).destination && self.weight == ((Edge*)object).weight);
}

- (NSUInteger)hash {
    NSUInteger prime = 31;
    NSUInteger result = 1;
    result = prime * result + [self.source hash];
    result = prime * result + [self.destination hash];
    return result;
}

//check whether two nodes are equal
- (BOOL)isEquivalentToEdge:(Edge*)edge {
    return [self isEqual:edge];
//    return (self.source == edge.source && self.destination == edge.destination && self.weight == edge.weight);
}

- (void)encodeWithCoder:(NSCoder *)encoder {
        [encoder encodeObject:self.source forKey:@"NodeSource"];
        [encoder encodeObject:self.destination forKey:@"NodeDestination"];
}


@end
