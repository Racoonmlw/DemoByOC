//
//  ViewController.m
//  高德地图
//
//  Created by imac on 16-3-7.
//  Copyright (c) 2016年 sun－company. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import "CustomAnnotaiotn.h"
@interface ViewController ()<MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic,strong)CLLocationManager*manager;
@property (nonatomic,strong)CustomAnnotaiotn*Annotaiotn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setMapAndLocation];
}
-(void)setMapAndLocation
{
    //初始化manager
    self.manager = [CLLocationManager new];
    //假定用户点同意按钮(Info.plist添加key)
    [self.manager requestWhenInUseAuthorization];
    
    //设置代理(用户的位置)
    self.mapView.delegate = self;
    
    //设置地图视图旋转
    self.mapView.rotateEnabled = NO;
    //设置地图的类型
    self.mapView.mapType = MKMapTypeStandard;
    
    //开始定位(地图一直显示用户的位置)
    self.mapView.userTrackingMode = MKUserTrackingModeFollow;
}
-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    userLocation.title = @"我";
    userLocation.subtitle = @"当前位置";
    self.Annotaiotn=[[CustomAnnotaiotn alloc]init];
    self.Annotaiotn.coordinate=CLLocationCoordinate2DMake(userLocation.coordinate.latitude, userLocation.coordinate.longitude);
}
- (IBAction)insertAnnotation:(UIButton *)sender {
    
    self.Annotaiotn=[[CustomAnnotaiotn alloc]init];
//    double latitude = self.Annotaiotn.coordinate.latitude+ arc4random_uniform(10);
//    double longitude = self.Annotaiotn.coordinate.longitude + arc4random_uniform(10);
    double latitude = 39.123 + arc4random_uniform(10);
    double longitude = 116.234 + arc4random_uniform(10);
    self.Annotaiotn.coordinate = CLLocationCoordinate2DMake(latitude, longitude);
    self.Annotaiotn.title = @"添加";
    self.Annotaiotn.subtitle = @"添加的位置";
    //V2:
    self.Annotaiotn.image = [UIImage imageNamed:@"icon.png"];
    //添加到地图视图上
    [self.mapView addAnnotation:self.Annotaiotn];
    
    //挪动地图到添加大头针的位置(设置region)
//    MKCoordinateSpan span = MKCoordinateSpanMake(0.5, 0.5);
//    MKCoordinateRegion region = MKCoordinateRegionMake(annotation.coordinate, span);
//    [self.mapView setRegion:region];

}
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    //需求：修改默认的大头针的图片
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;//使用蓝色圈
    }
    //重用机制(大头针视图)
    static NSString *identifier = @"annotation";
    MKAnnotationView *annoView = [mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (!annoView) {
        annoView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        
       CustomAnnotaiotn *anno =annotation;
        annoView.image = anno.image;
        //设置允许弹出动作
        annoView.canShowCallout = YES;
        
        
    } else {
        annoView.annotation = annotation;
    }
    
    return annoView;
}



@end
