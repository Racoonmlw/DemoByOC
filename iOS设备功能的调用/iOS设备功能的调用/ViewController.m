//
//  ViewController.m
//  iOS设备功能的调用
//
//  Created by imac on 16-3-7.
//  Copyright (c) 2016年 sun－company. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
//调用电话
- (IBAction)selectForCall:(UIButton *)sender {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"tel://10086"]];
}
//调用摄像头 (调用图库和相册则sourceType选择：UIImagePickerControllerSourceTypePhotoLibrary，UIImagePickerControllerSourceTypeSavedPhotosAlbum)
- (IBAction)selectForCamera:(UIButton *)sender {
    UIImagePickerController*picker=[[UIImagePickerController alloc]init];
    picker.sourceType=UIImagePickerControllerSourceTypeCamera;
    picker.delegate=self;
    picker.allowsEditing=YES;
    [self presentViewController:picker animated:YES completion:nil];
}
#pragma mark-UIImagePickerControllerDelegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    NSString * type = [info objectForKey:UIImagePickerControllerMediaType];
    if ([type isEqualToString:@"public.image"])
    {
        UIImage * image = [info objectForKey:@"UIImagePickerControllerEditedImage"]; // image即为从相机/相册获取到的图片
    }
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}
//调用浏览器
- (IBAction)selectForBrowser:(UIButton *)sender {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"http://baidu.com"]];
}
//调用短信
- (IBAction)selectedForMessage:(UIButton *)sender {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"sms://123"]];
}



@end
