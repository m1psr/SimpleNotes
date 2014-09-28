//
//  PSRDetailViewController.h
//  SimpleNotes
//
//  Created by Daniil Korotin on 24.04.14.
//  Copyright (c) 2014 Daniil Korotin. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PSRNote.h"
#import "PSRColorSelectorDelegate.h"

@interface PSRDetailViewController : UIViewController <PSRColorSelectorDelegate>

@property (nonatomic, strong) PSRNote *note;
@property (weak, nonatomic) IBOutlet UITextView *noteTextView;

@end
