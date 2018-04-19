#import <Foundation/Foundation.h>

@interface NSString (Extended)

/*
 indexOf方法options取值
 NSCaseInsensitiveSearch = 1,//不区分大小写比较
 NSLiteralSearch = 2,//区分大小写比较
 NSBackwardsSearch = 4,//从字符串末尾开始搜索
 NSAnchoredSearch = 8,//搜索限制范围的字符串
 */
-(NSUInteger)indexOf:(NSString *)value;
-(NSUInteger)indexOf:(NSString *)value startIndex:(NSUInteger)startIndex;
-(NSUInteger)indexOf:(NSString *)value options:(NSStringCompareOptions)options;
-(NSUInteger)indexOf:(NSString *)value options:(NSStringCompareOptions)options startIndex:(NSUInteger)startIndex;
-(NSUInteger)indexOf:(NSString *)value options:(NSStringCompareOptions)options startIndex:(NSUInteger)startIndex length:(NSUInteger)length;
-(BOOL)isInArray:(NSArray *)list;

-(BOOL)equal:(NSString *)value;
-(NSString *)substringFromIndex:(NSInteger)startIndex Length:(NSInteger)length;
-(NSString *)getUrlDomain;
-(NSString *)right:(NSInteger)count;

+(NSString *)substring:(NSString *)String FromIndex:(NSInteger)startIndex Length:(NSInteger)length;

@end
