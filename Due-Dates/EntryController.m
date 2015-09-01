//
//  EntryController.m
//  Due-Dates
//
//  Created by Zack Spicer on 8/27/15.
//  Copyright (c) 2015 Dev Mountain. All rights reserved.
//

#import "EntryController.h"
#import "Stack.h"

@implementation EntryController

+ (EntryController *)sharedInstance {
    static EntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [EntryController new];
    });
    
    return sharedInstance;
}

// Homework Entries Array
- (NSArray *)homeworkEntries
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Entry"];
    request.predicate = [NSPredicate predicateWithFormat:@"type = %@", @"Homework"];
    
    NSError *error;
    
    NSMutableArray *homeworkEntriesArray = [[[[Stack sharedInstance] managedObjectContext] executeFetchRequest:request error:&error] mutableCopy];
    NSSortDescriptor *dateDescriptor = [NSSortDescriptor
                                        sortDescriptorWithKey:@"dateCreated"
                                        ascending:YES];
    [homeworkEntriesArray sortUsingDescriptors:[NSArray arrayWithObject:dateDescriptor]];
    
    if (error)
    {
        NSLog(@"%@", error.localizedDescription);
    }
    
    return homeworkEntriesArray;
}

// Essays Entries Array
- (NSArray *)essaysEntries
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Entry"];
    request.predicate = [NSPredicate predicateWithFormat:@"type = %@", @"Essays"];
    
    NSError *error;
    
    NSMutableArray *essaysEntriesArray = [[[[Stack sharedInstance] managedObjectContext] executeFetchRequest:request error:&error] mutableCopy];
    NSSortDescriptor *dateDescriptor = [NSSortDescriptor
                                        sortDescriptorWithKey:@"dateCreated"
                                        ascending:YES];
    [essaysEntriesArray sortUsingDescriptors:[NSArray arrayWithObject:dateDescriptor]];
    
    if (error)
    {
        NSLog(@"%@", error.localizedDescription);
    }
    
    return essaysEntriesArray;
}

// Projects Entries Array
- (NSArray *)projectsEntries
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Entry"];
    request.predicate = [NSPredicate predicateWithFormat:@"type = %@", @"Projects"];
    
    NSError *error;
    
    NSMutableArray *projectsEntriesArray = [[[[Stack sharedInstance] managedObjectContext] executeFetchRequest:request error:&error] mutableCopy];
    NSSortDescriptor *dateDescriptor = [NSSortDescriptor
                                        sortDescriptorWithKey:@"dateCreated"
                                        ascending:YES];
    [projectsEntriesArray sortUsingDescriptors:[NSArray arrayWithObject:dateDescriptor]];
    
    if (error)
    {
        NSLog(@"%@", error.localizedDescription);
    }
    
    return projectsEntriesArray;
}

// Tests Entries Array
- (NSArray *)testsEntries
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Entry"];
    request.predicate = [NSPredicate predicateWithFormat:@"type = %@", @"Tests"];
    
    NSError *error;
    
    NSMutableArray *testsEntriesArray = [[[[Stack sharedInstance] managedObjectContext] executeFetchRequest:request error:&error] mutableCopy];
    NSSortDescriptor *dateDescriptor = [NSSortDescriptor
                                        sortDescriptorWithKey:@"dateCreated"
                                        ascending:YES];
    [testsEntriesArray sortUsingDescriptors:[NSArray arrayWithObject:dateDescriptor]];
    
    if (error)
    {
        NSLog(@"%@", error.localizedDescription);
    }
    
    return testsEntriesArray;
}

// Chores Entries Array
- (NSArray *)choresEntries
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Entry"];
    request.predicate = [NSPredicate predicateWithFormat:@"type = %@", @"Chores"];
    
    NSError *error;
    
    NSMutableArray *choresEntriesArray = [[[[Stack sharedInstance] managedObjectContext] executeFetchRequest:request error:&error] mutableCopy];
    
    if (error)
    {
        NSLog(@"%@", error.localizedDescription);
    }
    
    return choresEntriesArray;
}

// Practice Entries Array
- (NSArray *)practiceEntries
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Entry"];
    request.predicate = [NSPredicate predicateWithFormat:@"type = %@", @"Practice/Exercise"];
    
    NSError *error;
    
    NSMutableArray *practiceEntriesArray = [[[[Stack sharedInstance] managedObjectContext] executeFetchRequest:request error:&error] mutableCopy];
    NSSortDescriptor *dateDescriptor = [NSSortDescriptor
                                        sortDescriptorWithKey:@"dateCreated"
                                        ascending:YES];
    [practiceEntriesArray sortUsingDescriptors:[NSArray arrayWithObject:dateDescriptor]];
    
    if (error)
    {
        NSLog(@"%@", error.localizedDescription);
    }
    
    return practiceEntriesArray;
}

// Other Entries Array
- (NSArray *)otherEntries
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Entry"];
    request.predicate = [NSPredicate predicateWithFormat:@"type = %@", @"Other"];
    
    NSError *error;
    
    NSMutableArray *otherEntriesArray = [[[[Stack sharedInstance] managedObjectContext] executeFetchRequest:request error:&error] mutableCopy];
    NSSortDescriptor *dateDescriptor = [NSSortDescriptor
                                        sortDescriptorWithKey:@"dateCreated"
                                        ascending:YES];
    [otherEntriesArray sortUsingDescriptors:[NSArray arrayWithObject:dateDescriptor]];
    
    if (error)
    {
        NSLog(@"%@", error.localizedDescription);
    }
    
    return otherEntriesArray;
}

- (Entry *)createEntry
{
    Entry *entry = [NSEntityDescription insertNewObjectForEntityForName:@"Entry" inManagedObjectContext:[[Stack sharedInstance] managedObjectContext]];
    return entry;
}

- (void)deleteEntry:(Entry *)entry
{
    [entry.managedObjectContext deleteObject:entry];
}

- (void)save
{
    [[[Stack sharedInstance] managedObjectContext] save:nil];
}

@end
