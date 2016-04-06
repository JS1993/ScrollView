//
//  ViewController.m
//  ScrollViewForImageReview
//
//  Created by  江苏 on 16/4/6.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (strong, nonatomic)UIScrollView *scrollView;
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
//重写image的setter方法
-(void)setImage:(UIImage *)image{
    _image=image;
    //设置图像内容
    self.imageView.image=image;
    //设置图像视图根据图像自动调整大小
    [self.imageView sizeToFit];
    
}
-(UIScrollView *)scrollView{
    if (_scrollView==nil) {
        _scrollView=[[UIScrollView alloc]initWithFrame:self.view.bounds];
        _scrollView.minimumZoomScale=0.2;
        _scrollView.maximumZoomScale=1.5;
        _scrollView.delegate=self;
        [self.view addSubview:_scrollView];
    }
    return _scrollView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.image=[UIImage imageNamed:@"minion"];
    self.scrollView.contentSize=self.imageView.bounds.size;
}
-(nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return  self.imageView;
}

@end
