//
//  PSRNote.m
//  SimpleNotes
//
//  Created by Daniil Korotin on 24.04.14.
//  Copyright (c) 2014 Daniil Korotin. All rights reserved.
//

#import "PSRNote.h"

@implementation PSRNote

- (id)init {
    self = [super init];
    
    if (self) {
        _text = @"New note";
        _date = [NSDate date];
        _fontColor = [UIColor blackColor];
        _font = nil;
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:_text forKey:@"text"];
    [coder encodeObject:_date forKey:@"date"];
    [coder encodeObject:_fontColor forKey:@"fontColor"];
    [coder encodeObject:_font forKey:@"font"];
}    

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    
    if (self) {
        _text = [decoder decodeObjectForKey:@"text"];
        _date = [decoder decodeObjectForKey:@"date"];
        _fontColor = [decoder decodeObjectForKey:@"fontColor"];
        _font = [decoder decodeObjectForKey:@"font"];
    }
    
    return self; 
}

@end
