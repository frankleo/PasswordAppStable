//
//  CustomSwitchCell.h
//  PasswordApp070113
//
//  Created by Frank Rivera on 7/1/13.
//  Copyright (c) 2013 Frank Rivera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomSwitchCell : UITableViewCell <UIAlertViewDelegate>
// The UITableViewCell is a delegate of the UIAlertView
// This means the UIAlertView can access methods in the UITableViewCell as long as the conform to the protocol
@property (strong, nonatomic) IBOutlet UILabel *textLabel;
@property (strong, nonatomic) IBOutlet UISwitch *switchButton;
- (IBAction)switchButtonChanged:(id)sender;

@end
