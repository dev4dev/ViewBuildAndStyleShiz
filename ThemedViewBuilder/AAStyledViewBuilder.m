//
//  AAStyledViewBuilder.m
//  ThemedViewBuilder
//
//  Created by Alex Antonyuk on 12/5/14.
//  Copyright (c) 2014 Alex Antonyuk. All rights reserved.
//

#import "AAStyledViewBuilder.h"

#import "AAStyle.h"

@interface AAStyledViewBuilder ()

@property (nonatomic, strong) NSMutableDictionary *constructors;

@end

@implementation AAStyledViewBuilder

#pragma mark - Init & Dealloc

+ (instancetype)
sharedBuilder
{
	static dispatch_once_t once;
	static AAStyledViewBuilder *instance;
	dispatch_once(&once, ^ {
		instance = [[AAStyledViewBuilder alloc] init];
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

#pragma mark - Lifecycle (Setup/Update)


#pragma mark - Properties Getters


#pragma mark - Properties Setters


#pragma mark - Public Interface

- (void)
addNamed:(NSString *)name viewConstructor:(ConstructorBlock)block
{
	if (name.length > 0 && block) {
		self.constructors[name] = block;
	}
}

- (void)
addNamed:(NSString *)name viewConstructor:(ConstructorBlock)block withStyle:(AAStyle *)style
{
	if (name.length > 0 && block) {
		ConstructorBlock styledBlock = ^UIView *(NSDictionary *userInfo) {
			UIView *view = block(userInfo);
			[style applyToView:view];
			return view;
		};
		
		[self addNamed:name viewConstructor:styledBlock];
	}
}

- (void)
addNamed:(NSString *)name viewClass:(Class)viewClass withStyle:(AAStyle *)style
{
	if (name.length > 0 && [viewClass isSubclassOfClass:[UIView class]]) {
		ConstructorBlock block = ^UIView *(NSDictionary *userInfo) {
			return [viewClass new];
		};
		[self addNamed:name viewConstructor:block withStyle:style];
	}
}


- (UIView *)
buildView:(NSString *)name
{
	return [self buildView:name userInfo:nil];
}

- (UIView *)
buildView:(NSString *)name userInfo:(NSDictionary *)userInfo
{
	ConstructorBlock block = self.constructors[name];
	
	if (!block) {
		return nil;
	}
	
	UIView *view = block(userInfo);
	
	return view;
}


#pragma mark - Private methods



@end
