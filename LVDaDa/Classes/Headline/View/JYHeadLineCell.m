//
//  JYHeadLineCell.m
//  LVDaDa
//
//  Created by Sept on 16/7/22.
//  Copyright © 2016年 丶九月. All rights reserved.
//

#import "JYHeadLineCell.h"
#import "JYHeadLineFrame.h"
#import "JYHeadLines.h"
#import "JYHeadLinesImage.h"

@interface JYHeadLineCell ()

@property (strong, nonatomic) UILabel *labelTitle;

// 当只有一张图片的时候
@property (strong, nonatomic) UIImageView *viewImage;

// 有多张图片的时候
@property (strong, nonatomic) UIImageView *oneImage;

@property (strong, nonatomic) UIImageView *twoImage;

@property (strong, nonatomic) UIImageView *threeImage;

@end

@implementation JYHeadLineCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"headLine";
    
    JYHeadLineCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[JYHeadLineCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

- (UILabel *)labelTitle
{
    if (!_labelTitle) {
        
        _labelTitle = [[UILabel alloc] init];
        
        _labelTitle.numberOfLines = 0;
        _labelTitle.tintColor = [UIColor blackColor];
        _labelTitle.font = setFont(15);
        
        [self.contentView addSubview:_labelTitle];
    }
    return _labelTitle;
}

- (UIImageView *)viewImage
{
    if (!_viewImage) {
        
        _viewImage = [[UIImageView alloc] init];
        
        _viewImage.image = [UIImage imageNamed:@"tou-tiao-di-tu(da)"];
        
        [self.contentView addSubview:_viewImage];
    }
    return _viewImage;
}

- (UIImageView *)oneImage
{
    if (!_oneImage) {
        
        _oneImage = [[UIImageView alloc] init];
        
        _oneImage.image = [UIImage imageNamed:@"ditu(xiao)"];
        
        [self.contentView addSubview:_oneImage];
    }
    return _oneImage;
}

- (UIImageView *)twoImage
{
    if (!_twoImage) {
        
        _twoImage = [[UIImageView alloc] init];
        
        _twoImage.image = [UIImage imageNamed:@"ditu(xiao)"];
        
        [self.contentView addSubview:_twoImage];
    }
    return _twoImage;
}

- (UIImageView *)threeImage
{
    if (!_threeImage) {
        
        _threeImage = [[UIImageView alloc] init];
        
        _threeImage.image = [UIImage imageNamed:@"ditu(xiao)"];
        
        [self.contentView addSubview:_threeImage];
    }
    return _threeImage;
}

- (void)setHeadFrame:(JYHeadLineFrame *)headFrame
{
    _headFrame = headFrame;
    
    self.labelTitle.frame = headFrame.titleFrame;
    self.labelTitle.text = headFrame.headLines.newsTitle;
    switch (headFrame.iconFrames.count) {
        case 1:
        {
            JYHeadLinesImage *headImages = headFrame.headLines.newsImages[0];
            self.viewImage.frame = [headFrame.iconFrames[0] CGRectValue];
            self.oneImage.hidden = YES;
            self.twoImage.hidden = YES;
            self.threeImage.hidden = YES;
            [self.viewImage sd_setImageWithURL:[NSURL URLWithString:headImages.imageUrlView] placeholderImage:[UIImage imageNamed:@"tou-tiao-di-tu(da)"]];
        }
            break;
        case 2:
        {
            // 1.去除图片的url
            JYHeadLinesImage *headImages0 = headFrame.headLines.newsImages[0];
            JYHeadLinesImage *headImages1 = headFrame.headLines.newsImages[1];
            
            // 2.设置图片的frame
            self.oneImage.frame = [headFrame.iconFrames[0] CGRectValue];
            self.twoImage.frame = [headFrame.iconFrames[1] CGRectValue];
            
            // 3.网络加载图片数据
            [self.oneImage sd_setImageWithURL:[NSURL URLWithString:headImages0.imageUrlView] placeholderImage:[UIImage imageNamed:@"ditu(xiao)"]];
            [self.twoImage sd_setImageWithURL:[NSURL URLWithString:headImages1.imageUrlView] placeholderImage:[UIImage imageNamed:@"ditu(xiao)"]];
            
            self.viewImage.hidden = YES;
            self.threeImage.hidden = YES;
        }
            break;
        case 3:
        {
            // 1.去除图片的url
            JYHeadLinesImage *headImages0 = headFrame.headLines.newsImages[0];
            JYHeadLinesImage *headImages1 = headFrame.headLines.newsImages[1];
            JYHeadLinesImage *headImages2 = headFrame.headLines.newsImages[2];
            
            // 2.设置图片的frame
            self.oneImage.frame = [headFrame.iconFrames[0] CGRectValue];
            self.twoImage.frame = [headFrame.iconFrames[1] CGRectValue];
            self.threeImage.frame = [headFrame.iconFrames[2] CGRectValue];
            
            // 3.网络加载图片数据
            [self.oneImage sd_setImageWithURL:[NSURL URLWithString:headImages0.imageUrlView] placeholderImage:[UIImage imageNamed:@"ditu(xiao)"]];
            [self.twoImage sd_setImageWithURL:[NSURL URLWithString:headImages1.imageUrlView] placeholderImage:[UIImage imageNamed:@"ditu(xiao)"]];
            [self.threeImage sd_setImageWithURL:[NSURL URLWithString:headImages2.imageUrlView] placeholderImage:[UIImage imageNamed:@"ditu(xiao)"]];
            
            self.viewImage.hidden = YES;
        }
            break;
            
        default:
            break;
    }
}

@end
