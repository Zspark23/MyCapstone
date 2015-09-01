//
//  EssayTasksTableViewDataSource.m
//  Due-Dates
//
//  Created by Zack Spicer on 8/29/15.
//  Copyright (c) 2015 Dev Mountain. All rights reserved.
//

#import "EssayTasksTableViewDataSource.h"
#import "TasksTableViewCell.h"
#import "EntryController.h"
#import "Entry.h"
#import "Task.h"

static NSString *cellID = @"taskCell";

@implementation EssayTasksTableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TasksTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    Entry *entry = [[EntryController sharedInstance] essaysEntries].lastObject;
    
    NSMutableArray *taskArray = [[entry.tasks allObjects] mutableCopy];
    NSSortDescriptor *prioritySorter = [[NSSortDescriptor alloc] initWithKey:@"priority" ascending:YES];
    [taskArray sortUsingDescriptors:[NSArray arrayWithObject:prioritySorter]];
    
    Task *task = taskArray[indexPath.row];
    
    cell.taskTitleLabel.text = task.name;
    cell.taskPriorityLabel.text = [NSString stringWithFormat:@"%@", task.priority];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    Entry *entry = [[EntryController sharedInstance] essaysEntries].lastObject;
    return entry.tasks.count;
}

@end
