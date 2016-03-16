//
//  ViewController.m
//  调用webView
//
//  Created by imac on 16-3-7.
//  Copyright (c) 2016年 sun－company. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UITextField *showTectField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL*url=[NSURL URLWithString:@"http://m.baidu.com"];
    NSURLRequest*request=[NSURLRequest requestWithURL:url];
    self.webView.delegate=self;
    [self.webView loadRequest:request];//异步请求
}
#pragma mark-UIWebViewDelegate
//获取UIwebview中button的单击事件
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    /*UIWebViewNavigationTypeLinkClicked，用户触击了一个链接
     UIWebViewNavigationTypeFormSubmitted，用户提交了一个表单
     UIWebViewNavigationTypeBackForward，用户触击前进或返回按钮
     UIWebViewNavigationTypeReload，用户触击重新加载的按钮
     UIWebViewNavigationTypeFormResubmitted，用户重复提交表单
     UIWebViewNavigationTypeOther，发生其它行为*/
    
    NSURL*url=[request URL];
    self.showTectField.text=[url absoluteString];
    return YES;
}


@end
