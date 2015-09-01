//
//  EntryController.h
//  Due-Dates
//
//  Created by Zack Spicer on 8/27/15.
//  Copyright (c) 2015 Dev Mountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"

@interface EntryController : NSObject

@property (nonatomic) NSArray *homeworkEntries;
@property (nonatomic) NSArray *essaysEntries;
@property (nonatomic) NSArray *projectsEntries;
@property (nonatomic) NSArray *testsEntries;
@property (nonatomic) NSArray *choresEntries;
@property (nonatomic) NSArray *practiceEntries;
@property (nonatomic) NSArray *otherEntries;
@property (nonatomic) NSArray *allEntries;


+ (EntryController *)sharedInstance;
- (Entry *)createEntry;
- (void)deleteEntry:(Entry *)entry;
- (void)save;

@end
