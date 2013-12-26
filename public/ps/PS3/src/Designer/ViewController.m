//
//  ViewController.m
//  PS3
//
//  Created by Ishaan Singal on 15/12/13.
//  Copyright (c) 2013 ishaan.practise. All rights reserved.
//

#import "ViewController.h"
#import "GameAreaCollectionViewController.h"
#import "Graph.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()
@property Graph *graph;
@property GameAreaCollectionViewController *gameAreaCollection;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadBackground];
    [self loadPalette];
    
    self.gameAreaCollection = [[GameAreaCollectionViewController alloc] init];
    [self.view addSubview:self.gameAreaCollection.bubbleCollection];
}

- (void)loadBackground {
    UIImage *bgImage = [UIImage imageNamed:@"background.png"];
    UIImageView *background = [[UIImageView alloc]initWithImage:bgImage];
    background.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    [self.view addSubview:background];
    [self.view sendSubviewToBack:background];
}

- (void)loadPalette {
    
    NSArray *paletteItems = [[NSArray alloc]initWithObjects:self.bluePaletteBubble, self.redPaletteBubble, self.orangePaletteBubble, self.greenPaletteBubble, self.eraserPalette, nil];
    for (UIImageView* paletteItem in paletteItems) {
        paletteItem.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(paletteBubbleTapped:)];
        tapGesture.numberOfTouchesRequired = 1;
        [paletteItem addGestureRecognizer:tapGesture];
    }
    
}


- (void)paletteBubbleTapped:(UITapGestureRecognizer*)sender {
    NSArray *paletteItems = [[NSArray alloc]initWithObjects:self.bluePaletteBubble, self.redPaletteBubble, self.orangePaletteBubble, self.greenPaletteBubble, self.eraserPalette, nil];
    for (UIImageView* paletteItem in paletteItems) {
        [paletteItem setAlpha:0.5f];
        if ([sender.view isEqual:paletteItem]) {
            [self.gameAreaCollection updateCellFill:[paletteItems indexOfObject:paletteItem]];
            [paletteItem setAlpha:1.0f];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//- (IBAction)createLevelButtonPressed:(id)sender {
//    if ([((UIButton*)sender).titleLabel.text isEqualToString:@"Create Level"]) {
//        [((UIButton*)sender) setTitle:@"Redesign Level" forState:UIControlStateNormal];
//        [self.gameAreaCollection createLevel];
//    }
//    else {
//        [((UIButton*)sender) setTitle:@"Create Level" forState:UIControlStateNormal];
//        [self.gameAreaCollection redesignLevel];
//    }
//}


@end
