#import "NSString+Extended.h"

@implementation NSString (Extended)

-(NSUInteger)indexOf:(NSString *)value
{
    return [self indexOf:value startIndex:0];
}

-(NSUInteger)indexOf:(NSString *)value startIndex:(NSUInteger)startIndex
{
    return [self indexOf:value options:NSLiteralSearch startIndex:startIndex];
}

-(NSUInteger)indexOf:(NSString *)value options:(NSStringCompareOptions)options
{
    return [self indexOf:value options:options startIndex:0];
}

-(NSUInteger)indexOf:(NSString *)value options:(NSStringCompareOptions)options startIndex:(NSUInteger)startIndex
{
    //NSRange range={startIndex,[self length]-startIndex};
    //range=[self rangeOfString:value options:options range:range];
    //return range.location;
    return [self indexOf:value options:options startIndex:startIndex length:[self length]-startIndex];
}

-(NSUInteger)indexOf:(NSString *)value options:(NSStringCompareOptions)options startIndex:(NSUInteger)startIndex length:(NSUInteger)length
{
    NSUInteger reVal=NSNotFound;
    if (startIndex<[self length]) {
        if (startIndex+length>[self length]) {
            length=[self length]-startIndex;
        }
        NSRange range={startIndex,length};
        range=[self rangeOfString:value options:options range:range];
        reVal=range.location;
    }
    return reVal;
}

-(NSString *)substringFromIndex:(NSInteger)startIndex Length:(NSInteger)length;
{
    NSString *reVal=@"";
    if (startIndex>=[self length]) {
    }else{
        NSRange range={startIndex,length};
        if ([self length]<startIndex+length){
            range.location=startIndex;
            range.length=[self length]-startIndex;
        }
        reVal=[self substringWithRange:range];
    }
    return reVal;
}

-(BOOL)isInArray:(NSArray *)list
{
    BOOL reVal=NO;
    for(NSInteger i=0; i<[list count]; i++)
    {
        if ([self isEqualToString:[list objectAtIndex:i]]) {
            reVal=YES;
            break;
        }
    }
    return reVal;
}

+(NSString *)substring:(NSString *)String FromIndex:(NSInteger)startIndex Length:(NSInteger)length;
{
    NSString *reVal=[String substringFromIndex:startIndex Length:length];
    return reVal;
}

-(NSString *)right:(NSInteger)count
{
    NSString *reVal;
    if ([self length]<count) {
        reVal=self;
    }else{
        reVal=[self substringFromIndex:[self length]-count];
    }
    return reVal;
}

-(BOOL)equal:(NSString *)value
{
    BOOL reVal=NO;
    if ([self compare:value]==NSOrderedSame) {
        reVal=YES;
    }
    return reVal;
}

-(NSString *)getUrlDomain
{
    NSString *reVal=@"";
    NSUInteger startIndex,endIndex,length=0;
    //先取“http://”到之后的第一个‘／’之间的字符串，如之后没有‘／’则取"http://"之后的字符串
    startIndex=[self indexOf:@"http://" options:NSCaseInsensitiveSearch];
    if (startIndex!=NSNotFound) {
        endIndex=[self indexOf:@"/" startIndex:7];
        if (endIndex==NSNotFound) {
            length=[self length]-(startIndex+7);
        }else{
            length=endIndex-(startIndex+7);
        }
        reVal=[self substringFromIndex:startIndex+7 Length:length];
    }
    //取一级域名
    if (![reVal equal:@""]) {
        NSMutableArray *array=[[NSMutableArray alloc]init];
        NSUInteger index=[reVal indexOf:@"."];
        if (index!=NSNotFound) {
            while (index!=NSNotFound) {
                [array addObject:[[NSNumber alloc]initWithUnsignedInteger:index]];
                index=[reVal indexOf:@"." startIndex:index+1];
            }
        }
        NSUInteger count=[array count];
        if (count>=2) {
            index=[(NSNumber *)[array objectAtIndex:count-2] unsignedIntegerValue]+1;
            if (index<[reVal length]) {
                reVal=[reVal substringFromIndex:index];
            }
        }
    }
    return reVal;
}

@end
