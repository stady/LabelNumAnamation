//
//  PDLableAnimaUtil.m
//  Test
//
//  Created by stady on 15/6/12.
//  Copyright (c) 2015年 stady. All rights reserved.
//

#import "PDLableAnimaUtil.h"

#define PDLableAnimaUtil_interVal_defalut  0.05

@implementation PDLableAnimaUtil
{
    NSTimer *_timer;
    NSInteger  currentIndex;
    

}

#pragma  mark - init方法
-(instancetype)initWithLabel:(UILabel *)lable dataSource:(id<PDLableAnimaDelegate>)dataSource interVal:(double)interVal{
    self = [self init];
    if (self) {
        self.dataSource = dataSource;
        self.labelToShowText = lable;
        self.interVal = interVal;
    }
    return self;
}

-(instancetype)initWithLabel:(UILabel *)lable dataSource:(id<PDLableAnimaDelegate>)dataSource{
    return [self initWithLabel:lable dataSource:dataSource interVal:_interVal];
}
#pragma  mark 开始动画
-(void)startAnimation{
    currentIndex = 0;
    _timer = [NSTimer scheduledTimerWithTimeInterval:_interVal target:self selector:@selector(updateUI) userInfo:nil repeats:YES];
    
}
-(void)stopAnimation{
    currentIndex = 0;
    [_timer invalidate];
}
//结束动画
-(void)updateUI{
    switch (self.textType) {
        case PDLablAttribuitedText:
            if ([self showAttributedText]) {
                currentIndex ++;
            }else{
                [self stopAnimation];
            }
            break;
            
        default:
            if ([self showText]) {
               currentIndex ++;
            }else{
                [self stopAnimation];
            }
            break;
    }

}

-(BOOL)showText{
    if (self.dataSource&&[self.dataSource respondsToSelector:@selector(currentText:index:)]) {
        NSString *text = [self.dataSource currentText:self index:currentIndex];
        if (text) {
            self.labelToShowText.text = text;
            return YES;
        }
    }
    return NO;
}
-(BOOL)showAttributedText{
    if (self.dataSource&&[self.dataSource respondsToSelector:@selector(currentAttributedText:index:)]) {
        NSAttributedString *text = [self.dataSource currentAttributedText:self index:currentIndex];
        if (text) {
            self.labelToShowText.attributedText = text;
            return YES;
        }
    }
    return NO;
}

+(NSArray *)defaultArray:(double)fromNum toNum:(double)toNum{
    double step =100;
    double stepValue =(toNum-fromNum)/step;
    NSMutableArray *resultArray = [[NSMutableArray alloc]init];
    double value = fromNum;
    for (int i=0; i<step+2;i++ ) {
        value = fromNum+i*stepValue;
        if (value>toNum) {
            value = toNum;
            [resultArray addObject:[NSString stringWithFormat:@"%.2f",value]];
            break;
        }else{
            [resultArray addObject:[NSString stringWithFormat:@"%.2f",value]];
        }
        
    }
    return  resultArray;
    
}



@end
