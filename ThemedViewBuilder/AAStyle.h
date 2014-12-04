//
//  AAStyle.h
//  ThemedViewBuilder
//
//  Created by Alex Antonyuk on 12/4/14.
//  Copyright (c) 2014 Alex Antonyuk. All rights reserved.
//

@import UIKit;

@class AAStyle;

typedef void (^StyleBuilderBlock)(AAStyle *style);

@interface AAStyle : NSObject

/**
 *  Basic Colors
 */
@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, strong) UIColor *foregroundColor;
@property (nonatomic, strong) UIColor *tintColor;

/**
 *  Text Shadow
 */
@property (nonatomic, strong) UIColor *textShadowColor;
@property (nonatomic, assign) CGSize textShadowOffset;

/**
 *  Visibility
 */
@property (nonatomic, assign) BOOL hidden;
@property (nonatomic, assign) CGFloat alpha;

/**
 *  Typograpgy
 */
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, assign) NSTextAlignment textAlignment;

/**
 *  CALayer Style
 */
@property (nonatomic, strong) UIColor *borderColor;
@property (nonatomic, assign) CGFloat borderWidth;
@property (nonatomic, assign) CGFloat cornerRadius;
@property (nonatomic, assign) BOOL masksToBounds;

/**
 *  Builder
 *
 *  @param block Theme setup block
 *
 *  @return Theme object
 */
+ (instancetype)make:(StyleBuilderBlock)block;

- (void)applyToView:(UIView *)view;

@end
