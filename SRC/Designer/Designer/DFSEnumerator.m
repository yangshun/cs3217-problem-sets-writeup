//
//  DFSEnumerator.m
//  PS1
//
//  Created by Ishaan Singal on 12/12/13.
//  Copyright (c) 2013 ishaan.practise. All rights reserved.
//

#import "DFSEnumerator.h"
@interface DFSEnumerator ()
@property NSDictionary *tree;
@property NSMutableSet *visited;
@property NSMutableArray *stack;
@end

@implementation DFSEnumerator

- (id)init {
    self = [super init];
    return self;
}

-(id)initWithSourceTree:(NSDictionary*)sourceTree andStartNode:(id)startNode {
    self = [super init];
    if (sourceTree != nil) {
        _tree = [NSDictionary dictionaryWithDictionary: sourceTree];
        _visited = [[NSMutableSet alloc]initWithCapacity:sourceTree.count];
        _stack = [[NSMutableArray alloc]initWithCapacity:sourceTree.count];
    }
    else {
        _visited = [[NSMutableSet alloc]init];
        _stack = [[NSMutableArray alloc]init];
    }
    [_stack addObject:startNode];
    return self;
}

- (id)nextObject {
    if ([self.stack count] == 0) {
        return nil;
    }
    
    id result = [self.stack lastObject];
    [self.stack removeObject:result];
    
    NSSet *adjacentNodes = [[NSSet alloc]init];
//    if ([result isKindOfClass:[GameBubbleCell class]]) {
//        adjacentNodes = [NSSet setWithSet:((GameBubbleCell*)result).mutableAdjacentNodes];
//    }
//    else if ([result isKindOfClass:[GameBubble class]]) {
//        adjacentNodes = [NSSet setWithSet:((GameBubble*)result).mutableAdjacentNodes];
//    }
//    else {
    adjacentNodes = [NSSet setWithSet:[self.tree objectForKey:result]];
//    }
    
    for (id neighbour in adjacentNodes) {
        if (![self.visited containsObject:neighbour]) {
            [self.stack addObject:[NSNumber valueWithNonretainedObject:neighbour]];
        }
    }
    [self.visited addObject:[result nonretainedObjectValue]];
    return [result nonretainedObjectValue];
}

@end