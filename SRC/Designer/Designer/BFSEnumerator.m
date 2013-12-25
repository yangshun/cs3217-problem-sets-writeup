//
//  BFSEnumerator.m
//  PS1
//
//  Created by Ishaan Singal on 12/12/13.
//  Copyright (c) 2013 ishaan.practise. All rights reserved.
//

#import "BFSEnumerator.h"

@interface BFSEnumerator ()
@property NSDictionary *tree;
@property NSMutableSet *visited;
@property NSMutableArray *queue;
@end

@implementation BFSEnumerator

- (id)init {
    self = [super init];
    return self;
}

-(id)initWithSourceTree:(NSDictionary*)sourceTree andStartNode:(id)startNode {
    self = [super init];
    _tree = [NSDictionary dictionaryWithDictionary: sourceTree];
    _visited = [[NSMutableSet alloc]initWithCapacity:sourceTree.count];
    _queue = [[NSMutableArray alloc]initWithCapacity:sourceTree.count];
    [_queue addObject:startNode];
    return self;
}

- (id)nextObject {
    if ([self.queue count] == 0) {
        return nil;
    }
    
    id result = [self.queue firstObject];
    [self.queue removeObject:result];
    NSSet *adjacentNodes = [NSSet setWithSet:[self.tree objectForKey:result]];
    for (id neighbour in adjacentNodes) {
        if (![self.visited containsObject:neighbour]) {
            [self.queue addObject:[NSNumber valueWithNonretainedObject:neighbour]];
        }
    }
    [self.visited addObject:[result nonretainedObjectValue]];
    return [result nonretainedObjectValue];
}

@end
