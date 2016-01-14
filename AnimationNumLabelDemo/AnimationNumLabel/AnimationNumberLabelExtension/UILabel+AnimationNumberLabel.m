//
//  UILabel+AnimationNumberLabel.m
//  AnimationNumLabel
//
//  Created by zhanggui on 16/1/14.
//  Copyright © 2016年 zhanggui. All rights reserved.
//

#import "UILabel+AnimationNumberLabel.h"

@implementation UILabel (AnimationNumberLabel)

//得到时长
- (CGFloat)getTimeDurationFromNum:(CGFloat)num {
    if (num<=0) {
        return 0;
    }else if (num<1000) {
        return 1;
    }else if (num<2000) {
        return num/1000;
    }else {
        return 2;
    }
}
- (void)animationFromNum:(CGFloat)fromNum toNum:(CGFloat)toNum andWithDuration:(CGFloat)time {
    self.text = [NSString stringWithFormat:@"%0.2f",fromNum];
    
    NSInteger totalCount = [self getCountFromNum:fabs(toNum-fromNum) ];
    //    NSInteger totalCount = toNum - fromNum;
    CGFloat delayTime = time / totalCount;
    NSLog(@"数字：%.2f,时长：%f,时间间隔：%f,分割个数：%ld",toNum,time,delayTime,(long)totalCount);
    NSMutableArray *mediumNumArr = [[NSMutableArray alloc] initWithCapacity:totalCount];
    
    for (CGFloat i = 0; i<= totalCount; i++) {
        if (toNum-fromNum>0) {   //如果结束的数字比开始的数字大
            [mediumNumArr addObject:[NSString stringWithFormat:@"%.2f",i*((toNum-fromNum)/totalCount)+fromNum]];
        }else {
            [mediumNumArr addObject:[NSString stringWithFormat:@"%.2f",fromNum - i*((fromNum-toNum)/totalCount)]];
        }
        //     [mediumNumArr addObject:[NSString stringWithFormat:@"%.2f",i*(toNum/totalCount)]];
    }
    [self changeLabelTitleWithDelayTime:delayTime andMediumArr:mediumNumArr];
}

//得到分割数目
- (NSInteger)getCountFromNum:(CGFloat)num {
    if (num<=0) {
        return 1;
    }else if(num<1000){
        return 100;
    }else {
        return num/20;
    }
}
- (void)changeLabelTitleWithDelayTime:(CGFloat)delayTime andMediumArr:(NSMutableArray *)mediumArr {
    if ([mediumArr count]<=0) {
    }else {
        self.text = mediumArr[0];
        [mediumArr removeObjectAtIndex:0];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayTime*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self changeLabelTitleWithDelayTime:delayTime andMediumArr:mediumArr];
        });
    }
    
    
}
@end
