//
//  NSString+SFExtension.m
//  CellTest
//
//  Created by hushunfeng on 2017/8/31.
//  Copyright © 2017年 cmcc. All rights reserved.
//

#import "NSString+SFExtension.h"

@implementation NSString (SFExtension)

+ (CGSize)getTextHWithText:(NSString *)text FontSize:(int)fontSize lineSpacing:(CGFloat)spacing maxWidthLimit:(CGFloat)width {
    //先判断是否需要多行
    CGSize size = [text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]}];
    if (size.width <= width) {//单行里可以实现
        return size;
    }
    else {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = spacing;
        
        CGRect textSize = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize],NSParagraphStyleAttributeName:paragraphStyle} context:nil];
        return textSize.size;
    }
}


+ (NSMutableAttributedString *)getAttributedStringWithText:(NSString *)text fontSize:(int)fontSize lineSpacing:(CGFloat)spacing color:(UIColor *)textColor maxWidthLimit:(CGFloat)width{
    //这里range默认为整个字符串
    NSRange allRange = [text rangeOfString:text];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    paragraphStyle.lineSpacing = spacing;
    
    CGSize size = [text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]}];
    if (size.width <= width) {//单行里可以实现
        paragraphStyle.lineSpacing = 0;
    }
    
    NSMutableAttributedString *labelStr = [[NSMutableAttributedString alloc] initWithString:text];
    [labelStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fontSize] range:allRange];
    [labelStr addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:allRange];
    [labelStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:allRange];
    
    return labelStr;
}

@end
