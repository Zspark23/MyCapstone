//
//  Entry.h
//  Due-Dates
//
//  Created by Zack Spicer on 8/27/15.
//  Copyright (c) 2015 Dev Mountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Task;

@interface Entry : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSString * workDivideType;
@property (nonatomic, retain) NSNumber * homeworkQuestionsAmount;
@property (nonatomic, retain) NSDate * dueDate;
@property (nonatomic, retain) NSSet *tasks;
@end

@interface Entry (CoreDataGeneratedAccessors)

- (void)addTasksObject:(Task *)value;
- (void)removeTasksObject:(Task *)value;
- (void)addTasks:(NSSet *)values;
- (void)removeTasks:(NSSet *)values;

@end
