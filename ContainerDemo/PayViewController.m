//
//  PayViewController.m
//  ContainerDemo
//
//  Created by qianfeng001 on 15-7-8.
//  Copyright (c) 2015年 Zhen. All rights reserved.
//

#import "PayViewController.h"
#import <AlipaySDK/AlipaySDK.h>
#import "Order.h"
#import "DataSigner.h"
#import "MyControl.h"
#import "MyPayHeader.h"

@interface PayViewController ()

@end

@implementation PayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor brownColor];
    [self shouUI];
}

- (void)shouUI {
    UIButton *button = [MyControl creatButtonWithFrame:CGRectMake(100, 100, 50, 50) target:self sel:@selector(btnClick:) tag:101 image:nil title:@"支付"];
    [self.view addSubview:button];
}

- (void)btnClick:(UIButton *)button {
    Order *order = [[Order alloc]init];
    order.partner = PartnerID;
    order.tradeNO = @"1000";
    order.seller = SellerID;
    order.productName = @"iphone";
    order.productDescription = @"iphone降价处理";
    order.amount = @"0.01";
    order.notifyURL = @"http://www.baidu.com";
    order.service = @"mobile.security.pay";
    order.paymentType = @"1";
    order.inputCharset = @"utf-8";
    order.itBPay = @"30m";
    NSString *appScheme = @"alipayDemoTest";
    NSString *orderSpec = [order description];
    id<DataSigner>signer = CreateRSADataSigner(PartnerPrivKey);
    NSString *signedString = [signer signString:orderSpec];
    NSString *orderString = nil;
    if (signedString != nil) {
        orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",
                       orderSpec, signedString, @"RSA"];
        [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
            NSLog(@"reslut = %@",resultDic);
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
