//
//  MainScreenTableViewDataSource.m
//  Due-Dates
//
//  Created by Zack Spicer on 8/24/15.
//  Copyright (c) 2015 Dev Mountain. All rights reserved.
//

#import "MainScreenTableViewDataSource.h"
#import "NewEntryTableViewCell.h"

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
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"viewEntry"];
        
        switch (indexPath.row)
        {
            case MainScreenTableViewRowNameHomework:
                cell.textLabel.text = @"Homework";
                break;
            case MainScreenTableViewRowNameEssays:
                cell.textLabel.text = @"Essays";
                break;
            case MainScreenTableViewRowNameProjects:
                cell.textLabel.text = @"Projects";
                break;
            case MainScreenTableViewRowNameTests:
                cell.textLabel.text = @"Tests";
                break;
            case MainScreenTableViewRowNameChores:
                cell.textLabel.text = @"Chores";
                break;
            case MainScreenTableViewRowNamePractice:
                cell.textLabel.text = @"Practice";
                break;
            case MainScreenTableViewRowNameOther:
                cell.textLabel.text = @"Other";
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
