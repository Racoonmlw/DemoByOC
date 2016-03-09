//
//  showPercentView.m
//  百分比效果
//
//  Created by imac on 16-3-7.
//  Copyright (c) 2016年 sun－company. All rights reserved.
//

#import "showPercentView.h"

@implementation showPercentView
-(void)setPercentValue:(CGFloat)percentValue
{
    _percentValue=percentValue;
    [self setNeedsDisplay];
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    UIBezierPath*path=[UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2) radius:100 startAngle:M_PI_2*3 endAngle:M_PI_2*3+2*M_PI*self.percentValue clockwise:YES];
    [[UIColor blueColor]setStroke];
    path.lineWidth=10;
    path.lineCapStyle= kCGLineCapButt;
    path.lineJoinStyle=kCGLineJoinMiter;
    [path stroke];
    NSString*str=[NSString stringWithFormat:@"%2.0lf%%",self.percentValue*100];
    NSDictionary*strAttribute=@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[UIColor greenColor]};
    CGSize a=[str boundingRectWithSize:CGSizeMake(self.bounds.size.width, self.bounds.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:strAttribute context:nil].size;
    [str drawInRect:CGRectMake(self.bounds.size.width/2-a.width/2, self.bounds.size.height/2-a.height/2, a.width, a.height) withAttributes:strAttribute];
}


@end
