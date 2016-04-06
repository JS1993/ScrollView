//
//  ViewController.m
//  ScrollViewForImageReview
//
//  Created by  江苏 on 16/4/6.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property(strong,nonatomic)UIImageView* imageView;
@property(strong,nonatomic)UIImage* image;
@end

@implementation ViewController
//懒加载
-(UIImageView *)imageView{
    if (_imageView==nil) {
        _imageView=[[UIImageView alloc]init];
        [self.scrollView addSubview:_imageView];
    }
    return _imageView;
}
-(void)setImage:(UIImage *)image{
    _image=image;
    //设置图像内容
    self.imageView.image=image;
    //设置图像视图根据图像自动调整大小
    [self.imageView sizeToFit];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.image=[UIImage imageNamed:@"minion"];
    self.scrollView.contentSize=self.imageView.bounds.size;
}


@end
