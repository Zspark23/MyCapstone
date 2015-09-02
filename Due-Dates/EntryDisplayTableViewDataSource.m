//
//  EntryDisplayTableViewDataSource.m
//  Due-Dates
//
//  Created by Zack Spicer on 9/1/15.
//  Copyright (c) 2015 Dev Mountain. All rights reserved.
//

#import "EntryDisplayTableViewDataSource.h"
#import "EntryDisplayTableViewCell.h"
#import "EntryController.h"
#import "Entry.h"

static NSString *cellID = @"entryCell";

@implementation EntryDisplayTableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    EntryDisplayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    Entry *entry;
    
    switch (tableView.tag)
    {
        case 1:
            entry = [[[EntryController sharedInstance] homeworkEntries] objectAtIndex:indexPath.row];
            break;
        case 2:
            entry = [[[EntryController sharedInstance] essaysEntries] objectAtIndex:indexPath.row];
            break;
        case 3:
            entry = [[[EntryController sharedInstance] projectsEntries] objectAtIndex:indexPath.row];
            break;
        case 4:
            entry = [[[EntryController sharedInstance] testsEntries] objectAtIndex:indexPath.row];
            break;
        case 5:
            entry = [[[EntryController sharedInstance] choresEntries] objectAtIndex:indexPath.row];
            break;
        case 6:
            entry = [[[EntryController sharedInstance] practiceEntries] objectAtIndex:indexPath.row];
            break;
        case 7:
            entry = [[[EntryController sharedInstance] otherEntries] objectAtIndex:indexPath.row];
            break;
            
        default:
            break;
    }
    
    cell.titleLabel.text = entry.title;
    cell.dueDateLabel.text = [NSString stringWithFormat:@"%@", entry.dueDate];
    cell.workDivideLabel.text = entry.workDivideType;
    cell.typeLabel.text = entry.type;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (tableView.tag)
    {
        case 1:
            return [[EntryController sharedInstance] homeworkEntries].count;
            break;
        case 2:
            return [[EntryController sharedInstance] essaysEntries].count;
            break;
        case 3:
            return [[EntryController sharedInstance] projectsEntries].count;
            break;
        case 4:
            return [[EntryController sharedInstance] testsEntries].count;
            break;
        case 5:
            return [[EntryController sharedInstance] choresEntries].count;
            break;
        case 6:
            return [[EntryController sharedInstance] practiceEntries].count;
            break;
        case 7:
            return [[EntryController sharedInstance] otherEntries].count;
            break;
        default:
            break;
    }
    return 0;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        switch (tableView.tag)
        {
            case 1:
                [[EntryController sharedInstance] deleteEntry:[[[EntryController sharedInstance] homeworkEntries] objectAtIndex:indexPath.row]];
                
                [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
                [[EntryController sharedInstance] save];
                break;
            case 2:
                [[EntryController sharedInstance] deleteEntry:[[[EntryController sharedInstance] essaysEntries] objectAtIndex:indexPath.row]];
                
                [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
                [[EntryController sharedInstance] save];
                break;
            case 3:
                [[EntryController sharedInstance] deleteEntry:[[[EntryController sharedInstance] projectsEntries] objectAtIndex:indexPath.row]];
                
                [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
                [[EntryController sharedInstance] save];
                break;
            case 4:
                [[EntryController sharedInstance] deleteEntry:[[[EntryController sharedInstance] testsEntries] objectAtIndex:indexPath.row]];
                
                [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
                [[EntryController sharedInstance] save];
                break;
            case 5:
                [[EntryController sharedInstance] deleteEntry:[[[EntryController sharedInstance] choresEntries] objectAtIndex:indexPath.row]];
                
                [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
                [[EntryController sharedInstance] save];
                break;
            case 6:
                [[EntryController sharedInstance] deleteEntry:[[[EntryController sharedInstance] practiceEntries] objectAtIndex:indexPath.row]];
                
                [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
                [[EntryController sharedInstance] save];
                break;
            case 7:
                [[EntryController sharedInstance] deleteEntry:[[[EntryController sharedInstance] otherEntries] objectAtIndex:indexPath.row]];
                
                [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
                [[EntryController sharedInstance] save];
                break;
                
            default:
                break;
        }
    }
}

@end
