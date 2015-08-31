//
//  EssaysEntryViewController.m
//  Due-Dates
//
//  Created by Zack Spicer on 8/25/15.
//  Copyright (c) 2015 Dev Mountain. All rights reserved.
//

#import "EssaysEntryViewController.h"
#import "EntryController.h"
#import "Task.h"
#import "Stack.h"
#import "TasksTableViewCell.h"

@interface EssaysEntryViewController ()

@property (strong, nonatomic) IBOutlet UITableView *workDivideTableView;
@property (strong, nonatomic) IBOutlet UITableView *tasksTableView;
@property (strong, nonatomic) IBOutlet UITextField *countTextField;
@property (strong, nonatomic) IBOutlet UIButton *deleteButton;
@property (strong, nonatomic) IBOutlet UIButton *addButton;
@property (strong, nonatomic) IBOutlet UILabel *countLabel;
@property (strong, nonatomic) IBOutlet UITextField *taskTitleTextField;
@property (strong, nonatomic) IBOutlet UITextField *taskPriorityTextField;

@end

@implementation EssaysEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.deleteButton.enabled = NO;
    self.deleteButton.backgroundColor = [UIColor grayColor];
    [self.deleteButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    self.addButton.enabled = NO;
    self.addButton.backgroundColor = [UIColor grayColor];
    [self.addButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 3)
    {
        self.deleteButton.enabled = YES;
        self.deleteButton.backgroundColor = [UIColor darkGrayColor];
        [self.deleteButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        
        self.addButton.enabled = YES;
        self.addButton.backgroundColor = [UIColor darkGrayColor];
        [self.addButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        
        self.countLabel.textColor = [UIColor lightGrayColor];
        self.countTextField.enabled = NO;
        
        self.taskTitleTextField.enabled = YES;
        self.taskPriorityTextField.enabled = YES;
    }else
    {
        self.deleteButton.enabled = NO;
        self.deleteButton.backgroundColor = [UIColor grayColor];
        
        self.addButton.enabled = NO;
        self.addButton.backgroundColor = [UIColor grayColor];
        
        self.countLabel.textColor = [UIColor blackColor];
        self.countTextField.enabled = YES;
        
        self.taskPriorityTextField.enabled = NO;
        self.taskTitleTextField.enabled = NO;
    }
}
- (IBAction)submitButtonTapped:(UIButton *)sender
{
    if (self.workDivideTableView.indexPathForSelectedRow == nil)
    {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Please Select a Divide Type"
                                                                       message:@"Please select a work divide type from the list above"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }else if ([self.countTextField.text isEqualToString:@""] && self.workDivideTableView.indexPathForSelectedRow.row != 3)
    {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Enter a Count"
                                                                       message:@"Your must enter a count"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }else if (self.workDivideTableView.indexPathForSelectedRow.row == 3 && self.entry.tasks.count == 0)
    {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Add Tasks"
                                                                       message:@"You must have at least one task"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }else
    {
        [[EntryController sharedInstance] save];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

- (IBAction)addTaskButtonTapped:(UIButton *)sender
{
    if ([self.taskTitleTextField.text isEqualToString:@""] || [self.taskPriorityTextField.text isEqualToString:@""])
    {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Enter a Name and Priority"
                                                                       message:@"You must enter a task name and a priority (1-10)"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }else
    {
        Task *task = [NSEntityDescription insertNewObjectForEntityForName:@"Task" inManagedObjectContext:[self.entry managedObjectContext]];
        task.name = self.taskTitleTextField.text;
        task.priority = [NSNumber numberWithInt:[self.taskPriorityTextField.text intValue]];
        [self.entry addTasksObject:task];
        
        self.taskTitleTextField.text = @"";
        self.taskPriorityTextField.text = @"";
        
        
    }
    
    [self.tasksTableView reloadData];
}

- (IBAction)deleteTaskButtonTapped:(UIButton *)sender
{
    NSIndexPath *indexPath = [self.tasksTableView indexPathForSelectedRow];
    
    NSMutableArray *taskArray = [[self.entry.tasks allObjects] mutableCopy];
    NSSortDescriptor *prioritySorter = [[NSSortDescriptor alloc] initWithKey:@"priority" ascending:YES];
    [taskArray sortUsingDescriptors:[NSArray arrayWithObject:prioritySorter]];
    
    if (indexPath == nil && taskArray.count != 0)
    {
        [self.entry removeTasksObject:taskArray.lastObject];
    }else if (indexPath && taskArray.count != 0)
    {
        [self.entry removeTasksObject:taskArray[indexPath.row]];
    }
    
    [self.tasksTableView reloadData];
}

- (IBAction)priorityTextFieldEditingChanged:(UITextField *)sender
{
    if ([self.taskPriorityTextField.text intValue] > 10 && ![self.taskPriorityTextField.text isEqualToString:@""])
    {
        self.taskPriorityTextField.text = @"10";
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Enter Valid Priority"
                                                                       message:@"Your priority must be between 1 and 10"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }else if ([self.taskPriorityTextField.text intValue] < 0 && ![self.taskPriorityTextField.text isEqualToString:@""])
    {
        self.taskPriorityTextField.text = @"1";
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Enter Valid Priority"
                                                                       message:@"Your priority must be between 1 and 10"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

@end
