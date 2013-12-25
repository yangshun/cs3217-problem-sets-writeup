//
//  Graph.h
//  PS2
//
//  Created by Ishaan Singal on 13/12/13.
//  Copyright (c) 2013 ishaan.practise. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Edge.h"

@interface Graph : NSObject
@property (readonly) NSDictionary *tree;
@property (readonly) BOOL isDirected;

- (id)initWithNumberOfVertices:(int)v isDirected:(bool)directed;
- (void)insertEdgeWithSource:(id)source andDestination:(id)dest;
- (void)insertEdge:(Edge*)edge;
- (BOOL)removeEdge:(Edge*)edge;

- (NSSet*)getEdgesFromNode:(id)node;
- (NSSet*)getNeighboursOfNode:(id)node;

- (BOOL)containsEdge:(Edge*)edge;
- (BOOL)containsEdgeWithSource:(id)source andDestination:(id) destination;
- (Edge*)getEdgeForSource:(id)source andDestination:(id) destination;
- (NSSet*)getAllNodes;

- (NSArray*)getShortestPathFromNode:(id)start toNode:(id)destination;

@end
