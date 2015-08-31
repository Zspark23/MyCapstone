//
//  ProjectEntryViewController.m
//  Due-Dates
//
//  Created by Zack Spicer on 8/25/15.
//  Copyright (c) 2015 Dev Mountain. All rights reserved.
//

#import "ProjectEntryViewController.h"
#import "Task.h"

@interface ProjectEntryViewController ()

@property (strong, nonatomic) IBOutlet UITableView *tasksTableView;
@property (strong, nonatomic) IBOutlet UITextField *taskTitleTextField;
@property (strong, nonatomic) IBOutlet UITextField *taskPriorityTextField;

@end

@implementation ProjectEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)submitButtonTapped:(id)sender
{
    if (self.entry.tasks.count == 0)
    {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Please Enter Tasks"
                                                                       message:@"You must have at least one task"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }else
    {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

- (IBAction)projectAddButtonTapped:(UIButton *)sender
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

- (IBAction)projectDeleteButtonTapped:(UIButton *)sender
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


- (IBAction)projectTaskPriorityEditingDidChange:(UITextField *)sender
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

- (NSArray *)reversedArray:(NSArray *)arrayToReverse {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:arrayToReverse.count];
    NSEnumerator *enumerator = [arrayToReverse reverseObjectEnumerator];
    for (id element in enumerator) {
        [array addObject:element];
    }
    return array;
}

@end
