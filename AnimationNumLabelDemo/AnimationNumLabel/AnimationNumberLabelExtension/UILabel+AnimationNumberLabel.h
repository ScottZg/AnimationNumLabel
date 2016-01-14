//
//  UILabel+AnimationNumberLabel.h
//  AnimationNumLabel
//
//  Created by zhanggui on 16/1/14.
//  Copyright © 2016年 zhanggui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (AnimationNumberLabel)

/**
 *  动态增加数字
 *
 *  @param fromNum 起始数字
 *  @param toNum   结束数字
 *  @param float   持续时间
 */
- (void)animationFromNum:(CGFloat)fromNum toNum:(CGFloat)toNum andWithDuration:(CGFloat)time;
/**
 *  通过数字得到要显示的时间
 *
 *  @param num 数字
 *
 *  @return 返回显示时间
 */
- (CGFloat)getTimeDurationFromNum:(CGFloat)num;

@end
