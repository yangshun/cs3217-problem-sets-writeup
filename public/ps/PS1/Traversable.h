//
//  Traversable.h
//
//  Copyright (c) 2013 NUS CS3217. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Traversable <NSObject>

// Returns an NSArray of NSStrings representing vertices traversed in level-order from a start vertex `label'.
- (NSArray *) arrayInLevelOrderFromVertexLabeled: (NSString *)label;

// Returns an NSEnumerator that traverses vertices in level-order from a start vertex `label'.
- (NSEnumerator *) levelOrderEnumeratorFromVertexLabeled: (NSString *)label;

@end
