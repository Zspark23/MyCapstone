//
//  NewEntryViewController.m
//  Due-Dates
//
//  Created by Zack Spicer on 8/24/15.
//  Copyright (c) 2015 Dev Mountain. All rights reserved.
//

#import "NewEntryViewController.h"
#import "EntryController.h"
#import "HomeworkEntryViewController.h"
#import "EssaysEntryViewController.h"
#import "ProjectEntryViewController.h"
#import "TestsEntryViewController.h"
#import "ChoresEntryViewController.h"
#import "PracticeEntryViewController.h"
#import "OtherEntryViewController.h"

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

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *typeTextField;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UITextField *workDivideTextField;
@property (weak, nonatomic) IBOutlet UIView *workTypePickerView;
@property (weak, nonatomic) IBOutlet UIView *workDividePickerView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomLayoutConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *otherBottomLayoutConstraint;
@property (weak, nonatomic) IBOutlet UIDatePicker *dueDatePicker;
@property (strong, nonatomic) UITapGestureRecognizer *tap;

@end

@implementation NewEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.datePicker.minimumDate = [NSDate date];
    
    NSLog(@"%@", self);
    
   self.tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(workTypeEditingDidEnd:)];
    [self.view addGestureRecognizer:self.tap];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
}

-(void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if ([self.navigationController.viewControllers indexOfObject:self]==NSNotFound)
    {
        if (self.entry)
        {
            [[EntryController sharedInstance] deleteEntry:self.entry];
            [[EntryController sharedInstance] save];
        }
    }
    
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
        // Setting text field text to entry properties
        
        if (!self.entry)
        {
            self.entry = [[EntryController sharedInstance] createEntry];
            self.entry.title = self.titleTextField.text;
            self.entry.type = self.typeTextField.text;
            self.entry.workDivideType = self.workDivideTextField.text;
            self.entry.dueDate = self.dueDatePicker.date;
            self.entry.dateCreated = [NSDate date];
            
        }else
        {
            self.entry.title = self.titleTextField.text;
            self.entry.type = self.typeTextField.text;
            self.entry.workDivideType = self.workDivideTextField.text;
            self.entry.dueDate = self.dueDatePicker.date;
            self.entry.dateCreated = [NSDate date];
        }
        
        // Checking to see what is in the type text field
        
        if ([self.typeTextField.text isEqualToString:@"Homework"]) // Homework
        {
            [self performSegueWithIdentifier:@"homeworkEntry" sender:self];
        }else if ([self.typeTextField.text isEqualToString:@"Essays"]) // Essays
        {
            [self performSegueWithIdentifier:@"essaysEntry" sender:self];
        }else if ([self.typeTextField.text isEqualToString:@"Projects"]) // Projects
        {
            [self performSegueWithIdentifier:@"projectsEntry" sender:self];
        }else if ([self.typeTextField.text isEqualToString:@"Tests"]) // Tests
        {
            [self performSegueWithIdentifier:@"testsEntry" sender:self];
        }else if ([self.typeTextField.text isEqualToString:@"Chores"]) // Chores
        {
            [self performSegueWithIdentifier:@"choresEntry" sender:self];
        }else if ([self.typeTextField.text isEqualToString:@"Practice/Exercise"] && [self.workDivideTextField.text isEqualToString:@"Hourly"])
            // Practice Hourly
        {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Select Another Work Divide"
                                                                           message:@"It's not possible to divide practice hourly"
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {}];
            
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
        }else if ([self.typeTextField.text isEqualToString:@"Practice/Exercise"] && [self.workDivideTextField.text isEqualToString:@"Daily"])
            // Practice Daily
        {
            [self performSegueWithIdentifier:@"practiceDailyEntry" sender:self];
        }else if ([self.typeTextField.text isEqualToString:@"Practice/Exercise"] && [self.workDivideTextField.text isEqualToString:@"Weekly"])
            // Practice Weekly
        {
            [self performSegueWithIdentifier:@"practiceWeeklyEntry" sender:self];
        }else if ([self.typeTextField.text isEqualToString:@"Practice/Exercise"] && [self.workDivideTextField.text isEqualToString:@"Monthly"])
            // Practice Montly
        {
            [self performSegueWithIdentifier:@"practiceMonthlyEntry" sender:self];
        }else if ([self.typeTextField.text isEqualToString:@"Other"]) // Other
        {
            [self performSegueWithIdentifier:@"otherEntry" sender:self];
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

#pragma mark - Work Type Text Field Methods

- (IBAction)workTypeEditingDidBegin:(id)sender
{
    [sender resignFirstResponder];
    if ([self.typeTextField.text isEqualToString:@""])
    {
        self.typeTextField.text = @"Homework";
    }
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.y";
    animation.fromValue = @(self.workTypePickerView.center.y);
    animation.toValue = @(self.workTypePickerView.center.y - 285);
    animation.duration = .5;
    
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [self.workTypePickerView.layer addAnimation:animation forKey:@"basic"];
    
    self.workTypePickerView.layer.position = CGPointMake(self.workTypePickerView.layer.position.x, self.workTypePickerView.layer.position.y - 285);
    self.bottomLayoutConstraint.constant = -285;

}

- (IBAction)workTypeEditingDidEnd:(id)sender
{
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.y";
    animation.fromValue = @(self.workTypePickerView.center.y);
    animation.toValue = @(self.workTypePickerView.center.y + 285);
    animation.duration = .5;
    
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [self.workTypePickerView.layer addAnimation:animation forKey:@"basic"];
    
    self.workTypePickerView.layer.position = CGPointMake(self.workTypePickerView.layer.position.x, self.workTypePickerView.layer.position.y + 285);
    self.bottomLayoutConstraint.constant = 0;
}

- (IBAction)cancelButtonTapped:(UIBarButtonItem *)sender
{
    self.typeTextField.text = @"";
    [self workTypeEditingDidEnd:self.typeTextField];
}

- (IBAction)doneButtonTapped:(id)sender
{
    [self workTypeEditingDidEnd:self.typeTextField];
}

#pragma mark - Work Divide Text Field Methods

- (IBAction)workDivideEditingDidBegin:(id)sender
{
    [sender resignFirstResponder];
    if ([self.workDivideTextField.text isEqualToString:@""])
    {
        self.workDivideTextField.text = @"Hourly";
    }
    
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.y";
    animation.fromValue = @(self.workDividePickerView.center.y);
    animation.toValue = @(self.workDividePickerView.center.y - 285);
    animation.duration = .5;
    
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [self.workDividePickerView.layer addAnimation:animation forKey:@"basic"];
    
    self.workDividePickerView.layer.position = CGPointMake(self.workDividePickerView.layer.position.x, self.workDividePickerView.layer.position.y - 285);
    self.otherBottomLayoutConstraint.constant = 0;
    
}

- (IBAction)workDivideEditingDidEnd:(id)sender
{
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.y";
    animation.fromValue = @(self.workDividePickerView.center.y);
    animation.toValue = @(self.workDividePickerView.center.y + 285);
    animation.duration = .5;
    
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [self.workDividePickerView.layer addAnimation:animation forKey:@"basic"];
    
    self.workDividePickerView.layer.position = CGPointMake(self.workDividePickerView.layer.position.x, self.workDividePickerView.layer.position.y + 285);
    self.otherBottomLayoutConstraint.constant = - 285;
}
- (IBAction)workDivideCancelButtonTapped:(UIBarButtonItem *)sender
{
    self.workDivideTextField.text = @"";
    [self workDivideEditingDidEnd:self.workDivideTextField];
}

- (IBAction)workDivideDoneButtonTapped:(id)sender
{
    [self workDivideEditingDidEnd:self.workDivideTextField];
}

#pragma mark - Picker View Delegate Methods

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView.tag == 1)
    {
        return [self workTypeCategories][row];
    }else if (pickerView.tag == 2)
    {
        return [self workDivideCategories][row];
    }
    return @"";
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (pickerView.tag == 1)
    {
        self.typeTextField.text = [self workTypeCategories][row];
    }else if (pickerView.tag == 2)
    {
        self.workDivideTextField.text = [self workDivideCategories][row];
    }
    
}

#pragma mark - Work Types

- (NSArray *)workTypeCategories
{
    return @[@"Homework", @"Essays", @"Projects", @"Tests", @"Chores", @"Practice/Exercise", @"Other"];
}

#pragma mark - Work Divide Types

- (NSArray *)workDivideCategories
{
    return @[@"Hourly", @"Daily", @"Weekly", @"Monthly"];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"homeworkEntry"])
    {
        HomeworkEntryViewController *hwVC = segue.destinationViewController;
        hwVC.entry = self.entry;
    }else if([segue.identifier isEqualToString:@"essaysEntry"])
    {
        EssaysEntryViewController *essayVC = segue.destinationViewController;
        essayVC.entry = self.entry;
    }else if([segue.identifier isEqualToString:@"projectsEntry"])
    {
        ProjectEntryViewController *projectVC = segue.destinationViewController;
        projectVC.entry = self.entry;
    }else if([segue.identifier isEqualToString:@"testsEntry"])
    {
        TestsEntryViewController *testsVC = segue.destinationViewController;
        testsVC.entry = self.entry;
    }else if([segue.identifier isEqualToString:@"choresEntry"])
    {
        ChoresEntryViewController *choresVC = segue.destinationViewController;
        choresVC.entry = self.entry;
    }else if([segue.identifier isEqualToString:@"practiceDailyEntry"] || [segue.identifier isEqualToString:@"practiceWeeklyEntry"] || [segue.identifier isEqualToString:@"practiceMonthlyEntry"])
    {
        PracticeEntryViewController *practiceVC = segue.destinationViewController;
        practiceVC.entry = self.entry;
        
    }else if([segue.identifier isEqualToString:@"otherEntry"])
    {
        OtherEntryViewController *otherVC = segue.destinationViewController;
        otherVC.entry = self.entry;
    }
}

-(void)dealloc {
    NSLog(@"Deallocated %@!", self);
}

@end
