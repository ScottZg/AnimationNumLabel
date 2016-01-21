//
//  UILabel+AnimationNumberLabel.m
//  AnimationNumLabel
//
//  Created by zhanggui on 16/1/14.
//  Copyright © 2016年 zhanggui. All rights reserved.
//

#import "UILabel+AnimationNumberLabel.h"
#import <objc/runtime.h>

@implementation UILabel (AnimationNumberLabel)

@dynamic isRunning;

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
    self.isRunning = @"YES";  //如果再次进来，就停止运行
    self.text = [NSString stringWithFormat:@"%0.2f",fromNum];
    
    NSInteger totalCount = [self getCountFromNum:fabs(toNum-fromNum) ];
    
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
    if ([self.isRunning isEqualToString:@"NO"]) {
        return;
    }
    if ([mediumArr count]<=0) {
        self.isRunning = @"NO";
    }else {
        self.text = mediumArr[0];
        [mediumArr removeObjectAtIndex:0];
//        self.isRunning = YES;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayTime*NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self changeLabelTitleWithDelayTime:delayTime andMediumArr:mediumArr];
        });
    }
    
    
}
- (void)stopRunning {
    self.isRunning = @"NO";
}
#pragma mark - isRunning Getter setter
- (NSString *)isRunning {
    return objc_getAssociatedObject(self,@selector(isRunning));
    
}
- (void)setIsRunning:(NSString *)isRunnings {
    objc_setAssociatedObject(self, @selector(isRunning),isRunnings, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
}

@end
