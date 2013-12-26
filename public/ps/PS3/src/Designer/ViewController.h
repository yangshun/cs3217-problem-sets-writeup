//
//  ViewController.h
//  PS3
//
//  Created by Ishaan Singal on 15/12/13.
//  Copyright (c) 2013 ishaan.practise. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIGestureRecognizerDelegate>
@property (strong, nonatomic) IBOutlet UIToolbar *actionBar;
@property (strong, nonatomic) IBOutlet UIImageView *bluePaletteBubble;
@property (strong, nonatomic) IBOutlet UIImageView *redPaletteBubble;
@property (strong, nonatomic) IBOutlet UIImageView *orangePaletteBubble;
@property (strong, nonatomic) IBOutlet UIImageView *greenPaletteBubble;
@property (strong, nonatomic) IBOutlet UIImageView *eraserPalette;
@property (strong, nonatomic) IBOutlet UIView *paletteView;

@end
