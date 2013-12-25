//
//  GameAreaCollectionViewController.h
//  BubblePopper
//
//  Created by Ishaan Singal on 17/12/13.
//  Copyright (c) 2013 ishaan.practise. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameBubbleCell.h"

@interface GameAreaCollectionViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UINavigationControllerDelegate>

@property (strong, nonatomic) UICollectionView *bubbleCollection;

- (void)createLevel;
- (void)redesignLevel;
@end
