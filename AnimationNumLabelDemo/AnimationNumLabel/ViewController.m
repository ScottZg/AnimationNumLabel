//
//  ViewController.m
//  AnimationNumLabel
//
//  Created by zhanggui on 16/1/14.
//  Copyright © 2016年 zhanggui. All rights reserved.
//

#import "ViewController.h"
#import "UILabel+AnimationNumberLabel.h"
@interface ViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UITextField *startNumTextField;
@property (weak, nonatomic) IBOutlet UITextField *endNumTextField;
@end

@implementation ViewController


#pragma mark - 视图声明周期
- (void)viewDidLoad {
    [super viewDidLoad];
    self.startNumTextField.delegate = self;
}
#pragma mark - Button Action
- (IBAction)startAnimationAction:(id)sender {
    [self.numberLabel animationFromNum:[self.startNumTextField.text floatValue] toNum:[self.endNumTextField.text floatValue] andWithDuration:[self.numberLabel getTimeDurationFromNum:fabs([self.endNumTextField.text floatValue]-[self.startNumTextField.text floatValue])]];
}
#pragma mark - UITextFieldDelegate
- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.numberLabel.text = textField.text;
}
@end
