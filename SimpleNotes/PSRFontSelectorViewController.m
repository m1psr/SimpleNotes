//
//  PSRFontSelectorViewController.m
//  SimpleNotes
//
//  Created by M on 28.09.14.
//  Copyright (c) 2014 Daniil Korotin. All rights reserved.
//

#import "PSRFontSelectorViewController.h"

@implementation PSRFontSelectorViewController
{
    NSString *_fontName;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if ([self.delegate respondsToSelector:@selector(startFontName)]) {
        _fontName = [self.delegate startFontName];
        NSIndexPath *startIndexPath = [self indexPathForFontName:_fontName];
        if (startIndexPath) {
//            [self tableView:self.tableView didSelectRowAtIndexPath:startIndexPath];
            [self.tableView selectRowAtIndexPath:startIndexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
        }
    } else {
        _fontName = nil;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[UIFont familyNames] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"👽 Семейство %@", [[UIFont familyNames] objectAtIndex:section]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[UIFont fontNamesForFamilyName:[[UIFont familyNames] objectAtIndex:section]] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PSRFontSelectorViewControllerCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    NSString *fontName = [self fontNameForIndexPath:indexPath];
    
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:fontName];
    UIFont *font = [UIFont fontWithName:fontName size:[UIFont systemFontSize]];
    [attributedText addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, attributedText.length)]; // add font
    
    cell.textLabel.attributedText = attributedText;
    
//    NSMutableAttributedString *attributedTextDetailed = [[NSMutableAttributedString alloc] initWithString:@"AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz"];
//    [attributedTextDetailed addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, attributedTextDetailed.length)];
//    cell.detailTextLabel.attributedText = attributedTextDetailed;
    
    return cell;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    ;
//}

#pragma mark - IBActions

- (IBAction)cancel:(UIBarButtonItem *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)done:(UIBarButtonItem *)sender
{
    NSString *fontName = [self fontNameForIndexPath:[self.tableView indexPathForSelectedRow]];
    [self.delegate fontSelected:fontName];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Privates Methods

- (NSString *)fontNameForIndexPath:(NSIndexPath *)indexPath
{
    NSString *fontFamily = [[UIFont familyNames] objectAtIndex:indexPath.section];
    NSArray *fontNames = [UIFont fontNamesForFamilyName:fontFamily];
    NSString *fontName = fontNames[indexPath.row];
    
    return fontName;
}

- (NSIndexPath *)indexPathForFontName:(NSString *)targetFontName
{
    NSInteger row, section = 0;
    for (NSString *fontFamilyName in [UIFont familyNames]) {
        row = 0;
        for (NSString *fontName in [UIFont fontNamesForFamilyName:fontFamilyName]) {
            if ([fontName isEqualToString:targetFontName]) {
                return [NSIndexPath indexPathForRow:row inSection:section];
            }
            ++row;
        }
        section++;
    }
    return nil;
}

@end
