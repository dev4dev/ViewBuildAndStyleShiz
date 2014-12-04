//
//  UIKit+AAStyle.m
//  ThemedViewBuilder
//
//  Created by Alex Antonyuk on 12/4/14.
//  Copyright (c) 2014 Alex Antonyuk. All rights reserved.
//

#import "UIKit+AAStyle.h"
#import "AAStyle.h"

@implementation UIView (AAStyle)

- (void)
aa_applyStyle:(AAStyle *)theme
{
	self.backgroundColor = theme.backgroundColor;
	self.tintColor = theme.tintColor;
	
	self.hidden = theme.hidden;
	self.alpha = theme.alpha;
	
	self.layer.borderColor = theme.borderColor.CGColor;
	self.layer.borderWidth = theme.borderWidth;
	self.layer.cornerRadius = theme.cornerRadius;
}

@end

@implementation UILabel (AAStyle)

- (void)
aa_applyStyle:(AAStyle *)theme
{
	[super aa_applyStyle:theme];
	
	self.textColor = theme.foregroundColor;
	self.shadowColor = theme.textShadowColor;
	self.shadowOffset = theme.textShadowOffset;
	
	self.font = theme.font;
	self.textAlignment = theme.textAlignment;
}

@end

@implementation UIButton (AAStyle)

- (void)
aa_applyStyle:(AAStyle *)theme
{
	[super aa_applyStyle:theme];
	
	[self setTitleColor:theme.foregroundColor forState:UIControlStateNormal];
	[self setTitleShadowColor:theme.textShadowColor forState:UIControlStateNormal];
	
	self.titleLabel.shadowOffset = theme.textShadowOffset;
	self.titleLabel.font = theme.font;
	self.titleLabel.textAlignment = theme.textAlignment;
}

@end

@implementation UITextField (AAStyle)

- (void)
aa_applyStyle:(AAStyle *)theme
{
	[super aa_applyStyle:theme];
	
	self.font = theme.font;
	self.textAlignment = theme.textAlignment;
	self.textColor = theme.foregroundColor;
}

@end

