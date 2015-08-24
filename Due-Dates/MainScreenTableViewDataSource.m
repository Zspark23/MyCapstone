//
//  MainScreenTableViewDataSource.m
//  Due-Dates
//
//  Created by Zack Spicer on 8/24/15.
//  Copyright (c) 2015 Dev Mountain. All rights reserved.
//

#import "MainScreenTableViewDataSource.h"
#import "NewEntryTableViewCell.h"
#import "LabelAndSublabelTableViewCell.h"

enum MainScreenTableViewRowName
{
    MainScreenTableViewRowNameNewEntry,
    MainScreenTableViewRowNameStatistics,
    MainScreenTableViewRowNameHomework,
    MainScreenTableViewRowNameEssays,
    MainScreenTableViewRowNameProjects,
    MainScreenTableViewRowNameTests,
    MainScreenTableViewRowNameChores,
    MainScreenTableViewRowNamePractice,
    MainScreenTableViewRowNameOther,
    MainScreenTableViewRowNameTop
};

@implementation MainScreenTableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == MainScreenTableViewRowNameNewEntry)
    {
        NewEntryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"newEntry"];
        cell.textLabel.text = @"New Entry";
        return cell;
    }else if (indexPath.row == MainScreenTableViewRowNameStatistics)
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"viewStatistics"];
        cell.textLabel.text = @"Statistics";
        return cell;
    }else
    {
        LabelAndSublabelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"viewEntry"];
        
        switch (indexPath.row)
        {
            case MainScreenTableViewRowNameHomework:
                cell.entryTypeLabel.text = @"Homework";
                cell.numberOfEntriesLabel.text = @"2 Entries";
                break;
            case MainScreenTableViewRowNameEssays:
                cell.entryTypeLabel.text = @"Essays";
                cell.numberOfEntriesLabel.text = @"1 Entry";
                break;
            case MainScreenTableViewRowNameProjects:
                cell.entryTypeLabel.text = @"Projects";
                cell.numberOfEntriesLabel.text = @"0 Entries";
                break;
            case MainScreenTableViewRowNameTests:
                cell.entryTypeLabel.text = @"Tests";
                cell.numberOfEntriesLabel.text = @"1 Entry";
                break;
            case MainScreenTableViewRowNameChores:
                cell.entryTypeLabel.text = @"Chores";
                cell.numberOfEntriesLabel.text = @"0 Entries";
                break;
            case MainScreenTableViewRowNamePractice:
                cell.entryTypeLabel.text = @"Practice";
                cell.numberOfEntriesLabel.text = @"4 Entries";
                break;
            case MainScreenTableViewRowNameOther:
                cell.entryTypeLabel.text = @"Other";
                cell.numberOfEntriesLabel.text = @"0 Entries";
                break;
            default:
                break;
        }
        return cell;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return MainScreenTableViewRowNameTop;
}

@end
