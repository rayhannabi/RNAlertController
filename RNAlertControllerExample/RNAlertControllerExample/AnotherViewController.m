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
    RNAlertController *alert = [[RNAlertController alloc]
                                initWithTitle:@"Ladakh"
                                message:@"To go back to Kashmir tap Home else tap cancel"];
    [alert setURLWithUrlString:@"https://www.google.com/search?q=ladakh" text:@"Search Google"];
    [alert addCancelButtonWithAction:nil];
    [alert addButtonWithTitle:@"Home" type:AlertButtonTypeDefault action:^{
        [self.navigationController popToRootViewControllerAnimated:YES];
    }];
    [alert present];
}

@end
