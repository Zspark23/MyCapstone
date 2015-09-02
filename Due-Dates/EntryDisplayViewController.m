//
//  EntryDisplayViewController.m
//  Due-Dates
//
//  Created by Zack Spicer on 9/1/15.
//  Copyright (c) 2015 Dev Mountain. All rights reserved.
//

#import "EntryDisplayViewController.h"
#import "MPCheckBox.h"

@interface EntryDisplayViewController ()

@property (strong, nonatomic) IBOutlet UITableView *entryDisplayTableView;
@property (strong, nonatomic) IBOutlet MPCheckBox *checkBox;

@end

@implementation EntryDisplayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([self.title isEqualToString:@"Homework"])
    {
        self.entryDisplayTableView.tag = 1;
    }else if ([self.title isEqualToString:@"Essays"])
    {
        self.entryDisplayTableView.tag = 2;
    }else if ([self.title isEqualToString:@"Projects"])
    {
        self.entryDisplayTableView.tag = 3;
    }else if ([self.title isEqualToString:@"Tests"])
    {
        self.entryDisplayTableView.tag = 4;
    }else if ([self.title isEqualToString:@"Chores"])
    {
        self.entryDisplayTableView.tag = 5;
    }else if ([self.title isEqualToString:@"Practice/Exercise"])
    {
        self.entryDisplayTableView.tag = 6;
    }else if ([self.title isEqualToString:@"Other"])
    {
        self.entryDisplayTableView.tag = 7;
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
