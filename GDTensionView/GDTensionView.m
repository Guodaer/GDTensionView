//
//  GDTensionView.m
//  GDTensionView
//
//  Created by xiaoyu on 16/1/25.
//  Copyright © 2016年 Guoda. All rights reserved.
//

#import "GDTensionView.h"

@interface GDTensionView ()

//本地图片
@property (nonatomic, strong) UIImageView *localImageView;
//初始宽度
@property (nonatomic, assign) CGFloat orginWidth;
//初始高度
@property (nonatomic, assign) CGFloat orginHeight;


@end

@implementation GDTensionView

/**
 *  加载本地图片
 *
 *  @param frame
 *  @param imageName
 *
 *  @return
 */
- (instancetype)initWithFrame:(CGRect)frame WithImages:(NSString *)imageName {
    
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        imageView.image = [UIImage imageNamed:imageName];
        self.localImageView = imageView;
        self.orginWidth = imageView.frame.size.width;
        self.orginHeight = imageView.frame.size.height;
        [self addSubview:imageView];
    }
    return self;
}
/**
 *  加载网络图片
 *
 *  @param frame
 *  @param imageUrl
 *  @param placeholder
 *
 *  @return
 */
- (instancetype) initWithFrame:(CGRect)frame WithImages:(NSURL *)imageUrl PlaceholderImage:(UIImage *)placeholder {

    self = [super initWithFrame:frame];
    
    if (self) {
     
        
    }
    return self;
    
}

- (void)imageViewStretchingWithOffSet:(CGFloat)offset {

    CGFloat whPercent = self.orginWidth/self.orginHeight;//原始比例
    
    CGFloat height = self.orginHeight - offset;//拉伸后的高度
    
    CGFloat width = self.orginWidth - offset * whPercent;//拉伸后的宽度
    
    if (offset < -1) {
        self.localImageView.frame = CGRectMake(offset, offset, width, height);
        
    }
    else {
    
        self.localImageView.frame = CGRectMake(0, 0, self.orginWidth, self.orginHeight);
    
    }
    
}





@end
