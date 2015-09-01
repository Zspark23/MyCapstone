//
//  PracticeEntryViewController.m
//  Due-Dates
//
//  Created by Zack Spicer on 8/26/15.
//  Copyright (c) 2015 Dev Mountain. All rights reserved.
//

#import "PracticeEntryViewController.h"
#import "Task.h"
#import "EntryController.h"

@interface PracticeEntryViewController ()

@property (strong, nonatomic) IBOutlet UITextField *practiceFrequencyTextField;
@property (strong, nonatomic) IBOutlet UILabel *frequencyTitleLabel;

@end

@implementation PracticeEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)submitButtonTapped:(UIButton *)sender
{
    if([self.practiceFrequencyTextField.text isEqualToString:@""])
    {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Please Add a Frequency"
                                                                       message:@"Please add how frequently you want to practice."
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }else
    {
        if ((([self.practiceFrequencyTextField.text intValue] > 24) || ([self.practiceFrequencyTextField.text intValue] < 1)) && ([self.frequencyTitleLabel.text isEqualToString:@"How many hours a day do you want to exercise?"]))
        {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Choose another number"
                                                                           message:@"The amount of hours to practice/exercise per day cannot be above 24 or below 1"
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {}];
            
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
        }else if((([self.practiceFrequencyTextField.text intValue] > 7) || ([self.practiceFrequencyTextField.text intValue] < 1)) && ([self.frequencyTitleLabel.text isEqualToString:@"How many days a week do you want to exercise?"]))
        {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Choose another number"
                                                                           message:@"The number of days to practice/exercise per week cannot be above 7 or below 1"
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {}];
            
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
        }else if (((([self.practiceFrequencyTextField.text intValue] > 4) || ([self.practiceFrequencyTextField.text intValue] < 1)) && ([self.frequencyTitleLabel.text isEqualToString:@"How many weeks a month do you want to exercise?"])))
        {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Choose another number"
                                                                           message:@"The number of weeks to practice/exercise per month cannot be above 4 or below 1"
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {}];
            
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
        }else
        {
            self.entry.practiceFrequency = [NSNumber numberWithInt:[self.practiceFrequencyTextField.text intValue]];
            [[EntryController sharedInstance] save];
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
    }
}


@end
