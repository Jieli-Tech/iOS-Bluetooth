//
//  TransportView.m
//  NewJieliZhiNeng
//
//  Created by EzioChan on 2020/5/19.
//  Copyright © 2020 杰理科技. All rights reserved.
//

#import "TransportView.h"
#import <DFUnits/DFUnits.h>
#import "JLUI_Effect.h"
#import "JL_RunSDK.h"

@interface TransportView(){
 
    __weak IBOutlet UILabel *updateIngLab;
    __weak IBOutlet UIProgressView *progress;
    __weak IBOutlet UILabel *updateTips;
    __weak IBOutlet UIView *centerView;
    __weak IBOutlet UIView *bgView;
    __weak IBOutlet NSLayoutConstraint *bottomHight;
    float  mValue;
}
@end

@implementation TransportView

- (instancetype)init
{
    
    self = [DFUITools loadNib:@"TransportView"];
    if (self) {
        float sW = [DFUITools screen_2_W];
        float sH = [DFUITools screen_2_H];
        self.frame = CGRectMake(0, 0, sW, sH);
//        [JLUI_Effect addShadowOnView_3:centerView];
        CGFloat k = 15;
        bottomHight.constant = 6;
        if (kJL_IS_IPHONE_X) {
            k = 30;
        }
        if (kJL_IS_IPHONE_Xr) {
            k = 30;
            
        }
        if (kJL_IS_IPHONE_Xs_Max) {
            k = 30;
            
        }
        centerView.layer.cornerRadius = k;
        centerView.layer.masksToBounds = YES;
        [progress setProgress:0.0];
        updateIngLab.text = [NSString stringWithFormat:@"%@",kJL_TXT("正在升级")];
        updateTips.text = [NSString stringWithFormat:@"%@ \n %@",kJL_TXT("升级过程请保持蓝牙和网络打开状态"),kJL_TXT("请勿关闭设备")];
    }
    
    return self;
}

static NSString *ota_txt = @"";
-(void)update:(float)value Text:(NSString* __nullable)txt{
//    float vl = 0.0;
//    if (value>1.0f) {
//        vl = 1.0f;
//    }else if(value<0.01f){
//        vl = 0.0f;
//    }else{
//        vl = value;
//    }
    
//    float vl = 0.0;
//    if (value>1.0f) {
//        vl = 1.0f;
//    }else{
//        vl = value;
//    }
//    if (value >= mValue) {
//        mValue = value;
//    }
    [JL_Tools mainTask:^{
        if (txt.length>0) ota_txt = txt;
        NSLog(@"UI progress ---> %.1f",value*100);
        self->updateIngLab.text = [NSString stringWithFormat:@"%@ %.1f%%",ota_txt,value*100];
        [self->progress setProgress:value];
    }];

}




@end
