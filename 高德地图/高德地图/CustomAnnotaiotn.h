//
//  CustomAnnotaiotn.h
//  高德地图
//
//  Created by imac on 16-3-7.
//  Copyright (c) 2016年 sun－company. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@interface CustomAnnotaiotn : NSObject<MKAnnotation>
//大头针的地理位置
@property (nonatomic) CLLocationCoordinate2D coordinate;
//标识大头针的两个title标题
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
//自定义的图片属性
@property (nonatomic, strong) UIImage *image;

@end
