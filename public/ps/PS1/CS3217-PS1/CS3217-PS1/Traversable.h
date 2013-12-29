//
//  Traversable.h
//  CS3217-PS1
//
//  Created by Camillus Gerard Cai on 20/12/13.
//  Copyright (c) 2013 NUS CS3217. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Traversable <NSObject>
- (NSArray *) arrayInLevelOrder;
- (NSEnumerator *) levelOrderEnumerator;

@end
