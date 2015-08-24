//
//  LabelAndSublabelTableViewCell.h
//  Due-Dates
//
//  Created by Zack Spicer on 8/24/15.
//  Copyright (c) 2015 Dev Mountain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LabelAndSublabelTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *entryTypeLabel;
@property (strong, nonatomic) IBOutlet UILabel *numberOfEntriesLabel;

@end
