//
//  HLLabel.m
//  MenuController
//
//  Created by HnLiee on 16/8/10.
//  Copyright © 2016年 HnLiee. All rights reserved.
//

#import "HLLabel.h"

@implementation HLLabel

- (void)awakeFromNib
{
    [self setUp];
}

- (instancetype)init
{
    if (self = [super init]) {
        [self setUp];
    }
    return  self;
}

- (void)setUp
{
    self.userInteractionEnabled = YES;
    
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelClick)]];
}

/**
 *  让label有资格成为第一响应者
 */
- (BOOL)canBecomeFirstResponder
{
    return YES;
}

/**
 *  label能执行哪些操作
 *  return YES; 支持这种操作
 */
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    NSLog(@"%@", NSStringFromSelector(action));
    
    if (action == @selector(cut:) || action == @selector(copy:) || action == @selector(paste:)) return YES;
    return NO;
}

- (void)cut:(UIMenuController *)menu
{
    NSLog(@"%s %@", __func__, menu);
    
    // 将自己的文字复制到粘贴板
    [self copy:menu];
    
    // 清空文字
    self.text = nil;
}

- (void)copy:(UIMenuController *)menu
{
    NSLog(@"%s %@", __func__, menu);
    
    // 将自己的文字复制到粘贴板
    UIPasteboard *board = [UIPasteboard generalPasteboard];
    board.string = self.text;
}

- (void)paste:(UIMenuController *)menu
{
    NSLog(@"%s %@", __func__, menu);
    
    // 将粘贴板上的文字复制到自己身上
    UIPasteboard *board = [UIPasteboard generalPasteboard];
    self.text = board.string;
}

- (void)labelClick
{
    // 1.label要成为第一响应者
    // 作用是：告诉MenuColtroller支持哪些操作，这些操作如何让处理
    [self becomeFirstResponder];
    
    // 2.显示MenuColtroller
    UIMenuController *menu = [UIMenuController sharedMenuController];
    
    // 添加MenuItem
    UIMenuItem *ding = [[UIMenuItem alloc] initWithTitle:@"顶" action:@selector(ding:)];
    UIMenuItem *replay = [[UIMenuItem alloc] initWithTitle:@"回复" action:@selector(replay:)];
    UIMenuItem *report = [[UIMenuItem alloc] initWithTitle:@"举报" action:@selector(report:)];
    menu.menuItems = @[ding, replay, report];
    
    // targetRect : MenuController需要指向的矩形框
    // targetView : targetRect会以targetView的左上角为坐标原点
//    [menu setTargetRect:self.frame inView:self.superview];
    [menu setTargetRect:self.bounds inView:self];
    
    
    [menu setMenuVisible:YES animated:YES];
}

@end











