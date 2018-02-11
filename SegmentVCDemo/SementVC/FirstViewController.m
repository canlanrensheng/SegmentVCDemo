//
//  FirstViewController.m
//  SegmentVCDemo
//
//  Created by 张金山 on 2018/2/7.
//  Copyright © 2018年 张金山. All rights reserved.
//

#import "FirstViewController.h"
#import "UILabel+LJLabel.h"
@interface FirstViewController ()

@property (nonatomic,strong)UILabel *textLabel;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"视图1";
    
    self.textLabel = [UILabel creatLabel:^(UILabel *label) {
        label.ljTitle_font_textColor(@"",[UIFont systemFontOfSize:18],[UIColor redColor]);
        label.numberOfLines = 0;
        [label sizeToFit];
    }];
//    _textLabel = [[UILabel alloc] init];
//    _textLabel.font = [UIFont systemFontOfSize:18];
//    _textLabel.textColor = [UIColor redColor];
    self.textLabel.center = CGPointMake(self.view.center.x, self.view.center.y);
    [self.view addSubview:self.textLabel];
    
}

- (void)setTextTitle:(NSString *)textTitle{
    _textTitle = textTitle;
    self.textLabel.text = textTitle;
}


@end
