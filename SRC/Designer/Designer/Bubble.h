//
//  Bubble.h
//  BubblePopper
//
//  Created by Ishaan Singal on 12/12/13.
//  Copyright (c) 2013 ishaan.practise. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface Bubble : NSObject

@property (readonly) NSSet *adjacentNodes;
@property (readonly) BubbleType bubbleType;
@property (readonly) BubbleState bubbleState;
@property (readonly) CGPoint imageOrigin;
@property (readonly) CGFloat row;
@property (readonly) CGFloat column;


- (id)initWithOrigin:(CGPoint)origin Row:(CGFloat)row Column:(CGFloat)column;
- (id)initWithOrigin:(CGPoint)origin Row:(CGFloat)row Column:(CGFloat)column TypeOfBubble:(BubbleType)givenBubbleType BubbleState:(BubbleState)state;
- (id)initWithOrigin:(CGPoint)pos Row:(CGFloat)row Column:(CGFloat)column State:(int)state TypeOfBubble:(BubbleType)givenBubbleType;

- (void)addAdjacentBubbles:(NSSet*)neighbours;
- (void)addAdjacentBubble:(Bubble*)neighbour;
- (void)removeAdjacentBubble:(Bubble*)neighbour;
- (void)setType:(BubbleType)bubbleType;
- (void)setState:(BubbleState)state;

@end
