//
//  ThemeConfiguration.h
//  ThemedViewBuilder
//
//  Created by Alex Antonyuk on 11/27/14.
//  Copyright (c) 2014 Alex Antonyuk. All rights reserved.
//

@import UIKit;

@class ThemeConfiguration;

typedef void(^ThemeConfigurationBlock)(ThemeConfiguration *theme);

@interface ThemeConfiguration : NSObject

@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, strong) UIFont *font;

@property (nonatomic, strong) UIColor *borderColor;
@property (nonatomic, assign) CGFloat borderWidth;
@property (nonatomic, assign) CGFloat cornerRadius;

- (void)applyThemeToView:(UIView *)view;

+ (instancetype)make:(ThemeConfigurationBlock)configuration;

@end
