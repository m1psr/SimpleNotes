//
//  PSRMasterViewController.m
//  SimpleNotes
//
//  Created by Daniil Korotin on 24.04.14.
//  Copyright (c) 2014 Daniil Korotin. All rights reserved.
//

#import "PSRMasterViewController.h"
#import "PSRNoteManager.h"
#import "PSRDetailViewController.h"

@interface PSRMasterViewController ()

@end

@implementation PSRMasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.view addSubview:self.tableView];
    self.navigationItem.title = @"Notes";
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNote)];
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)addNote {
    PSRNote *note = [[PSRNote alloc] init];
    [[PSRNoteManager sharedManager] addOrUpdateNote:note];
    [self.tableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[PSRDetailViewController class]]) {
        PSRDetailViewController *dVK = (PSRDetailViewController *)segue.destinationViewController;
        dVK.note = sender;
    }
}

#pragma mark - UITableView delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[PSRNoteManager sharedManager] notes] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    PSRNote *note = [[[PSRNoteManager sharedManager] notes] objectAtIndex:indexPath.row];
    
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:note.text];
    [attributedText addAttribute:NSForegroundColorAttributeName value:note.fontColor range:NSMakeRange(0, attributedText.length)]; // add color
    if (note.font) {
        [attributedText addAttribute:NSFontAttributeName value:note.font range:NSMakeRange(0, attributedText.length)]; // add font
    }
    cell.textLabel.attributedText = attributedText;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PSRNote *note = [[[PSRNoteManager sharedManager] notes] objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"masterDetailSegue" sender:note];
}

@end
