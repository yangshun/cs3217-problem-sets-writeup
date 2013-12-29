//
//  ViewController.m
//  HelloWorld
//
//  Created by Camillus Gerard Cai on 29/12/13.
//  Copyright (c) 2013 NUS CS3217. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)button_TouchUpInside:(id)sender {
    [self.textLabel setText:@"Hello World!"];
}
@end
