//
//  LGPDFReader.h
//  DTEN
//
//  Created by 东途 on 16/6/22.
//  Copyright © 2016年 displayten. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ReaderPageDirectionUp,
    ReaderPageDirectionDown
} ReaderPageDirection;
@interface LGPDFReader : UIView

/** 当前哪一张 */
@property (assign, nonatomic) NSUInteger currentPage;
/** 图片的方向 */
@property (assign, nonatomic) ReaderPageDirection pageDirection;
@property (weak, nonatomic) UIScrollView *scrollView;

@property (assign, nonatomic) NSUInteger numberOfPages;

/** 当前屏幕的图片 */
@property (weak, nonatomic) UIImageView *currentImageView;
/** 上面一张 */
@property (weak, nonatomic) UIImageView *topImageView;
/** 下面一张 */
@property (weak, nonatomic) UIImageView *bottomImageView;

/** 初始化 */
+ (instancetype)readerWithPDFUrl:(NSString *)urlStr frame:(CGRect)frame;

@end
