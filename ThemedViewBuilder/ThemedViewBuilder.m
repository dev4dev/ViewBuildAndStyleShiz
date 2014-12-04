//
//  ThemedViewBuilder.m
//  ThemedViewBuilder
//
//  Created by Alex Antonyuk on 11/27/14.
//  Copyright (c) 2014 Alex Antonyuk. All rights reserved.
//

#import "ThemedViewBuilder.h"

@interface ThemedViewBuilder ()

@property (nonatomic, strong) NSMutableDictionary *constructors;

@end

@implementation ThemedViewBuilder

+ (instancetype)
sharedBuilder
{
	static dispatch_once_t once;
	static ThemedViewBuilder *instance;
	dispatch_once(&once, ^ {
		instance = [[ThemedViewBuilder alloc] init];
	});
	return instance;
}

- (instancetype)
init
{
	if (self = [super init]) {
		_constructors = [NSMutableDictionary dictionary];
	}
	
	return self;
}

- (void)
addViewConstructor:(NSString *)name constructor:(ConstructorBlock)constructor
{
	if (name && constructor) {
		self.constructors[name] = constructor;
	}
}

- (void)
addViewConstructor:(NSString *)name forViewClass:(Class)viewClass withTheme:(ThemeConfiguration *)theme
{
	if (![viewClass isSubclassOfClass:[UIView class]]) {
		return;
	}
	
	ConstructorBlock builder = ^UIView*(NSDictionary *userInfo) {
		UIView *view = [viewClass new];
		
		[userInfo enumerateKeysAndObjectsUsingBlock:^(NSString *key, id obj, BOOL *stop) {
			if ([view respondsToSelector:NSSelectorFromString(key)]) {
				[view setValue:obj forKeyPath:key];
			}
		}];
		
		[theme applyThemeToView:view];
		
		return view;
	};
	
	self.constructors[name] = builder;
}

- (void)
addViewConstructor:(NSString *)name forViewClass:(Class)viewClass withThemeBlock:(ThemeConfigurationBlock)theme
{
	[self addViewConstructor:name forViewClass:viewClass withTheme:[ThemeConfiguration make:theme]];
}

- (UIView *)
buildView:(NSString *)name
{
	return [self buildView:name userInfo:nil];
}

- (UIView *)
buildView:(NSString *)name userInfo:(NSDictionary *)userInfo
{
	ConstructorBlock buidler = self.constructors[name];
	if (buidler) {
		return buidler(userInfo);
	}
	
	return nil;
}


@end
