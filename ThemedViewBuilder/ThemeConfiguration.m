//
//  ThemeConfiguration.m
//  ThemedViewBuilder
//
//  Created by Alex Antonyuk on 11/27/14.
//  Copyright (c) 2014 Alex Antonyuk. All rights reserved.
//

#import "ThemeConfiguration.h"

@implementation ThemeConfiguration

+ (NSArray *)
properties
{
	return @[@"textColor", @"backgroundColor", @"font"];
}

+ (NSArray *)
layerProperties
{
	return @[@"borderColor", @"borderWidth", @"cornerRadius"];
}

- (void)applyThemeToView:(UIView *)view
{
	[[[self class] properties] enumerateObjectsUsingBlock:^(NSString *property, NSUInteger idx, BOOL *stop) {
		id localPropertyValue = [self valueForKey:property];
		if (localPropertyValue && [view respondsToSelector:NSSelectorFromString(property)] ) {
			[view setValue:localPropertyValue forKeyPath:property];
		}
	}];
	
	[[[self class] layerProperties] enumerateObjectsUsingBlock:^(NSString *property, NSUInteger idx, BOOL *stop) {
		id localPropertyValue = [self valueForKey:property];
		if (localPropertyValue && [view.layer respondsToSelector:NSSelectorFromString(property)]) {
			if ([localPropertyValue isKindOfClass:[UIColor class]]) {
				[view.layer setValue:(__bridge id)((UIColor *)localPropertyValue).CGColor forKeyPath:property];
			} else {
				[view.layer setValue:localPropertyValue forKeyPath:property];
			}
		}
	}];
}

+ (instancetype)
make:(ThemeConfigurationBlock)configuration
{
	ThemeConfiguration *theme = [ThemeConfiguration new];
	if (configuration) {
		configuration(theme);
	}
	
	return theme;
}


@end
