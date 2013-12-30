//
//  LevelOrderEnumerator.h
//  CS3217-PS1
//
//  Created by Camillus Gerard Cai on 30/12/13.
//  Copyright (c) 2013 NUS CS3217. All rights reserved.
//

#import "Queue.h"
#import <Foundation/Foundation.h>

@interface LevelOrderEnumerator : NSEnumerator
@property (nonatomic, strong) NSDictionary *backingDict;
@property (nonatomic, strong) id<Queue> bfsQueue;

+ (LevelOrderEnumerator *) enumeratorWithDictionary: (NSDictionary *)dict startVertex: (NSString *)label;

- (id) initWithDictionary: (NSDictionary *)dict startVertex: (NSString *)label;
- (NSArray *) allObjects;
- (id) nextObject;

@end
