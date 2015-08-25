//
//  EssayWorkDivideTypeTableViewDataSource.m
//  Due-Dates
//
//  Created by Zack Spicer on 8/25/15.
//  Copyright (c) 2015 Dev Mountain. All rights reserved.
//

#import "EssayWorkDivideTypeTableViewDataSource.h"

enum EssayWorkDivideType
{
    EssayWorkDivideTypeWordCount,
    EssayWorkDivideTypeParagraphCount,
    EssayWorkDivideTypePageCount,
    EssayWorkDivideTypeRequirementsList,
    EssayWorkDivideTypeTop
};

static NSString *cellID = @"workDivideTypeCell";

@implementation EssayWorkDivideTypeTableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    switch (indexPath.row)
    {
        case EssayWorkDivideTypeWordCount:
            cell.textLabel.text = @"By Word Count";
            break;
        case EssayWorkDivideTypeParagraphCount:
            cell.textLabel.text = @"By Paragraph Count";
            break;
        case EssayWorkDivideTypePageCount:
            cell.textLabel.text = @"By Page Count";
            break;
        case EssayWorkDivideTypeRequirementsList:
            cell.textLabel.text = @"By List of Requirements in Essay/Paper";
            break;
        default:
            break;
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

@end
