//
//  Edge.h
//  PS2
//
//  Created by Ishaan Singal on 13/12/13.
//  Copyright (c) 2013 ishaan.practise. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "GameBubbleCell.h"

@interface Edge : NSObject

@property (readonly) id source;
@property (readonly) id destination;
@property (readonly) int weight;

- (id)initWithSource:(id)source andDestination:(id)destination;

- (id)initWithSource:(id)source andDestination:(id)destination andWeight:(int)weight;
+ (id)edgeWithSource:(id)source andDestination:(id)destination;

//check whether two nodes are equal
- (BOOL)isEquivalentToEdge:(Edge*)edge;

@end
