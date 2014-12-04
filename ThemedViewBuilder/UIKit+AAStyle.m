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
aa_applyStyle:(AAStyle *)style
{
	self.backgroundColor = style.backgroundColor;
	self.tintColor = style.tintColor;
	
	self.hidden = style.hidden;
	self.alpha = style.alpha;
	
	self.layer.borderColor = style.borderColor.CGColor;
	self.layer.borderWidth = style.borderWidth;
	self.layer.cornerRadius = style.cornerRadius;
	self.layer.masksToBounds = style.masksToBounds;
}

@end

@implementation UILabel (AAStyle)

- (void)
aa_applyStyle:(AAStyle *)style
{
	[super aa_applyStyle:style];
	
	self.textColor = style.foregroundColor;
	self.shadowColor = style.textShadowColor;
	self.shadowOffset = style.textShadowOffset;
	
	self.font = style.font;
	self.textAlignment = style.textAlignment;
}

@end

@implementation UIButton (AAStyle)

- (void)
aa_applyStyle:(AAStyle *)style
{
	[super aa_applyStyle:style];
	
	[self setTitleColor:style.foregroundColor forState:UIControlStateNormal];
	[self setTitleShadowColor:style.textShadowColor forState:UIControlStateNormal];
	
	self.titleLabel.shadowOffset = style.textShadowOffset;
	self.titleLabel.font = style.font;
	self.titleLabel.textAlignment = style.textAlignment;
}

@end

@implementation UITextField (AAStyle)

- (void)
aa_applyStyle:(AAStyle *)style
{
	[super aa_applyStyle:style];
	
	self.font = style.font;
	self.textAlignment = style.textAlignment;
	self.textColor = style.foregroundColor;
}

@end

