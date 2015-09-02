//
//  EntryDisplayTableViewCell.h
//  Due-Dates
//
//  Created by Zack Spicer on 9/1/15.
//  Copyright (c) 2015 Dev Mountain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MPCheckBox.h"

@interface EntryDisplayTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *dueDateLabel;
@property (strong, nonatomic) IBOutlet UILabel *workDivideLabel;
@property (strong, nonatomic) IBOutlet UILabel *typeLabel;
@property (strong, nonatomic) IBOutlet MPCheckBox *checkBox;


@end
