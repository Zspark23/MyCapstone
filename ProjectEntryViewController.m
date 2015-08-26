//
//  ProjectEntryViewController.m
//  Due-Dates
//
//  Created by Zack Spicer on 8/25/15.
//  Copyright (c) 2015 Dev Mountain. All rights reserved.
//

#import "ProjectEntryViewController.h"

@interface ProjectEntryViewController ()

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ProjectEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)submitButtonTapped:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


@end
