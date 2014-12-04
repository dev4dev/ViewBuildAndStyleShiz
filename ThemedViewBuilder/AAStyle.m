//
//  AAStyle.m
//  ThemedViewBuilder
//
//  Created by Alex Antonyuk on 12/4/14.
//  Copyright (c) 2014 Alex Antonyuk. All rights reserved.
//

#import "AAStyle.h"
#import "UIKit+AAStyle.h"

@implementation AAStyle

+ (instancetype)
make:(StyleBuilderBlock)block
{
	AAStyle *style = [AAStyle new];
	if (block) {
		block(style);
	}
	return style;
}

- (instancetype)
init
{
	if (self = [super init]) {
		_backgroundColor = [UIColor clearColor];
		_foregroundColor = [UIColor blackColor];
		
		_font = [UIFont systemFontOfSize:17.0];
		_textAlignment = NSTextAlignmentLeft;
		
		_textShadowOffset = CGSizeMake(0.0, -1.0);
		
		_alpha = 1.0;
		_hidden = NO;
		
		_masksToBounds = NO;
	}
	
	return self;
}

- (void)
applyToView:(UIView *)view
{
	[view aa_applyStyle:self];
}

@end
