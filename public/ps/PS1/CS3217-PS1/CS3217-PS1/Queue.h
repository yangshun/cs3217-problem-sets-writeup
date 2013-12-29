//
//  Queue.h
//  CS3217-PS1
//
//  Created by Camillus Gerard Cai on 19/12/13.
//  Copyright (c) 2013 NUS CS3217. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Queue <NSObject>
- (void) enqueueObject: (id)obj;
- (id) dequeueObject;
- (id) peek;
- (NSUInteger) count;
- (void) removeAllObjects;

@end
