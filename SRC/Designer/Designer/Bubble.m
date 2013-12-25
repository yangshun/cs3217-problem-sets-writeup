//
//  Bubble.m
//  BubblePopper
//
//  Created by Ishaan Singal on 12/12/13.
//  Copyright (c) 2013 ishaan.practise. All rights reserved.
//

#import "Bubble.h"

@interface Bubble ()
@property (nonatomic, strong) NSMutableSet *mutableAdjacentNodes;
@property (readwrite) BubbleType bubbleType;
@property (readwrite) BubbleState bubbleState;
@property (readwrite) CGPoint imageOrigin;
@property (readwrite) CGFloat row;
@property (readwrite) CGFloat column;
@end

@implementation Bubble

- (id)initWithOrigin:(CGPoint)pos Row:(CGFloat)row Column:(CGFloat)column State:(int)state TypeOfBubble:(BubbleType)givenBubbleType {
    self = [[Bubble alloc]initWithOrigin:pos Row:row Column:column TypeOfBubble:givenBubbleType BubbleState:state];
    return self;
}

- (id)initWithOrigin:(CGPoint)origin Row:(CGFloat)row Column:(CGFloat)column TypeOfBubble:(BubbleType)givenBubbleType BubbleState:(BubbleState)state {
    self = [[Bubble alloc]initWithOrigin:origin Row:row Column:column];
    if (self) {
        _bubbleType = givenBubbleType;
        _bubbleState = state;
    }
    return self;
}

- (id)initWithOrigin:(CGPoint)origin Row:(CGFloat)row Column:(CGFloat)column {
    self = [super init];
    if (self) {
        _imageOrigin = origin;
        _row = row;
        _column = column;
        _bubbleState = kInactive;
        _mutableAdjacentNodes = [[NSMutableSet alloc]init];
    }
    return self;
}

-(NSSet*)adjacentNodes {
    return [self.mutableAdjacentNodes copy];
}

- (void)addAdjacentBubbles:(NSSet*)neighbours {
    [self.mutableAdjacentNodes unionSet:neighbours];
    return;
}

- (void)addAdjacentBubble:(Bubble*)neighbour {
    [self.mutableAdjacentNodes addObject:neighbour];
    return;
}

- (void)removeAdjacentBubble:(Bubble*)neighbour {
    [self.mutableAdjacentNodes removeObject:neighbour];
    return;
}

- (void)setType:(BubbleType)bubbleType {
    self.bubbleType = bubbleType;
}

- (void)setState:(BubbleState)state {
    self.bubbleState = state;
}

- (BOOL)isEqual:(id)object {
    BOOL flag = YES;
    Bubble *obj = (Bubble*)object;
    flag = flag && [object isKindOfClass: [Bubble class]];
    flag = flag && (obj.row - self.row  < 0.0001);
    flag = flag && (obj.column - self.column  < 0.0001);
    return flag;
}



@end
