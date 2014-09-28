//
//  PSRColorSelectorDelegate.h
//  SimpleNotes
//
//  Created by M on 26.09.14.
//  Copyright (c) 2014 Daniil Korotin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PSRColorSelectorDelegate <NSObject>

- (void)colorSelected:(UIColor *)newColor;

@optional

- (UIColor *)startColor;

@end
