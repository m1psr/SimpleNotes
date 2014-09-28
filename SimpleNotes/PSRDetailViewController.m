//
//  PSRDetailViewController.m
//  SimpleNotes
//
//  Created by Daniil Korotin on 24.04.14.
//  Copyright (c) 2014 Daniil Korotin. All rights reserved.
//

#import "PSRDetailViewController.h"
#import "PSRColorSelectorViewController.h"

//@interface PSRDetailViewController ()
//
//@end

@implementation PSRDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = self.note.text;
    
    [self displayDetail];
}

- (void)viewWillDisappear:(BOOL)animated {
    self.note.text = self.noteTextView.text;
    [super viewWillDisappear:animated];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[PSRColorSelectorViewController class]]) {
        PSRColorSelectorViewController *cSVK = (PSRColorSelectorViewController *)segue.destinationViewController;
        cSVK.delegate = self;
    }
}

#pragma mark - Private Methods -

- (void)displayDetail
{
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:self.note.text];
    
//    UIFont *font = [UIFont fontWithName:@"Avenir-Light" size:60];
//    [title addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, title.length)];
    
    
    [attributedText addAttribute:NSForegroundColorAttributeName value:self.note.fontColor range:NSMakeRange(0, attributedText.length)]; // add color

    self.noteTextView.attributedText = attributedText;
}

#pragma mark - PSRColorSelectorDelegate Methods -

- (void)colorSelected:(UIColor *)newColor
{
    self.note.fontColor = newColor;
    [self displayDetail];
}

- (UIColor *)startColor
{
    return self.note.fontColor;
}

@end
