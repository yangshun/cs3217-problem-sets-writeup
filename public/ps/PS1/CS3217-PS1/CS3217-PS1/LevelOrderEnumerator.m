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
@synthesize bfsQueue;

+ (LevelOrderEnumerator *) enumeratorWithDictionary:(NSDictionary *)dict
{
    return [[LevelOrderEnumerator alloc] initWithDictionary:dict];
}

- (id) initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
        NSDictionary *backingDict = [NSDictionary dictionaryWithDictionary:dict];
        self.bfsQueue = [ArrayBackedQueue queue];
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
    return nil;
}

@end
