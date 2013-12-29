//
//  NSDictionary+NSDictionary_Traversable.m
//  CS3217-PS1
//
//  Created by Camillus Gerard Cai on 20/12/13.
//  Copyright (c) 2013 NUS CS3217. All rights reserved.
//

#import "NSDictionary+Traversable.h"

@implementation NSDictionary (NSDictionary_Traversable)
- (NSArray *) arrayInLevelOrder
{
    return [[self levelOrderEnumerator] allObjects];
}

- (NSEnumerator *) levelOrderEnumerator
{
    return NULL;
}

@end
