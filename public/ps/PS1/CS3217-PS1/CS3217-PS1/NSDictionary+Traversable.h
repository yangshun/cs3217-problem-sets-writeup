//
//  NSDictionary+NSDictionary_Traversable.h
//  CS3217-PS1
//
//  Created by Camillus Gerard Cai on 20/12/13.
//  Copyright (c) 2013 NUS CS3217. All rights reserved.
//

#import "Traversable.h"
#import <Foundation/Foundation.h>

@interface NSDictionary (NSDictionary_Traversable) <Traversable>
- (NSArray *) arrayInLevelOrderFromVertexLabeled: (NSString *)label;
- (NSEnumerator *) levelOrderEnumeratorFromVertexLabeled: (NSString *)label;

@end
