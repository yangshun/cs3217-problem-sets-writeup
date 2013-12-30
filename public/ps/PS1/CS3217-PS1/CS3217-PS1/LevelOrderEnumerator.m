//
//  LevelOrderEnumerator.m
//  CS3217-PS1
//
//  Created by Camillus Gerard Cai on 30/12/13.
//  Copyright (c) 2013 NUS CS3217. All rights reserved.
//

#import "ArrayBackedQueue.h"
#import "LevelOrderEnumerator.h"

@implementation LevelOrderEnumerator
@synthesize backingDict;
@synthesize bfsQueue;

+ (LevelOrderEnumerator *) enumeratorWithDictionary:(NSDictionary *)dict startVertex:(NSString *)label
{
    return [[LevelOrderEnumerator alloc] initWithDictionary:dict startVertex:label];
}

- (id) initWithDictionary:(NSDictionary *)dict startVertex:(NSString *)label
{
    if (self = [super init]) {
        self.backingDict = [NSDictionary dictionaryWithDictionary:dict];
        self.bfsQueue = [ArrayBackedQueue queue];
        [self.bfsQueue enqueueObject:label];
    }
    return self;
}

- (NSArray *) allObjects
{
    id obj;
    NSMutableArray *array = [NSMutableArray array];
    while ((obj = [self nextObject]) != nil) {
        [array addObject:obj];
    }
    return array;
}

- (id) nextObject
{
    if (self.bfsQueue.count > 0) {
        NSString *current = [self.bfsQueue dequeueObject];
        NSArray *children = [self.backingDict objectForKey:current];
        for (NSString *child in children) {
            [self.bfsQueue enqueueObject:child];
        }
        return current;
    } else {
        return nil;
    }
}

@end
