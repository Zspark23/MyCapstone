//
//  NewEntryViewController.m
//  Due-Dates
//
//  Created by Zack Spicer on 8/24/15.
//  Copyright (c) 2015 Dev Mountain. All rights reserved.
//

#import "NewEntryViewController.h"

enum WorkType
{
    WorkTypeHomework,
    WorkTypeEssays,
    WorkTypeProjects,
    WorkTypeTests,
    WorkTypeChores,
    WorkTypePractice,
    WorkTypeOther,
    WorkTypeTop
};

@interface NewEntryViewController ()

@property (strong, nonatomic) IBOutlet UITextField *titleTextField;
@property (strong, nonatomic) IBOutlet UITextField *typeTextField;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) IBOutlet UITextField *workDivideTextField;

@end

@implementation NewEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.datePicker.minimumDate = [NSDate date];
}

#pragma mark - Submit Button Tapped Method

// Method called when the submit button is tapped
- (IBAction)submitButtonTapped:(UIButton *)sender
{
    if([self.titleTextField.text isEqualToString:@""]) // Check to see if the title text field is empty
    {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Enter a Title"
                                                                       message:@"You must enter a Title"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }else if([self.typeTextField.text isEqualToString:@""]) // Check to see if the type text field is empty
    {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Enter a Type"
                                                                       message:@"You must enter a type"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }else if ([self.workDivideTextField.text isEqualToString:@""]) // Check to see if the Work Divide text field is empty
    {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Enter a Work Divide Type"
                                                                       message:@"You must enter how you want your work divided"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }else
    {
        // Checking to see what is in the type text field
        
        if ([self.typeTextField.text isEqualToString:@"Homework"]) // Homework
        {
            [self performSegueWithIdentifier:@"homeworkEntry" sender:sender];
        }else if ([self.typeTextField.text isEqualToString:@"Essays"]) // Essays
        {
            [self performSegueWithIdentifier:@"essaysEntry" sender:sender];
        }else if ([self.typeTextField.text isEqualToString:@"Projects"]) // Projects
        {
            [self performSegueWithIdentifier:@"projectsEntry" sender:sender];
        }else if ([self.typeTextField.text isEqualToString:@"Tests"]) // Tests
        {
            [self performSegueWithIdentifier:@"testsEntry" sender:sender];
        }else if ([self.typeTextField.text isEqualToString:@"Chores"]) // Chores
        {
            [self performSegueWithIdentifier:@"choresEntry" sender:sender];
        }else if ([self.typeTextField.text isEqualToString:@"Practice"] && [self.workDivideTextField.text isEqualToString:@"Hourly"])
            // Practice Hourly
        {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Select Another Work Divide"
                                                                           message:@"It's not possible to divide practice hourly"
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {}];
            
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
        }else if ([self.typeTextField.text isEqualToString:@"Practice"] && [self.workDivideTextField.text isEqualToString:@"Daily"])
            // Practice Daily
        {
            [self performSegueWithIdentifier:@"practiceDailyEntry" sender:sender];
        }else if ([self.typeTextField.text isEqualToString:@"Practice"] && [self.workDivideTextField.text isEqualToString:@"Weekly"])
            // Practice Weekly
        {
            [self performSegueWithIdentifier:@"practiceWeeklyEntry" sender:sender];
        }else if ([self.typeTextField.text isEqualToString:@"Practice"] && [self.workDivideTextField.text isEqualToString:@"Monthly"])
            // Practice Montly
        {
            [self performSegueWithIdentifier:@"practiceMonthlyEntry" sender:sender];
        }else if ([self.typeTextField.text isEqualToString:@"Other"]) // Other
        {
            [self performSegueWithIdentifier:@"otherEntry" sender:sender];
        }else // Something other then the seven listed above; shows an alert
        {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Enter a Valid Type"
                                                                           message:@"You must enter a valid entry type to continue"
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {}];
            
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }
    
}

@end
