//
//  NewEntryViewController.h
//  Due-Dates
//
//  Created by Zack Spicer on 8/24/15.
//  Copyright (c) 2015 Dev Mountain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Entry.h"

@interface NewEntryViewController : UIViewController <UIPickerViewDelegate>

@property (nonatomic, strong) Entry* entry;

@end
