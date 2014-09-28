//
//  PSRFontSelectorDelegate.h
//  SimpleNotes
//
//  Created by M on 28.09.14.
//  Copyright (c) 2014 Daniil Korotin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PSRFontSelectorDelegate <NSObject>

- (void)fontSelected:(NSString *)newFontName;

@optional

- (NSString *)startFontName;

@end
