//
//  TestsEntryViewController.m
//  Due-Dates
//
//  Created by Zack Spicer on 8/26/15.
//  Copyright (c) 2015 Dev Mountain. All rights reserved.
//

#import "TestsEntryViewController.h"

@interface TestsEntryViewController ()

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation TestsEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)submitButtonTapped:(UIButton *)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
