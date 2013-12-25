//
//  Node.h
//  PS2
//
//  Created by Ishaan Singal on 13/12/13.
//  Copyright (c) 2013 ishaan.practise. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject

@property (readonly, nonatomic, retain)id nodeData;

- (id)initWithNodeData:(id)data;

+ (id)nodeWithData:(id)data;

@end
