//
//  GameBubbleCell.h
//  BubblePopper
//
//  Created by Ishaan Singal on 17/12/13.
//  Copyright (c) 2013 ishaan.practise. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bubble.h"

@interface GameBubbleCell : UICollectionViewCell

@property Bubble *bubble;
@property UIImageView *bubbleImage;

- (void)createBubbleAtRow:(int)row Column:(int)column AtPos:(CGPoint)origin;
- (void)activateBubbleWithType:(BubbleType)bubbleColor;
- (void)inactiveBubble;
- (void)activateBubble;
- (void)deactiveBubble;
- (void)bubbleTapped;

@end
