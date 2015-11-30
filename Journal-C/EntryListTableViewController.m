//
//  EntryListTableViewController.m
//  Journal-C
//
//  Created by James Pacheco on 11/30/15.
//  Copyright © 2015 James Pacheco. All rights reserved.
//

#import "EntryListTableViewController.h"
#import "EntryController.h"
#import "Entry.h"
#import "EntryDetailViewController.h"

@interface EntryListTableViewController ()

@end

@implementation EntryListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:true];
    [self.tableView reloadData];
}

- (IBAction)addEntryButtonTapped:(id)sender {
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[EntryController sharedInstance] entries] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
    Entry *entry = [[EntryController sharedInstance] entries][indexPath.row];
    cell.textLabel.text = entry.title;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
    cell.detailTextLabel.text = [dateFormatter stringFromDate:entry.timeStamp];
    
    return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row
        Entry *entry = [[EntryController sharedInstance] entries][indexPath.row];
        [[EntryController sharedInstance] removeEntry:entry];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    [tableView reloadData];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toExistingEntry"]) {
        EntryDetailViewController *detailViewController = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Entry *entry = [[EntryController sharedInstance] entries][indexPath.row];
        detailViewController.entry = entry;
    } else {
        EntryDetailViewController *detailViewController = segue.destinationViewController;
        detailViewController.entry = NULL;
    }
}

@end
