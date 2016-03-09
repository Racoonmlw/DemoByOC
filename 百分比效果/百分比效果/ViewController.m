//
//  ViewController.m
//  百分比效果
//
//  Created by imac on 16-3-7.
//  Copyright (c) 2016年 sun－company. All rights reserved.
//

#import "ViewController.h"
#import "showPercentView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet showPercentView *showPercentView;
 
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (IBAction)tapsliderValue:(UISlider *)sender {
    self.showPercentView.percentValue=sender.value;
}


@end
