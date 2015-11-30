//
//  EntryController.m
//  Journal-C
//
//  Created by James Pacheco on 11/30/15.
//  Copyright © 2015 James Pacheco. All rights reserved.
//

#import "EntryController.h"
#import "Entry.h"

@implementation EntryController

+ (EntryController *)sharedInstance
{
    static EntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[EntryController alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.entries = [[NSMutableArray alloc] init];
        [self loadFromPersistentStorage];
    }
    return self;
}

- (void)addEntry:(Entry *)entry
{
    [self.entries addObject:entry];
    [self saveToPersistentStorage];
}

- (void)removeEntry:(Entry *)entry
{
    [self.entries removeObject:entry];
    [self saveToPersistentStorage];
}

- (void)saveToPersistentStorage
{
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.entries];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"entries"];
}

- (void)loadFromPersistentStorage
{
    
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"entries"];
    NSMutableArray *entries =[NSKeyedUnarchiver unarchiveObjectWithData:data];
    if (entries != NULL) {
        self.entries = entries;
    } else {
        self.entries = [[NSMutableArray alloc] init];
    }
    
}

@end