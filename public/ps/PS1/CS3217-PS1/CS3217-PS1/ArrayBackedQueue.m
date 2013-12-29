//
//  ArrayBackedQueue.m
//  CS3217-PS1
//
//  Solution
//
//  Created by Camillus Gerard Cai on 19/12/13.
//  Copyright (c) 2013 NUS CS3217. All rights reserved.
//

#import "ArrayBackedQueue.h"

@implementation ArrayBackedQueue
@synthesize mutableArray;

+ (id) queue
{
    return [[ArrayBackedQueue alloc] init];
}

- (id) init
{
    if (self = [super init]) {
        mutableArray = [NSMutableArray array];
    }
    return self;
}

- (void) enqueueObject: (id)obj
{
    [mutableArray addObject:obj];
}

- (id) dequeueObject
{
    id obj = [self peek];
    
    if (obj) {
        [mutableArray removeObjectAtIndex:0];
    }
    
    return obj;
}

- (id) peek
{
    return self.count ? [mutableArray objectAtIndex:0] : NULL;
}

- (NSUInteger) count
{
    return mutableArray.count;
}

- (void) removeAllObjects
{
    [mutableArray removeAllObjects];
}

@end
