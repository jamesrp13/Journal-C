//
//  EntryDetailViewController.m
//  Journal-C
//
//  Created by James Pacheco on 11/30/15.
//  Copyright © 2015 James Pacheco. All rights reserved.
//

#import "EntryDetailViewController.h"
#import "Entry.h"
#import "EntryController.h"


@interface EntryDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;

@property (weak, nonatomic) IBOutlet UITextView *bodyTextView;

@end

@implementation EntryDetailViewController

- (IBAction)saveButtonTapped:(id)sender {
    if (self.entry != NULL) {
        self.entry.title = self.titleTextField.text;
        self.entry.bodyText = self.bodyTextView.text;
    } else {
        Entry *entry = [[Entry alloc] initWithTitle:self.titleTextField.text bodyText:self.bodyTextView.text timeStamp:[[NSDate alloc] init]];
        [[EntryController sharedInstance] addEntry:entry];
    }
    [self.navigationController popViewControllerAnimated:true];
}

- (IBAction)clearButtonTapped:(id)sender {
    self.titleTextField.text = @"";
    self.bodyTextView.text = @"";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.entry) {
        [self updateWithEntry:self.entry];
    }
}

- (void)updateWithEntry:(Entry *)entry
{
    self.titleTextField.text = entry.title;
    self.bodyTextView.text = entry.bodyText;
}

- (void)setEntry:(Entry *)entry
{
    _entry = entry;
    [self updateWithEntry:entry];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.titleTextField resignFirstResponder];
    return true;
}

@end
