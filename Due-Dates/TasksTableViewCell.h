//
//  TasksTableViewCell.h
//  Due-Dates
//
//  Created by Zack Spicer on 8/29/15.
//  Copyright (c) 2015 Dev Mountain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TasksTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *taskTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *taskPriorityLabel;
    
@end
