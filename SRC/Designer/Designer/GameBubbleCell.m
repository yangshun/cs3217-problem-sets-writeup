//
//  GameBubbleCell.m
//  BubblePopper
//
//  Created by Ishaan Singal on 17/12/13.
//  Copyright (c) 2013 ishaan.practise. All rights reserved.
//

#import "GameBubbleCell.h"
#import "DFSEnumerator.h"

@implementation GameBubbleCell

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

- (void)createBubbleAtRow:(int)row Column:(int)column AtPos:(CGPoint)origin{

    _bubble = [[Bubble alloc]initWithOrigin:origin Row:row Column:column];
    [_bubble setState:kInactive];
    [_bubble setType:kBlue];
   
    
    self.bubbleImage = [[UIImageView alloc]initWithImage:[self getImageForBubbleType:self.bubble.bubbleType]];
    self.bubbleImage.frame = CGRectMake(0, 0, kBubbleViewDiameter, kBubbleViewDiameter);
    self.bubbleImage.hidden = YES;
    [self.contentView addSubview:self.bubbleImage];
    
    //add a circular border to the view
    CGRect cellFrame = self.contentView.frame;
    cellFrame.size = CGSizeMake(kBubbleViewDiameter, kBubbleViewDiameter);
    self.contentView.frame = cellFrame;
    self.contentView.layer.borderColor = [UIColor blackColor].CGColor;
    self.contentView.layer.borderWidth = 1.5f;
    [self.contentView setBackgroundColor:[UIColor grayColor]];
    self.contentView.alpha = 0.40;
    self.contentView.layer.cornerRadius = kBubbleViewDiameter/2;
}

- (void)activateBubbleWithType:(BubbleType)bubbleColor {
    [self.bubble setState: kActive];
    [self.bubble setType: bubbleColor];
    self.bubbleImage = [[UIImageView alloc]initWithImage:[self getImageForBubbleType:self.bubble.bubbleType]];
    self.bubbleImage.frame = CGRectMake(0, 0, kBubbleViewDiameter, kBubbleViewDiameter);
    
    [self.contentView addSubview:self.bubbleImage];
//    self.layer.backgroundColor = [UIColor clearColor].CGColor;
//    cell.layer.shouldRasterize = YES;
}

- (void)inactiveBubble {
    [self.bubble setState:kInactive];
    [self.bubbleImage setAlpha:0.25f];
}

- (void)activateBubble {
    self.bubbleImage.hidden = NO;
    [self.bubble setState:kActive];
    [self.contentView setAlpha:1.0f];
}


- (void)deactiveBubble {
    [self.bubble setState:kKilled];
    [self.bubbleImage setAlpha:0.0f];
}

- (UIImage*)getImageForBubbleType:(BubbleType)type {
    //    UIImage *bubbleImage = [UIImage imageNamed:@"bubble-red.png"];
    UIImage *bubbleImage = [[UIImage alloc]init];
    switch (type) {
        case kBlue:
            bubbleImage = [UIImage imageNamed:kBlueBubbleImageName];
            break;
        case kRed:
            bubbleImage = [UIImage imageNamed:kRedBubbleImageName];
            break;
        case kGreen:
            bubbleImage = [UIImage imageNamed:kGreenBubbleImageName];
            break;
        case kOrange:
            bubbleImage = [UIImage imageNamed:kOrangeBubbleImageName];
            break;
        default:
            break;
    }
    return bubbleImage;
}

- (BOOL)isEqual:(id)object {
    return [object isKindOfClass: [self class]] && [[object bubbleImage] isEqual: self.bubbleImage];
}

- (void)bubbleTapped {
    if (self.bubble.bubbleState == kInactive) {
        [self.bubble setState: kActive];
        self.bubbleImage.alpha = 1.0f;
    }
    else if (self.bubble.bubbleState == kActive) {
        [self.bubble setType: (self.bubble.bubbleType + 1)%4];
        [self.bubbleImage setImage:[self getImageForBubbleType:self.bubble.bubbleType]];
    }
    return;
}


- (void)dealloc {
    NSLog(@"test");
}


@end
