//
//  Constants.h
//  BubblePopper
//
//  Created by Ishaan Singal on 12/12/13.
//  Copyright (c) 2013 ishaan.practise. All rights reserved.
//

#import <Foundation/Foundation.h>

FOUNDATION_EXPORT NSString *const kBackgroundImageName;

FOUNDATION_EXPORT NSString *const kBlueBubbleImageName;
FOUNDATION_EXPORT NSString *const kGreenBubbleImageName;
FOUNDATION_EXPORT NSString *const kRedBubbleImageName;
FOUNDATION_EXPORT NSString *const kOrangeBubbleImageName;

FOUNDATION_EXPORT double const kScreenWidth;
FOUNDATION_EXPORT double const kScreenHeight;
FOUNDATION_EXPORT int const kNumberOfRows;
FOUNDATION_EXPORT int const kNumberOfColumns;
FOUNDATION_EXPORT int const kBubbleViewDiameter;

typedef enum {kInactive, kActive, kKilled} BubbleState;
typedef enum {kBlue, kRed, kOrange, kGreen, kEraser} BubbleType;
