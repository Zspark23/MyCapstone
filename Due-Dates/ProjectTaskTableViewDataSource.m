//
//  ProjectTaskTableViewDataSource.m
//  Due-Dates
//
//  Created by Zack Spicer on 8/31/15.
//  Copyright (c) 2015 Dev Mountain. All rights reserved.
//

#import "ProjectTaskTableViewDataSource.h"
#import "TasksTableViewCell.h"
#import "Entry.h"
#import "EntryController.h"
#import "Task.h"

static NSString *cellID = @"taskCell";

@implementation ProjectTaskTableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TasksTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    Entry *entry = [[EntryController sharedInstance] projectsEntries].lastObject;
    
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
    Entry *entry = [[EntryController sharedInstance] projectsEntries].lastObject;
    return entry.tasks.count;
}

@end
