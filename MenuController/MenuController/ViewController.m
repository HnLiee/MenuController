//
//  ViewController.m
//  MenuController
//
//  Created by HnLiee on 16/8/10.
//  Copyright © 2016年 HnLiee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://baidu.com"]]];
    [self.webView loadHTMLString:@"<div style=\"color:red;\">哈哈哈</div>" baseURL:nil];
}

- (void)ding:(UIMenuController *)menu
{
    NSLog(@"%s %@", __func__, menu);
}

- (void)replay:(UIMenuController *)menu
{
    NSLog(@"%s %@", __func__, menu);
}

- (void)report:(UIMenuController *)menu
{
    NSLog(@"%s %@", __func__, menu);
}

@end
