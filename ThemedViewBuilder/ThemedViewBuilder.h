//
//  ThemedViewBuilder.h
//  ThemedViewBuilder
//
//  Created by Alex Antonyuk on 11/27/14.
//  Copyright (c) 2014 Alex Antonyuk. All rights reserved.
//

@import UIKit;

#import "ThemeConfiguration.h"

#define BuildView(name) (id)[[ThemedViewBuilder sharedBuilder] buildView:name]
#define BuildViewWithData(name, data) (id)[[ThemedViewBuilder sharedBuilder] buildView:name userInfo:data]

typedef UIView *(^ConstructorBlock)(NSDictionary *userInfo);

@interface ThemedViewBuilder : NSObject

/**
 *  Singleton
 *
 *  @return shared instance
 */
+ (instancetype)sharedBuilder;

- (void)addViewConstructor:(NSString *)name constructor:(ConstructorBlock)constructor;
- (void)addViewConstructor:(NSString *)name forViewClass:(Class)viewClass withTheme:(ThemeConfiguration *)theme;
- (void)addViewConstructor:(NSString *)name forViewClass:(Class)viewClass withThemeBlock:(ThemeConfigurationBlock)theme;

- (UIView *)buildView:(NSString *)name;
- (UIView *)buildView:(NSString *)name userInfo:(NSDictionary *)userInfo;

@end

