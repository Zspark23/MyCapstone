//
//  EssaysEntryViewController.h
//  Due-Dates
//
//  Created by Zack Spicer on 8/25/15.
//  Copyright (c) 2015 Dev Mountain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Entry.h"

@interface EssaysEntryViewController : UIViewController <UITableViewDelegate>

@property (nonatomic) Entry *entry;

@end
