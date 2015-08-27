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
@property (strong, nonatomic) IBOutlet UIView *workTypePickerView;
@property (strong, nonatomic) IBOutlet UIView *workDividePickerView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *bottomLayoutConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *otherBottomLayoutConstraint;

@end

@implementation NewEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.datePicker.minimumDate = [NSDate date];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(workTypeEditingDidEnd:)];
    [self.view addGestureRecognizer:tap];
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
            [self performSegueWithIdentifier:@"practiceDailyEntry" sender:sender];
        }else if ([self.typeTextField.text isEqualToString:@"Practice/Exercise"] && [self.workDivideTextField.text isEqualToString:@"Weekly"])
            // Practice Weekly
        {
            [self performSegueWithIdentifier:@"practiceWeeklyEntry" sender:sender];
        }else if ([self.typeTextField.text isEqualToString:@"Practice/Exercise"] && [self.workDivideTextField.text isEqualToString:@"Monthly"])
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

#pragma mark - Work Type Text Field Methods

- (IBAction)workTypeEditingDidBegin:(id)sender
{
    [sender resignFirstResponder];
    
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
    [self workTypeEditingDidEnd:self.typeTextField];
}

- (IBAction)doneButtonTapped:(id)sender
{
    [self workTypeEditingDidEnd:self.typeTextField];
}

#pragma mark - Work Divide Text Field Methods

- (IBAction)editingDidBegin:(id)sender
{
    [sender resignFirstResponder];
    
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

- (NSArray *)workTypeCategories
{
    return @[@"Homework", @"Essays", @"Projects", @"Tests", @"Chores", @"Practice/Exercise", @"Other"];
}

- (NSArray *)workDivideCategories
{
    return @[@"Hourly", @"Daily", @"Weekly", @"Monthly"];
}


@end
