//
//  HomeworkEntryViewController.m
//  Due-Dates
//
//  Created by Zack Spicer on 8/25/15.
//  Copyright (c) 2015 Dev Mountain. All rights reserved.
//

#import "HomeworkEntryViewController.h"
#import "EntryController.h"

@interface HomeworkEntryViewController ()

@property (strong, nonatomic) IBOutlet UITextField *numberOfQuestionsTextField;
@property (strong, nonatomic) IBOutlet UIButton *submitButton;

@end

@implementation HomeworkEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)submitButtonTapped:(UIButton *)sender
{
    if ([self.numberOfQuestionsTextField.text isEqualToString:@""])
    {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Enter a Number of Questions"
                                                                       message:@"You must enter a number of questions"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }else
    {
        self.entry.homeworkQuestionsAmount = [NSNumber numberWithInt:[self.numberOfQuestionsTextField.text intValue]];
        self.entry = [[EntryController sharedInstance] createEntry];
        [[EntryController sharedInstance] save];
        [self.navigationController popToRootViewControllerAnimated:YES];
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
