//
//  PSRColorSelectorViewController.m
//  SimpleNotes
//
//  Created by M on 26.09.14.
//  Copyright (c) 2014 Daniil Korotin. All rights reserved.
//

#import "PSRColorSelectorViewController.h"

@implementation PSRColorSelectorViewController
{
    UIColor *_color;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if ([self.delegate respondsToSelector:@selector(startColor)]) {
        _color = [self.delegate startColor];
    } else {
        _color = [UIColor whiteColor];
    }
    // http://stackoverflow.com/questions/437113/how-to-get-rgb-values-from-uicolor
    CGFloat red = 0.0, green = 0.0, blue = 0.0, alpha =0.0;
    [_color getRed:&red green:&green blue:&blue alpha:&alpha];
    [self setSliderWithR:red G:green B:blue];
}

#pragma mark - IBActions -

- (IBAction)sliderMoved:(UISlider *)sender {
    [self fillBackground];
}

- (IBAction)cancel:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)done:(UIBarButtonItem *)sender {
    [self.delegate colorSelected:_color];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Private Methods -

- (void)fillBackground
{
    _color = [UIColor colorWithRed:self.sliderRed.value / 255.0f
                             green:self.sliderGreen.value / 255.0f
                              blue:self.sliderBlue.value / 255.0f
                             alpha:1.0f];
    self.view.backgroundColor = _color;
}

- (void)setSliderWithR:(float)red G:(float)green B:(float)blue
{
    self.sliderRed.value = red * 255;
    self.sliderGreen.value = green * 255;
    self.sliderBlue.value = blue * 255;
    [self fillBackground];
}

@end
