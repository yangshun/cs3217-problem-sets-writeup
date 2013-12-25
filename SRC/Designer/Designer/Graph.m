//
//  Graph.m
//  PS2
//
//  Created by Ishaan Singal on 13/12/13.
//  Copyright (c) 2013 ishaan.practise. All rights reserved.
//

#import "Graph.h"

@interface Graph ()
@property (readwrite) NSMutableDictionary *mutableGraph;
@property (readwrite) BOOL isDirected;
@end

@implementation Graph

- (id)init {
    self = [super init];
    if (self) {
        _mutableGraph = [[NSMutableDictionary alloc]init];
    }
    return self;
}

- (id)initWithNumberOfVertices:(int)v isDirected:(bool)directed {
    self = [super init];
    if (self) {
        _mutableGraph = [[NSMutableDictionary alloc]initWithCapacity:v];
        _isDirected = directed;
    }
    return self;
}

- (NSDictionary*)tree {
    return [self.mutableGraph copy];
}

- (void)insertEdgeWithSource:(id)source andDestination:(id)dest {
    if (![self containsEdgeWithSource:source andDestination:dest]) {
        [self insertEdge:[Edge edgeWithSource:source andDestination:dest]];
    }
}

- (void)insertEdge:(Edge*)edge {
    NSValue *sourceKey = [NSNumber valueWithNonretainedObject:edge.source];
    NSMutableSet *edgesForSource = [self.mutableGraph objectForKey:sourceKey];
    if (edgesForSource == nil) {
        edgesForSource = [[NSMutableSet alloc]init];
    }
    [edgesForSource addObject:edge];
    [self.mutableGraph setObject:edgesForSource forKey:sourceKey];

    if (!self.isDirected) {
        NSValue *destinationKey = [NSNumber valueWithNonretainedObject:edge.destination];
        NSMutableSet *edgesForDestination = [self.mutableGraph objectForKey:destinationKey];
        if (edgesForDestination == nil) {
            edgesForDestination = [[NSMutableSet alloc]init];
        }
        [edgesForDestination addObject:[Edge edgeWithSource:edge.destination andDestination:edge.source]];
        [self.mutableGraph setObject:edgesForDestination forKey:destinationKey];
    }
    
}

- (BOOL)removeEdge:(Edge*)edge {
    BOOL flag = NO;
    NSValue *sourceKey = [NSNumber valueWithNonretainedObject:edge.source];
    NSSet* edgesForSource = [self.mutableGraph objectForKey:sourceKey];
    if (edgesForSource != nil && [edgesForSource containsObject:edge]) {
        [((NSMutableSet*)edgesForSource) removeObject:edge];
        flag = YES;
    }
    
    if (!self.isDirected) {
        NSValue *destinationKey = [NSNumber valueWithNonretainedObject:edge.destination];
        NSSet* edgesForDestination = [self.mutableGraph objectForKey:destinationKey];
        Edge* destinationEdge = [[Edge alloc] initWithSource:edge.destination andDestination:edge.source andWeight:edge.weight];
        if (edgesForDestination != nil && [edgesForDestination containsObject:destinationEdge]) {
            [((NSMutableSet*)edgesForDestination) removeObject:destinationEdge];
        }
    }
    return flag;
}

- (NSSet*)getEdgesFromNode:(id)node {
    return [self.mutableGraph objectForKey:[NSNumber valueWithNonretainedObject:node]];
}

- (NSSet*)getNeighboursOfNode:(id)node {
    NSMutableSet *neighbours = [[NSMutableSet alloc]init];
    for (Edge *edge in [self.mutableGraph objectForKey:[NSNumber valueWithNonretainedObject:node]]) {
        [neighbours addObject:edge.destination];
    }
    if ([neighbours count] == 0) {
        return nil;
    }
    return [neighbours copy];
}


- (BOOL)containsEdge:(Edge*)edge {
    bool flag = NO;
    NSSet *edges = [self.mutableGraph objectForKey:[NSNumber valueWithNonretainedObject:edge.source]];
    if (edges != nil && [edges containsObject:edge]) {
        flag = YES;
    }
    return flag;
}

- (BOOL)containsEdgeWithSource:(id)source andDestination:(id) destination {
    bool flag = NO;
    NSSet *edges = [self.mutableGraph objectForKey:[NSNumber valueWithNonretainedObject:source]];
    if (edges != nil && [edges containsObject:[Edge edgeWithSource:source andDestination:destination]]) {
        flag = YES;
    }
    return flag;
}

- (Edge*)getEdgeForSource:(id)source andDestination:(id) destination {
    Edge *edge = [[Edge alloc]initWithSource:source andDestination:destination];
    NSSet *edges = [self.mutableGraph objectForKey:source];
    if ([edges containsObject:edge]) {
        return [edges member:edge];
    }
    return edge;
}

- (NSSet*)getAllNodes {
    return [NSSet setWithArray:[self.mutableGraph allKeys]];
}

- (NSArray*)getShortestPathFromNode:(id)start toNode:(id)destination {
    NSMutableArray *path = [[NSMutableArray alloc]initWithObjects:destination, nil];
    NSMutableArray *queue = [[NSMutableArray alloc]initWithObjects:start, nil];
    [queue addObject:start];
    
    NSMutableDictionary *parent = [[NSMutableDictionary alloc]init];
    NSMutableDictionary *distance = [[NSMutableDictionary alloc]init];
    
    [distance setObject:[NSNumber numberWithInt:0] forKey:start];
    
    while ([queue count] != 0) {
        id thisNode = [queue firstObject];
        [queue removeObject:thisNode];
        for (id neighbour in [self getNeighboursOfNode:thisNode]) {
            if ([distance objectForKey:neighbour] == nil) {
                [parent setObject:thisNode forKey:neighbour];
                int distanceToNeighbour = [[distance objectForKey:thisNode]intValue] + 1;
                [distance setObject:[NSNumber numberWithInt:distanceToNeighbour] forKey:neighbour];
                [queue addObject:neighbour];
            }
        }
    }
    
    id parentNode = [parent objectForKey:destination];
    while (![parentNode isEqual:start]) {
        [path addObject:parentNode];
        parentNode = [parent objectForKey:parentNode];
    }
    [path addObject:start];
    return [path copy];
}


- (void)encodeWithCoder:(NSCoder *)encoder {
//    [encoder encodeObject:self.mutableGraph.all forKey:@"Nodes"];
//    [encoder encodeObject:self.source forKey:@"NodeSource"];
//    [encoder encodeObject:self.source forKey:@"NodeSource"];
}


@end
