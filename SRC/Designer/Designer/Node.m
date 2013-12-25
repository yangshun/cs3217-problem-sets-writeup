//
//  Node.m
//  PS2
//
//  Created by Ishaan Singal on 13/12/13.
//  Copyright (c) 2013 ishaan.practise. All rights reserved.
//

#import "Node.h"

@interface Node ()
@property (readwrite) id nodeData;
@end

@implementation Node

- (id)initWithNodeData:(id)data {
    self = [super init];
    if (self) {
        _nodeData = data;
    }
    return self;
}

+ (id)nodeWithData:(id)data {
    return [[Node alloc]initWithNodeData:data];
}

//- (id)copyWithZone:(NSZone *)zone {
//    id copy = [[[self class] alloc] init];
//    if (copy) {
//        [copy setNodeData:[self.nodeData copyWithZone:zone]];
//    }
//    // Copy over all instance variables from self to objectCopy.
//    // Use deep copies for all strong pointers, shallow copies for weak.
//    return copy;
//}
//
//- (NSUInteger)hash {
//    return [self.nodeData hash];
//}

- (BOOL)isEqual:(id)object {
    // it's an instance of the subclass, the superclass properties are equal
    // so check the added subclass property
    return [object isKindOfClass: [Node class]] && [[object nodeData] isEqual: self.nodeData];
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.nodeData forKey:@"data"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        _nodeData = [decoder decodeObjectForKey:@"data"];
    }
    return self;
}


@end