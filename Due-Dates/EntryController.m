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
    
    NSArray *homeworkEntriesArray = [[[Stack sharedInstance] managedObjectContext] executeFetchRequest:request error:&error];
    
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
    
    NSArray *essaysEntriesArray = [[[Stack sharedInstance] managedObjectContext] executeFetchRequest:request error:&error];
    
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
    
    NSArray *essaysEntriesArray = [[[Stack sharedInstance] managedObjectContext] executeFetchRequest:request error:&error];
    
    if (error)
    {
        NSLog(@"%@", error.localizedDescription);
    }
    
    return essaysEntriesArray;
}

// Tests Entries Array
- (NSArray *)testsEntries
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Entry"];
    request.predicate = [NSPredicate predicateWithFormat:@"type = %@", @"Tests"];
    
    NSError *error;
    
    NSArray *essaysEntriesArray = [[[Stack sharedInstance] managedObjectContext] executeFetchRequest:request error:&error];
    
    if (error)
    {
        NSLog(@"%@", error.localizedDescription);
    }
    
    return essaysEntriesArray;
}

// Chores Entries Array
- (NSArray *)choresEntries
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Entry"];
    request.predicate = [NSPredicate predicateWithFormat:@"type = %@", @"Chores"];
    
    NSError *error;
    
    NSArray *essaysEntriesArray = [[[Stack sharedInstance] managedObjectContext] executeFetchRequest:request error:&error];
    
    if (error)
    {
        NSLog(@"%@", error.localizedDescription);
    }
    
    return essaysEntriesArray;
}

// Practice Entries Array
- (NSArray *)practiceEntries
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Entry"];
    request.predicate = [NSPredicate predicateWithFormat:@"type = %@", @"Practice"];
    
    NSError *error;
    
    NSArray *essaysEntriesArray = [[[Stack sharedInstance] managedObjectContext] executeFetchRequest:request error:&error];
    
    if (error)
    {
        NSLog(@"%@", error.localizedDescription);
    }
    
    return essaysEntriesArray;
}

// Other Entries Array
- (NSArray *)otherEntries
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Entry"];
    request.predicate = [NSPredicate predicateWithFormat:@"type = %@", @"Other"];
    
    NSError *error;
    
    NSArray *essaysEntriesArray = [[[Stack sharedInstance] managedObjectContext] executeFetchRequest:request error:&error];
    
    if (error)
    {
        NSLog(@"%@", error.localizedDescription);
    }
    
    return essaysEntriesArray;
}

// All Entries Array
- (NSArray *)allEntries
{
    return @[[self homeworkEntries], [self essaysEntries], [self projectsEntries], [self testsEntries], [self choresEntries], [self practiceEntries], [self otherEntries]];
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
