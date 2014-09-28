//
//  PSRColorSelectorViewController.h
//  SimpleNotes
//
//  Created by M on 26.09.14.
//  Copyright (c) 2014 Daniil Korotin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSRColorSelectorDelegate.h"

@interface PSRColorSelectorViewController : UIViewController

@property (nonatomic, weak) id<PSRColorSelectorDelegate> delegate;

@property (weak, nonatomic) IBOutlet UISlider *sliderRed;
@property (weak, nonatomic) IBOutlet UISlider *sliderGreen;
@property (weak, nonatomic) IBOutlet UISlider *sliderBlue;

- (IBAction)sliderMoved:(UISlider *)sender;

- (IBAction)done:(UIBarButtonItem *)sender;
- (IBAction)cancel:(UIBarButtonItem *)sender;

@end
