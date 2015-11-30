//
//  EntryController.h
//  Journal-C
//
//  Created by James Pacheco on 11/30/15.
//  Copyright © 2015 James Pacheco. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Entry;

@interface EntryController : NSObject

@property (nonatomic, strong) NSMutableArray *entries;

+ (EntryController *)sharedInstance;

- (instancetype)init;

- (void)addEntry:(Entry *)entry;

- (void)removeEntry:(Entry *)entry;

@end
