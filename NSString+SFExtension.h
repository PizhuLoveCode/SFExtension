//
//  NSString+SFExtension.h
//  CellTest
//
//  Created by hushunfeng on 2017/8/31.
//  Copyright © 2017年 cmcc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (SFExtension)

/**
 获取一段文字的高度

 @param text 字符串
 @param fontSize 字体大小
 @param spacing 行间距
 @param width 单行的最大宽度
 @return 高度、宽度返回
 */
+ (CGSize)getTextHWithText:(NSString *)text FontSize:(int)fontSize lineSpacing:(CGFloat)spacing maxWidthLimit:(CGFloat)width;


/**
 获取属性字符串，用于label

 @param text 字符串
 @param fontSize 字体大小
 @param spacing 行间距
 @param textColor 字体颜色
 @return 属性字符串
 */
+ (NSMutableAttributedString *)getAttributedStringWithText:(NSString *)text fontSize:(int)fontSize lineSpacing:(CGFloat)spacing color:(UIColor *)textColor maxWidthLimit:(CGFloat)width;

@end
