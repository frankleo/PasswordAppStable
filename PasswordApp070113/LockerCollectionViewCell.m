//
//  LockerCollectionViewCell.m
//  PasswordApp070113
//
//  Created by Andrew Bennie on 7/3/13.
//  Copyright (c) 2013 Frank Rivera. All rights reserved.
//

#import "LockerCollectionViewCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation LockerCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor colorWithWhite:0.85f alpha:1.0f];
        
        self.layer.borderColor = [UIColor whiteColor].CGColor;
        self.layer.borderWidth = 3.0f;
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowRadius = 3.0f;
        self.layer.shadowOffset = CGSizeMake(0.0f, 2.0f);
        self.layer.shadowOpacity = 0.5f;
        
        self.lockerImage = [[UIImageView alloc] initWithFrame:self.bounds];
        self.lockerImage.contentMode = UIViewContentModeScaleAspectFill;
        self.lockerImage.clipsToBounds = YES;
        
        UIImage* image = [UIImage imageNamed:@"btn_1.png"];
        self.lockerImage.image = image;

        [self.contentView addSubview:self.lockerImage];
        
        NSLog(@"The image is %@", self.lockerImage.image);
   
        
        self.lockerTextLabel = [[UILabel alloc] initWithFrame:self.bounds];
        self.lockerTextLabel.contentMode = UIViewContentModeBottom;
        self.lockerTextLabel.clipsToBounds = YES;
        self.lockerTextLabel.textAlignment = NSTextAlignmentCenter;
        [self.lockerTextLabel setBackgroundColor:[UIColor clearColor]];
        [self.contentView addSubview:self.lockerTextLabel];
    
    }
    return self;
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    
    self.lockerImage.image = nil;
    self.lockerTextLabel.text = nil;

}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
