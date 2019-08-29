//
//  AnotherViewController.m
//  RNAlertControllerExample
//
//  Created by Rayhan Nabi on 8/29/19.
//  Copyright © 2019 Rayhan. All rights reserved.
//

#import "AnotherViewController.h"

@import RNAlertController;

@interface AnotherViewController ()

- (IBAction)didTapAlert:(id)sender;

@end

@implementation AnotherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didTapAlert:(id)sender {
    NSLog(@"Did tap alert");
    RNAlertController *alert = [[RNAlertController alloc] initWithTitle:@"Ladakh" message:@"To go back to Kashmir tap Home else tap cancel"];
    alert addButt
}

@end
