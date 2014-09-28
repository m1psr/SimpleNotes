//
//  PSRFontSelectorViewController.h
//  SimpleNotes
//
//  Created by M on 28.09.14.
//  Copyright (c) 2014 Daniil Korotin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSRFontSelectorDelegate.h"

@interface PSRFontSelectorViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) id<PSRFontSelectorDelegate> delegate;

- (IBAction)cancel:(UIBarButtonItem *)sender;
- (IBAction)done:(UIBarButtonItem *)sender;

@end
