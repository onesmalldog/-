//
//  LGPDFReader.m
//  DTEN
//
//  Created by 东途 on 16/6/22.
//  Copyright © 2016年 displayten. All rights reserved.
//

#import "LGPDFReader.h"
#import "UIImage+PDF.h"
#import "UIView+Extention.h"
#import "Masonry.h"

@interface LGPDFReader() <UIScrollViewDelegate> {
    NSURL *url;
    CGFloat oldOffset;
}

@property (strong, nonatomic) NSNumber *currentPageNum;

@property (strong, nonatomic) NSMutableArray *array;

@end
@implementation LGPDFReader
- (NSMutableArray *)array {
    if (!_array) {
        _array = [NSMutableArray array];
    }
    return _array;
}
+ (instancetype)readerWithPDFUrl:(NSString *)urlStr frame:(CGRect)frame {
    return [[self alloc]initWithPDFUrl:urlStr frame:frame];
}
- (id)initWithPDFUrl:(NSString *)urlStr frame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        url = [NSURL fileURLWithPath:urlStr];
        self.numberOfPages = [PDFView pageCountForURL:url];
        
        self.currentPage = 1;
//        size = frame.size;
        [self createScrollView];
    }
    return self;
}

- (void)createScrollView {
    
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    scrollView.backgroundColor = [UIColor whiteColor];
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;//去除弹簧效果
    scrollView.delegate = self;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = YES;
    [self addSubview:scrollView];
    self.scrollView = scrollView;
   
    UIImageView *currentImageV = [[UIImageView alloc]init];
    currentImageV.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [scrollView addSubview:currentImageV];
    currentImageV.image = [UIImage originalSizeImageWithPDFURL:url atPage:1];
    self.currentImageView = currentImageV;
    
    UIImageView *topImageV = [[UIImageView alloc]init];
    topImageV.frame = CGRectMake(0, -self.frame.size.height, self.frame.size.width, self.frame.size.height);
    [scrollView addSubview:topImageV];
    self.topImageView = topImageV;
    
    UIImageView *bottomImageV = [[UIImageView alloc]init];
    bottomImageV.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, self.frame.size.height);
    bottomImageV.image = [UIImage originalSizeImageWithPDFURL:url atPage:2];
    [scrollView addSubview:bottomImageV];
    self.bottomImageView = bottomImageV;
    
    scrollView.contentSize = CGSizeMake(0, self.frame.size.height*self.numberOfPages);
}
#pragma mark UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    double page = scrollView.contentOffset.y / scrollView.frame.size.height;
    int current = (int)(page + 0.5)+1;
    if (current > self.currentPage) { // 图片向上
        
        self.pageDirection = ReaderPageDirectionUp;
        self.topImageView.image = self.currentImageView.image;
        self.currentImageView.image = self.bottomImageView.image;
        if (current < self.numberOfPages) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.bottomImageView.image = [UIImage originalSizeImageWithPDFURL:url atPage:current+1];
            });
        }
        
    }
    else if (current < self.currentPage) { // 图片向下
        
        self.pageDirection = ReaderPageDirectionDown;
        self.bottomImageView.image = self.currentImageView.image;
        self.currentImageView.image = self.topImageView.image;
        if (current > 1) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.topImageView.image = [UIImage originalSizeImageWithPDFURL:url atPage:current-1];
            });
        }
    }
    else return;
    
    self.topImageView.y = self.frame.size.height * (current-2);
    self.currentImageView.y = self.frame.size.height * (current-1);
    self.bottomImageView.y = self.frame.size.height * (current);
    
    self.currentPage = current;
}


@end
