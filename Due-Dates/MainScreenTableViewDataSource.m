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
#import "EntryController.h"

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
            case MainScreenTableViewRowNameHomework: // Homework Row
                cell.entryTypeLabel.text = @"Homework";
                if ([[EntryController sharedInstance] homeworkEntries].count == 1) {
                    cell.numberOfEntriesLabel.text = [NSString stringWithFormat:@"%lu Entry", (unsigned long)[[EntryController sharedInstance] homeworkEntries].count];
                }else
                {
                    cell.numberOfEntriesLabel.text = [NSString stringWithFormat:@"%lu Entries", (unsigned long)[[EntryController sharedInstance] homeworkEntries].count];
                }
                break;
                
            case MainScreenTableViewRowNameEssays: // Essays Row
                cell.entryTypeLabel.text = @"Essays";
                if ([[EntryController sharedInstance] essaysEntries].count == 1) {
                    cell.numberOfEntriesLabel.text = [NSString stringWithFormat:@"%lu Entry", (unsigned long)[[EntryController sharedInstance] essaysEntries].count];
                }else
                {
                    cell.numberOfEntriesLabel.text = [NSString stringWithFormat:@"%lu Entries", (unsigned long)[[EntryController sharedInstance] essaysEntries].count];
                }
                break;
                
            case MainScreenTableViewRowNameProjects: // Projects Row
                cell.entryTypeLabel.text = @"Projects";
                if ([[EntryController sharedInstance] projectsEntries].count == 1) {
                    cell.numberOfEntriesLabel.text = [NSString stringWithFormat:@"%lu Entry", (unsigned long)[[EntryController sharedInstance] projectsEntries].count];
                }else
                {
                    cell.numberOfEntriesLabel.text = [NSString stringWithFormat:@"%lu Entries", (unsigned long)[[EntryController sharedInstance] projectsEntries].count];
                }
                break;
                
            case MainScreenTableViewRowNameTests: // Tests Row
                cell.entryTypeLabel.text = @"Tests";
                if ([[EntryController sharedInstance] testsEntries].count == 1) {
                    cell.numberOfEntriesLabel.text = [NSString stringWithFormat:@"%lu Entry", (unsigned long)[[EntryController sharedInstance] testsEntries].count];
                }else
                {
                    cell.numberOfEntriesLabel.text = [NSString stringWithFormat:@"%lu Entries", (unsigned long)[[EntryController sharedInstance] testsEntries].count];
                }
                break;
                
            case MainScreenTableViewRowNameChores: // Chores Row
                cell.entryTypeLabel.text = @"Chores";
                if ([[EntryController sharedInstance] choresEntries].count == 1) {
                    cell.numberOfEntriesLabel.text = [NSString stringWithFormat:@"%lu Entry", (unsigned long)[[EntryController sharedInstance] choresEntries].count];
                }else
                {
                    cell.numberOfEntriesLabel.text = [NSString stringWithFormat:@"%lu Entries", (unsigned long)[[EntryController sharedInstance] choresEntries].count];
                }
                break;
                
            case MainScreenTableViewRowNamePractice: // Practice/Exercise Row
                cell.entryTypeLabel.text = @"Practice/Exercise";
                if ([[EntryController sharedInstance] practiceEntries].count == 1) {
                    cell.numberOfEntriesLabel.text = [NSString stringWithFormat:@"%lu Entry", (unsigned long)[[EntryController sharedInstance] practiceEntries].count];
                }else
                {
                    cell.numberOfEntriesLabel.text = [NSString stringWithFormat:@"%lu Entries", (unsigned long)[[EntryController sharedInstance] practiceEntries].count];
                }
                break;
                
            case MainScreenTableViewRowNameOther: // Other Row
                cell.entryTypeLabel.text = @"Other";
                if ([[EntryController sharedInstance] otherEntries].count == 1) {
                    cell.numberOfEntriesLabel.text = [NSString stringWithFormat:@"%lu Entry", (unsigned long)[[EntryController sharedInstance] otherEntries].count];
                }else
                {
                    cell.numberOfEntriesLabel.text = [NSString stringWithFormat:@"%lu Entries", (unsigned long)[[EntryController sharedInstance] otherEntries].count];
                }
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
