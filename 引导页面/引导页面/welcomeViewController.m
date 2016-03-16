//
//  welcomeViewController.m
//  引导页面
//
//  Created by imac on 16-3-7.
//  Copyright (c) 2016年 sun－company. All rights reserved.
//

#import "welcomeViewController.h"
#import "ViewController.h"

@interface welcomeViewController ()<UIScrollViewDelegate>
@property(nonatomic,weak)UIPageControl *pc;
@end

@implementation welcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setScrollView];
    [self setPageControl];
    
}
-(void)setScrollView
{
   
    UIScrollView *sv = [[UIScrollView alloc]init];
    sv.delegate = self;
    sv.frame = self.view.bounds;
    sv.contentSize = CGSizeMake(4*sv.bounds.size.width, sv.bounds.size.height);
    for (NSInteger i=0; i<4; i++)
    {
        UIImageView *iv = [[UIImageView alloc]init];
        iv.frame = CGRectMake(i*sv.bounds.size.width, 0, sv.bounds.size.width, sv.bounds.size.height);
        NSString *imageName = [NSString stringWithFormat:@"welcome%ld",i+1];
        iv.image = [UIImage imageNamed:imageName];
        [sv addSubview:iv];
        
        if (i==3)
        {
            [self configEnterButton:iv];
        }
    }
    [self.view addSubview:sv];
    sv.bounces = NO;
    sv.pagingEnabled = YES;
    //设置不显示水平滚动提示条
    sv.showsHorizontalScrollIndicator = NO;
}

-(void)configEnterButton:(UIImageView *)iv
{
    iv.userInteractionEnabled = YES;
    UIButton *enterButton = [[UIButton alloc]init];
    enterButton.frame = CGRectMake(iv.bounds.size.width*0.5-50, iv.bounds.size.height*0.6, 100, 30);
    enterButton.backgroundColor = [UIColor orangeColor];
    [enterButton setTitle:@"进入应用" forState:UIControlStateNormal];
    [enterButton addTarget:self action:@selector(enterApp:) forControlEvents:UIControlEventTouchUpInside];
    [iv addSubview:enterButton];
}
//点击进入app
-(void)enterApp:(UIButton *)sender
{
    
    UIStoryboard*storyBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIApplication *app = [UIApplication sharedApplication];
    app.keyWindow.rootViewController =[storyBoard instantiateInitialViewController];
}


-(void)setPageControl
{
    UIPageControl *pc = [[UIPageControl alloc]init];
    self.pc = pc;
    pc.frame = CGRectMake(0, self.view.bounds.size.height-60, self.view.bounds.size.width, 40);
    pc.numberOfPages = 4;
    pc.pageIndicatorTintColor = [UIColor redColor];
    pc.currentPageIndicatorTintColor = [UIColor blackColor];
    pc.userInteractionEnabled = NO;
    [self.view addSubview:pc];

}

#pragma mark - UIScrollViewDelegate协议
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint offset = scrollView.contentOffset;
    
    //四舍五入偏移量除以滚动视图的一屏宽
    self.pc.currentPage = round(offset.x/scrollView.bounds.size.width);
    
}

@end
