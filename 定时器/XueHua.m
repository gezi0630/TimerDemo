//
//  XueHua.m
//  定时器
//
//  Created by MAC on 2017/6/30.
//  Copyright © 2017年 GuoDongge. All rights reserved.
//

#import "XueHua.h"

static CGFloat _snowY = 0;

@implementation XueHua

-(void)awakeFromNib
{
    [super awakeFromNib];
    
    //CADisplayLink ：调度优先级高，屏幕刷新时就会调用，屏幕一般每秒刷新60次
    //创建定时器
    CADisplayLink * disLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(timeChange)];
    //添加主运行循环
    [disLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
}

- (void)drawRect:(CGRect)rect {
   //图案间距
    CGFloat jianJu = 50.0;
    
    int temp = rect.size.width / jianJu ;
    
    for (int i = 0; i <= temp; i++) {
        
        UIImage * image = [UIImage imageNamed:@"xuehua"];
        
        [image drawAtPoint:CGPointMake(50 * i, _snowY)];
        
        
        UIImage * image1 = [UIImage imageNamed:@"xuehua"];
        
        [image1 drawAtPoint:CGPointMake(50 * i, _snowY+ 100)];
    }
    
    //图案的Y值增加10
    _snowY += 10;
    
    //如果超出控件高度，就让图案复位
    if (_snowY > rect.size.height) {
        _snowY = 0;
    }
    
    
    
}



-(void)timeChange
{
    //重绘
    [self setNeedsDisplay];
}

@end
