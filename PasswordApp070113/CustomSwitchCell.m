//
//  CustomSwitchCell.m
//  PasswordApp070113
//
//  Created by Frank Rivera on 7/1/13.
//  Copyright (c) 2013 Frank Rivera. All rights reserved.
//


#import "CustomSwitchCell.h"

@implementation CustomSwitchCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (IBAction)switchButtonChanged:(UISwitch *)sender {
    
    if (sender.isOn) {
        
        
        UIAlertView *confirmChange = [[UIAlertView alloc]initWithTitle:@"Are you sure?"
                                                               message:@"This will delete all of your data after 8 failed login attempts"
                                                              delegate:self
                                                     cancelButtonTitle:@"Cancel"
                                                     otherButtonTitles:@"Accept", nil];
        confirmChange.delegate = self;
        [confirmChange show];
    }
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        [self.switchButton setOn:NO animated:YES];
    }
    else
    {
        NSLog(@"So, this works");
        
        // the enabling was committed, save to user defaults!
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:@"YES" forKey:@"isSelfDestructEnabled"];
    }
}


@end

