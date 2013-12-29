//
//  ArrayBackedQueue.h
//  CS3217-PS1
//
//  Solution
//
//  Created by Camillus Gerard Cai on 19/12/13.
//  Copyright (c) 2013 NUS CS3217. All rights reserved.
//

#import "Queue.h"
#import <Foundation/Foundation.h>

@interface ArrayBackedQueue : NSObject <Queue>
@property (nonatomic, strong) NSMutableArray *mutableArray;

+ (id) queue;

- (id) init;
- (void) enqueueObject: (id)obj;
- (id) dequeueObject;
- (id) peek;
- (NSUInteger) count;
- (void) removeAllObjects;

@end
