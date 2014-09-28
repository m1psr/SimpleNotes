//
//  PSRDetailViewController.m
//  SimpleNotes
//
//  Created by Daniil Korotin on 24.04.14.
//  Copyright (c) 2014 Daniil Korotin. All rights reserved.
//

#import "PSRDetailViewController.h"
#import "PSRColorSelectorViewController.h"
#import "PSRFontSelectorViewController.h"

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
    } else if ([segue.identifier isEqualToString:@"fontSelectorSegue"]) {
        UINavigationController *nK = (UINavigationController *)segue.destinationViewController;
        PSRFontSelectorViewController *fSVK = (PSRFontSelectorViewController *)nK.topViewController;
        fSVK.delegate = self;
    }
}

#pragma mark - Private Methods -

- (void)displayDetail
{
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:self.note.text];
    [attributedText addAttribute:NSForegroundColorAttributeName value:self.note.fontColor range:NSMakeRange(0, attributedText.length)]; // add color
    if (self.note.font) {
        [attributedText addAttribute:NSFontAttributeName value:self.note.font range:NSMakeRange(0, attributedText.length)]; // add font
    }
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

#pragma mark - PSRFontSelectorDelegate Methods -

- (void)fontSelected:(NSString *)newFontName
{
    if (!newFontName) {
        return;
    }
//    NSLog(@"self.note.fontName.pointSize = %f", self.note.fontName.pointSize);
    self.note.font = [UIFont fontWithName:newFontName size:[UIFont systemFontSize]]; // ???: self.note.fontName.pointSize
    [self displayDetail];
}

- (NSString *)startFontName
{
    if (self.note.font) {
        return [self.note.font fontName];
    }
    return [[self.noteTextView font] fontName];
}

@end
