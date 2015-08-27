//
//  WorkTypePickerViewController.m
//  Due-Dates
//
//  Created by Zack Spicer on 8/26/15.
//  Copyright (c) 2015 Dev Mountain. All rights reserved.
//

#import "WorkTypePickerViewController.h"

@interface WorkTypePickerViewController ()

@property (strong, nonatomic) IBOutlet UIVisualEffectView *visualEffect;

@end

@implementation WorkTypePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.visualEffect.alpha = 0.5;
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
