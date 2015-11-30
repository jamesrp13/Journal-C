//
//  Entry.h
//  Journal-C
//
//  Created by James Pacheco on 11/30/15.
//  Copyright © 2015 James Pacheco. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Entry : NSObject <NSCoding>

@property (nonatomic, strong) NSDate *timeStamp;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *bodyText;

- (instancetype)initWithTitle:(NSString *)title bodyText:(NSString *)bodyText timeStamp:(NSDate *)timeStamp;

@end
