//
//  DetailViewController.m
//  ContainerDemo
//
//  Created by qianfeng on 15-6-16.
//  Copyright (c) 2015年 Zhen. All rights reserved.
//

#import "DetailViewController.h"
#import "CommentViewController.h"
#import "DataManager.h"

@interface DetailViewController ()
{
    UIToolbar *toolBar;
    BOOL isClick;
    UIWebView *_webView;
}
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    isClick = YES;
    //self.detailURL = @"http://ksjv2.kanshangjie.com/Category/Show?catid=475&id=54906&type=news";
    [self.navigationController setToolbarHidden:NO animated:YES];
    [self creatWebView];
    [self creatToolBar];
}

//-(void)

- (void)creatWebView {
    _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 20, kScreenSize.width, kScreenSize.height-69)];
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.detailURL]]];
    [self.view addSubview:_webView];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeFont:) name:@"ChangeFontSize" object:_webView];
    
}

//-(void)changeFont:(NSNotification *)notification{
//    switch ([notification.userInfo[@"buttonIndex"] integerValue]) {
//            
//        case 1:
//        {
//            NSString *str = [NSString stringWithFormat:@"document.getElementsByTagName('body')[0].style.fontSize='%d'",10];;
//            [_webView stringByEvaluatingJavaScriptFromString:str];
//        }
//            break;
//            
//        default:NSLog(@"%d",[notification.userInfo[@"buttonIndex"] integerValue]);
//            break;
//    }
//}

- (void)creatToolBar {
    toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0,kScreenSize.height-50,kScreenSize.width,50)];
    [toolBar setBarStyle:UIBarStyleDefault];
    toolBar.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    toolBar.backgroundColor = [UIColor whiteColor];
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    for (NSInteger i = 1; i <= 4; i++) {
        UIBarButtonItem *btnItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:[NSString stringWithFormat:@"news_%02d.png",i]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(btnItemClick:)];
        if (i == 4) {
            if (isClick) {
                btnItem.enabled = YES;
            }else {
                [btnItem setBackgroundImage:[UIImage imageNamed:@"ico16"] forState:UIControlStateSelected style:UIBarButtonSystemItemUndo barMetrics:UIBarMetricsDefault];
            }
        }
        btnItem.tag = 100+i;
        [arr addObject:flexSpace];
        [arr addObject:btnItem];
        [arr addObject:flexSpace];
     }
    [toolBar setItems:arr animated:YES];
    [self.view addSubview:toolBar];
}
- (void)btnItemClick:(UIBarButtonItem *)item {
    switch (item.tag) {
        case 101:
        {
            [self dismissViewControllerAnimated:NO completion:nil];
        }
            break;
            case 102:
        {
            //分享
            
            
            //注意：分享到微信好友、微信朋友圈、微信收藏、QQ空间、QQ好友、来往好友、来往朋友圈、易信好友、易信朋友圈、Facebook、Twitter、Instagram等平台需要参考各自的集成方法
            //如果需要分享回调，请将delegate对象设置self，并实现下面的回调方法
            NSString *body = [NSString stringWithFormat:@"这里有惊喜:%@",self.detailURL];
            [UMSocialSnsService presentSnsIconSheetView:self
                        appKey:@"507fcab25270157b37000010"
                            shareText:body
                                shareImage:[UIImage imageNamed:@"icon"]
                                        shareToSnsNames:@[UMShareToSina,UMShareToRenren,UMShareToWechatTimeline,UMShareToEmail,UMShareToSms] delegate:self];
        }
            break;
            case 103:
        {
            //评论
            CommentViewController *comment = [[CommentViewController alloc]init];
            NSString *url = [NSString stringWithFormat:@"http://ksjv2.kanshangjie.com/Comment/Show?cateid=%@&id=%@",self.catid,self.contentId];
            comment.commentURL = url;
            comment.contentId = self.contentId;
            comment.catid = self.catid;
            [self presentViewController:comment animated:YES completion:nil];
            
        }
            break;
            case 104:
        {
            //收藏
            [[DataManager sharedInstance]insertModel:self.conModel];
        }
            break;
        default:
            break;
    }
}
//弹出列表方法presentSnsIconSheetView需要设置delegate为self
-(BOOL)isDirectShareInIconActionSheet
{
    return YES;
}
-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    //根据`responseCode`得到发送结果,如果分享成功
    if(response.responseCode == UMSResponseCodeSuccess)
    {
        //得到分享到的微博平台名
//        NSLog(@"share to sns name is %@",[[response.data allKeys] objectAtIndex:0]);
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
