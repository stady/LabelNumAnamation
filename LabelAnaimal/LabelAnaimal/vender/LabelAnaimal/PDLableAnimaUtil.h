//
//  PDLableAnimaUtil.h
//  Test
//
//  Created by stady on 15/6/12.
//  Copyright (c) 2015年 stady. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef enum {
    PDLablTextNormal = 0,
    PDLablAttribuitedText=1
    
} PDLablTextType;

@protocol PDLableAnimaDelegate;

@interface PDLableAnimaUtil : NSObject
//要展示文字的Label
@property (nonatomic,strong)UILabel *labelToShowText;

@property (nonatomic,strong)id<PDLableAnimaDelegate> dataSource;

@property (nonatomic,assign)double interVal;
@property (nonatomic,assign)PDLablTextType textType;


-(instancetype)initWithLabel:(UILabel *)lable dataSource:(id<PDLableAnimaDelegate>)dataSource;
-(instancetype)initWithLabel:(UILabel *)lable dataSource:(id<PDLableAnimaDelegate>)dataSource interVal:(double)interVal;


-(void)startAnimation;
-(void)stopAnimation;


+(NSArray *)defaultArray:(double)fromNum toNum:(double)toNum;

@end

@protocol PDLableAnimaDelegate <NSObject>
- (NSString *)currentText:(PDLableAnimaUtil *)animalUtil index:(NSInteger)index;
- (NSAttributedString *)currentAttributedText:(PDLableAnimaUtil *)animalUtil index:(NSInteger)index;
@end
