//
//  ViewController.m
//  开关
//
//  Created by imac on 16-3-7.
//  Copyright (c) 2016年 sun－company. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@property (weak, nonatomic) IBOutlet UITextField *showStateTextField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}
- (IBAction)switchValueChange:(UISwitch *)sender {
    self.showStateTextField.text=[NSString stringWithFormat:@"%@",sender.isOn?@"开关打开":@"开关关闭"];
}

@end
