//
//  UIKit+AAStyle.h
//  ThemedViewBuilder
//
//  Created by Alex Antonyuk on 12/4/14.
//  Copyright (c) 2014 Alex Antonyuk. All rights reserved.
//

@import UIKit;
@class AAStyle;

@interface UIView (AAStyle)

- (void)aa_applyStyle:(AAStyle *)theme;

@end

@interface UILabel (AAStyle)

@end

@interface UIButton (AAStyle)

@end

@interface UITextField (AAStyle)

@end
