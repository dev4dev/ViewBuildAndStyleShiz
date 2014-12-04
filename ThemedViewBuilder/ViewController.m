//
//  ViewController.m
//  ThemedViewBuilder
//
//  Created by Alex Antonyuk on 11/27/14.
//  Copyright (c) 2014 Alex Antonyuk. All rights reserved.
//

#import "ViewController.h"
#import "ThemedViewBuilder.h"
#import <Masonry/Masonry.h>
#import "AAStyle.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	
	[[ThemedViewBuilder sharedBuilder] addViewConstructor:@"Header" constructor:^UIView *(NSDictionary *userInfo) {
		UILabel *label = [UILabel new];
		label.text = [userInfo[@"text"] uppercaseString];
		label.textColor = [UIColor blackColor];
		label.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
		return label;
	}];
	
	ThemeConfiguration *theme = [ThemeConfiguration make:^(ThemeConfiguration *theme) {
		theme.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
		theme.textColor = [UIColor darkGrayColor];
	}];
	
	[[ThemedViewBuilder sharedBuilder] addViewConstructor:@"Body" forViewClass:[UILabel class] withTheme:theme];
	
	[[ThemedViewBuilder sharedBuilder] addViewConstructor:@"Box" forViewClass:[UIView class] withThemeBlock:^(ThemeConfiguration *theme) {
		theme.borderColor = [UIColor orangeColor];
		theme.borderWidth = 1.0;
	
		theme.backgroundColor = [UIColor lightGrayColor];
		theme.cornerRadius = 5.0;
	}];
}

- (void)
viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
	
	UILabel *label = (UILabel *)[[ThemedViewBuilder sharedBuilder] buildView:@"Header" userInfo:@{@"text": @"trololo"}];
	[self.view addSubview:label];
	[label mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.top.equalTo(@20);
	}];
	
	UILabel *body = (UILabel *)[[ThemedViewBuilder sharedBuilder] buildView:@"Body" userInfo:@{@"text": @"Lorem Ipsum", @"lala": @"lol"}];
	[self.view addSubview:body];
	[body mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(@20);
		make.top.equalTo(label.mas_bottom).offset(10);
	}];
	
	ThemeConfiguration *orange = [ThemeConfiguration make:^(ThemeConfiguration *theme) {
		theme.textColor = [UIColor orangeColor];
	}];
	
	UILabel *body2 = BuildViewWithData(@"Body", @{@"text": @"FORK DAT!!11"});
	[orange applyThemeToView:body2];
	[self.view addSubview:body2];
	[body2 mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(@20);
		make.top.equalTo(body.mas_bottom).offset(10);
	}];
	
	[[AAStyle make:^(AAStyle *style) {
		style.font = [UIFont fontWithName:@"Georgia" size:36];
		style.foregroundColor = [UIColor orangeColor];
	}] applyStyleToView:body2];
	
	UIView *box = BuildView(@"Box");
	[self.view addSubview:box];
	[box mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(@10);
		make.right.equalTo(@-10);
		make.top.equalTo(body2.mas_bottom).offset(20);
		make.height.equalTo(@20);
	}];
	
	[[AAStyle make:^(AAStyle *style) {
		style.borderColor = [UIColor purpleColor];
		style.borderWidth = 7;
		style.cornerRadius = 10;
	}] applyStyleToView:box];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
