//
//  main.m
//
//  Copyright (c) 2013 NUS CS3217. All rights reserved.
//

#import "Queue.h"
#import "NSDictionary+Traversable.h"
#import <Foundation/Foundation.h>

BOOL testQueue(id<Queue>);
BOOL testTraversable();

int main(int argc, const char * argv[])
{   
    if (testQueue([ArrayBackedQueue queue])) {
        NSLog(@"Queue test passed.");
    }
    
    if (testTraversable()) {
        NSLog(@"Traversable test passed.");
    }
    
    return 0;
}

// Do not modify this function.
BOOL testQueue(id<Queue> queue)
{
    int set[] = {3, 5, 1, 2, 4};
    [queue removeAllObjects];
    for (int i = 0; i < 5; i++) {
        [queue enqueueObject:[NSNumber numberWithInt:set[i]]];
    }
    for (int i = 0; i < 5; i++) {
        int n = [(NSNumber *)[queue dequeueObject] intValue];
        if (n != set[i]) {
            return FALSE;
        }
    }
    return TRUE;
}

// Do not modify this function.
BOOL testTraversable()
{
    NSArray *expected = [NSArray arrayWithObjects: @"a", @"b", @"c", @"d", nil];
    NSDictionary *tree = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:[NSArray arrayWithObjects:@"b", @"c", nil], [NSArray array], [NSArray arrayWithObjects:@"d", nil], [NSArray array], nil] forKeys:expected];
    NSArray *result = [tree arrayInLevelOrderFromVertexLabeled:@"a"];
    return [result isEqualToArray:expected];
}
