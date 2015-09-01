//
//  Task.h
//  Due-Dates
//
//  Created by Zack Spicer on 8/27/15.
//  Copyright (c) 2015 Dev Mountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Entry;

@interface Task : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * priority;
@property (nonatomic, retain) Entry *entry;

@end
