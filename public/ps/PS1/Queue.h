//
//  Queue.h
//
//  Copyright (c) 2013 NUS CS3217. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Queue <NSObject>

// Adds an object to the tail of the queue.
- (void) enqueueObject: (id)obj;

// Removes and returns the object at the head of the queue.
- (id) dequeueObject;

// Returns, but does not remove, the object at the head of the queue.
- (id) peek;

// Returns the number of objects currently in the queue.
- (NSUInteger) count;

// Removes all objects in the queue.
- (void) removeAllObjects;

@end
