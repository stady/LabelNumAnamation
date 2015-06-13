//
//  ViewController.m
//  Test
//
//  Created by stady on 15/6/9.
//  Copyright (c) 2015年 stady. All rights reserved.
//

#import "ViewController.h"
#import "PDLableAnimaUtil.h"

@interface ViewController ()<PDLableAnimaDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 50, 320, 90)];
    label.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:label];
    PDLableAnimaUtil *util = [[PDLableAnimaUtil alloc]initWithLabel:label dataSource:self];
    util.textType = PDLablAttribuitedText;
    [util startAnimation];
    
    
    
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(0, 140, 320, 90)];
    label2.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label2];
    PDLableAnimaUtil *util2 = [[PDLableAnimaUtil alloc]initWithLabel:label2 dataSource:self];
    [util2 startAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSArray *)date{
    NSMutableArray  *tempArray = [[NSMutableArray alloc]init];
    
    
    for(int i = 0;i<1000;i++){
        [tempArray addObject: [self getNumberWord:[NSString stringWithFormat:@"%d",i] numberSize:90 wordSize:40 lastWord:@"%"]];
    
    }
    return tempArray;
}
- (NSString *)currentText:(PDLableAnimaUtil *)animalUtil index:(NSInteger)index{
    NSArray *array = [PDLableAnimaUtil defaultArray:1 toNum:1000];
    
    if(index<array.count){
         return array[index];
    }else{
        return nil;
    }
   
}

- (NSAttributedString *)currentAttributedText:(PDLableAnimaUtil *)animalUtil index:(NSInteger)index{
    NSArray *array = [self date];
    
    if(index<array.count){
        return array[index];
    }else{
        return nil;
    }

}



//格式化字符,有不同大小的字体
- (NSAttributedString *)getNumberWord:(NSString *)money numberSize:(CGFloat)numberSize wordSize:(CGFloat)wordSize lastWord:(NSString *)lastWord;
{
    NSString *moneyStr = [NSString stringWithFormat:@"%@%@",money,lastWord];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:moneyStr];
    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:numberSize] range:NSMakeRange(0, money.length)];
    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:wordSize] range:NSMakeRange(money.length, 1)];
    return str;
}
@end
