//
//  TestViewController.m
//  选项卡
//
//  Created by apple on 14-12-15.
//  Copyright (c) 2014年 杰睿科技. All rights reserved.
//

#import "TestViewController.h"



@interface TestViewController ()

@end

@implementation TestViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    

    LMJTab * tab = [[LMJTab alloc] initWithFrame:CGRectMake(10, 50, 300, 30) lineWidth:1 lineColor:[UIColor blackColor]];
    [tab setItemsWithTitle:[NSArray arrayWithObjects:@"小贴士",@"知识",@"精华帖", nil] normalItemColor:[UIColor whiteColor] selectItemColor:[UIColor blackColor] normalTitleColor:[UIColor blackColor] selectTitleColor:[UIColor whiteColor] titleTextSize:15 selectItemNumber:1];
    tab.delegate = self;
    tab.layer.cornerRadius = 5.0;
    [self.view addSubview:tab];

}

-(void)tab:(LMJTab *)tab didSelectedItemNumber:(NSInteger)number{
    NSLog(@"CLICKED:%ld",number);
}


@end
