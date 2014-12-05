//
//  AAStyledViewBuilder.h
//  ThemedViewBuilder
//
//  Created by Alex Antonyuk on 12/5/14.
//  Copyright (c) 2014 Alex Antonyuk. All rights reserved.
//

@import UIKit;

@class AAStyle;

#define AABuildView(name) (id)[[AAStyledViewBuilder sharedBuilder] buildView:name]
#define AABuildViewWithData(name, data) (id)[[AAStyledViewBuilder sharedBuilder] buildView:name userInfo:data]

typedef UIView *(^ConstructorBlock)(NSDictionary *userInfo);

@interface AAStyledViewBuilder : NSObject

+ (instancetype)sharedBuilder;

/**
 *  Add named constructor which will create, setup and return new view
 *
 *  @param name  Constructor name
 *  @param block View constructor
 */
- (void)addNamed:(NSString *)name viewConstructor:(ConstructorBlock)block;

/**
 *  Add named constructor which will create, setup and apply style to it
 *
 *  @param name  Constructor name
 *  @param block View constructor
 *  @param style View style
 */
- (void)addNamed:(NSString *)name viewConstructor:(ConstructorBlock)block withStyle:(AAStyle *)style;

/**
 *  Add named autoconstructor which will create view of specific class and apply style to it
 *
 *  @param name      Constructor name
 *  @param viewClass View class
 *  @param style     View style
 */
- (void)addNamed:(NSString *)name viewClass:(Class)viewClass withStyle:(AAStyle *)style;

/**
 *  Build view by calling constructor by name
 *
 *  @param name Constructor name
 *
 *  @return View
 */
- (UIView *)buildView:(NSString *)name;

/**
 *  Build view by calling constructor by name and passing user's data
 *
 *  @param name     Contrsuctor name
 *  @param userInfo User data
 *
 *  @return View
 */
- (UIView *)buildView:(NSString *)name userInfo:(NSDictionary *)userInfo;

@end
