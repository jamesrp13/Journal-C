//
//  Entry.m
//  Journal-C
//
//  Created by James Pacheco on 11/30/15.
//  Copyright © 2015 James Pacheco. All rights reserved.
//

#import "Entry.h"

@implementation Entry

-(instancetype)initWithTitle:(NSString *)title bodyText:(NSString *)bodyText timeStamp:(NSDate *)timeStamp
{
    self = [super init];
    if (self) {
        self.title = title;
        self.bodyText = bodyText;
        self.timeStamp = [[NSDate alloc] init];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.bodyText = [aDecoder decodeObjectForKey:@"bodyText"];
        self.timeStamp = [aDecoder decodeObjectForKey:@"timeStamp"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.bodyText forKey:@"bodyText"];
    [aCoder encodeObject:self.timeStamp forKey:@"timeStamp"];
}

@end
