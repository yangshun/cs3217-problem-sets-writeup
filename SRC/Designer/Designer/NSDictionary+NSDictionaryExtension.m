//
//  NSDictionary+NSDictionaryExtension.m
//  PS1
//
//  Created by Ishaan Singal on 12/12/13.
//  Copyright (c) 2013 ishaan.practise. All rights reserved.
//

#import "NSDictionary+NSDictionaryExtension.h"

@implementation NSDictionary (NSDictionaryExtension)

- (NSEnumerator*)bfsEnumeratorWithStartNode:(id)startNode {
    return [[BFSEnumerator alloc] initWithSourceTree:self andStartNode:startNode];
}

- (NSEnumerator*)dfsEnumeratorWithStartNode:(id)startNode {
    return [[DFSEnumerator alloc] initWithSourceTree:self andStartNode:startNode];
}


@end
