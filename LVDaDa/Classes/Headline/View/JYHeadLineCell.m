//
//  JYHeadTestCell.m
//  LVDaDa
//
//  Created by Sept on 16/7/23.
//  Copyright © 2016年 丶九月. All rights reserved.
//

#import "JYHeadLineCell.h"

#import "JYHeadLines.h"
#import "JYHeadLinesImage.h"

@interface JYHeadLineCell ()

@property (weak, nonatomic) IBOutlet UILabel *labelTitle;

@property (weak, nonatomic) IBOutlet UIImageView *imgeView;

@property (weak, nonatomic) IBOutlet UIImageView *imge1View;
@property (weak, nonatomic) IBOutlet UIImageView *image2View;
@property (weak, nonatomic) IBOutlet UIImageView *image3View;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *sourceLable;
@property (weak, nonatomic) IBOutlet UILabel *readLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *shareLabel;
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

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setHeadLines:(JYHeadLines *)headLines
{
    _headLines = headLines;
    
    self.labelTitle.text = headLines.newsTitle;
//    NSLog(@"%@, count = %lu", self.labelTitle.text, (unsigned long)headLines.newsImages.count);
    
    self.imgeView.hidden = YES;
    self.imge1View.hidden = YES;
    self.image2View.hidden = YES;
    self.image3View.hidden = YES;
    
    switch (headLines.newsImages.count) {
        case 1:
        {
            self.imgeView.hidden = NO;
            
            JYHeadLinesImage *imgaes = headLines.newsImages[0];
            [self.imgeView sd_setImageWithURL:[NSURL URLWithString:imgaes.imageUrlView] placeholderImage:[UIImage imageNamed:@"tou-tiao-di-tu(da)"]];
            self.imge1View.hidden = YES;
            self.image2View.hidden = YES;
            self.image3View.hidden = YES;
        }
            break;
        case 2:
        {
            self.imge1View.hidden = NO;
            self.image2View.hidden = NO;
            
            JYHeadLinesImage *imgaes1 = headLines.newsImages[0];
            JYHeadLinesImage *imgaes2 = headLines.newsImages[1];
            [self.imge1View sd_setImageWithURL:[NSURL URLWithString:imgaes1.imageUrlView] placeholderImage:[UIImage imageNamed:@"ditu(xiao)"]];
            [self.image2View sd_setImageWithURL:[NSURL URLWithString:imgaes2.imageUrlView] placeholderImage:[UIImage imageNamed:@"ditu(xiao)"]];
            self.imageView.hidden = YES;
            self.image3View.hidden = YES;
        }
            break;
        case 3:
        {
            self.imge1View.hidden = NO;
            self.image2View.hidden = NO;
            self.image3View.hidden = NO;
            
            JYHeadLinesImage *imgaes1 = headLines.newsImages[0];
            JYHeadLinesImage *imgaes2 = headLines.newsImages[1];
            JYHeadLinesImage *imgaes3 = headLines.newsImages[2];
            [self.imge1View sd_setImageWithURL:[NSURL URLWithString:imgaes1.imageUrlView] placeholderImage:[UIImage imageNamed:@"ditu(xiao)"]];
            [self.image2View sd_setImageWithURL:[NSURL URLWithString:imgaes2.imageUrlView] placeholderImage:[UIImage imageNamed:@"ditu(xiao)"]];
            [self.image3View sd_setImageWithURL:[NSURL URLWithString:imgaes3.imageUrlView] placeholderImage:[UIImage imageNamed:@"ditu(xiao)"]];
            self.imageView.hidden = YES;
        }
            break;
            
        default:
            break;
    }
    
    self.shareLabel.text = headLines.shareCount;
    
    self.contentLabel.text = headLines.commentCount;
    
    self.readLabel.text = headLines.browseCount;
    
    self.sourceLable.text = headLines.newsSource;
    
    self.timeLabel.text = headLines.createDateView;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
