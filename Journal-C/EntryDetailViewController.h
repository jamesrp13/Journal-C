//
//  EntryDetailViewController.h
//  Journal-C
//
//  Created by James Pacheco on 11/30/15.
//  Copyright © 2015 James Pacheco. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Entry;

@interface EntryDetailViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>

@property (nonatomic, strong) Entry *entry;

- (void)updateWithEntry:(Entry *)entry;

@end
