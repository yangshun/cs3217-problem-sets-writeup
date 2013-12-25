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

//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    Graph *test = [[Graph alloc]initWithNumberOfVertices:4 isDirected:NO];
//    
//    [test insertEdge:[Edge edgeWithSource:[Node nodeWithData:@"A"] andDestination:[Node nodeWithData:@"B"]]];
//    [test insertEdge:[Edge edgeWithSource:[Node nodeWithData:@"A"] andDestination:[Node nodeWithData:@"C"]]];
//    [test insertEdge:[Edge edgeWithSource:[Node nodeWithData:@"B"] andDestination:[Node nodeWithData:@"D"]]];
//    [test insertEdge:[Edge edgeWithSource:[Node nodeWithData:@"B"] andDestination:[Node nodeWithData:@"E"]]];
//    [test insertEdge:[Edge edgeWithSource:[Node nodeWithData:@"D"] andDestination:[Node nodeWithData:@"E"]]];
//
//    NSMutableData *data = [NSMutableData data];
//    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
//    [archiver encodeObject:test.tree forKey:@"Graph"];
//    [archiver finishEncoding];
//    NSArray* documentsFolder = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
//    NSString* documentString = [documentsFolder objectAtIndex:0];
//    NSString* fileLocation = [NSString stringWithFormat:@"%@/%@", documentString, @"test"];
//    BOOL result = [data writeToFile: fileLocation atomically:YES];
//    if (result) {
//        NSLog(@"success");
//    }
//    // Do any additional setup after loading the view, typically from a nib.
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadBackground];
    
    self.gameAreaCollection = [[GameAreaCollectionViewController alloc] init];
    [self.view addSubview:self.gameAreaCollection.bubbleCollection];
    //    self.gameArea = [[GameAreaViewController alloc]init];
    //    [self.view addSubview:self.gameArea.view];
}


- (void)loadBackground {
    UIImage *bgImage = [UIImage imageNamed:@"background.png"];
    UIImageView *background = [[UIImageView alloc]initWithImage:bgImage];
    background.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    [self.view addSubview:background];
    [self.view sendSubviewToBack:background];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
