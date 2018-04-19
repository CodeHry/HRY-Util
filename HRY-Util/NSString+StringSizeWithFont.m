//
//  NSString+StringSizeWithFont.m
//  Common
//
//  Created by Ruyi Huang on 15/8/10.
//  Copyright (c) 2015年 com.zjy.mobile. All rights reserved.
//

#import "NSString+StringSizeWithFont.h"

@implementation NSString (StringSizeWithFont)
- (CGSize) sizeWithFont:(UIFont *)fontToUse
{
    if ([self respondsToSelector:@selector(sizeWithAttributes:)])
    {
        NSDictionary* attribs = @{NSFontAttributeName:fontToUse};
        return ([self sizeWithAttributes:attribs]);
    }
    return ([self sizeWithFont:fontToUse]);
}
@end
