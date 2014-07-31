//
//  webScrapingClass.m
//
//  Created by Semprox Lab of Jacopo Moscioni on 30/12/12.
    //reviewed on 31/07/2014: Translated in English.
//  Copyright (c) 2012 Semprox Lab. All rights reserved.
//

//some methods are not commented because their names are better than a comment!
#import "WebScrapingClass.h"

@implementation WebScrapingClass


+(NSString *)returnsContentPageFrom:(NSString *)link{
    
    //this is a simple method that returns a NSString with webpage content.
    //You can modifify this method using NSURLConnection if you need to do POST requests.
    
    NSData *d;
    if ((d = [NSData dataWithContentsOfURL:[NSURL URLWithString: link]])){
        return [[NSString alloc] initWithData:d encoding: NSASCIIStringEncoding];
    }
    else
        return nil;
}

+(NSString *)returnsContent :(NSString *)content From:(NSString *)here To:(NSString *)there {
    
    NSRange f = [content rangeOfString:here];
    if (f.location != NSNotFound){
        content = [content substringFromIndex:f.location+f.length];
        f = [content rangeOfString:there];
        if (f.location != NSNotFound){
            content= [content substringToIndex:f.location];
            return content;
        }
        else
            return nil;
    }
    else
        return nil;
}


+(NSString *)returnsContentFromTheBeginning:(NSString *)content To:(NSString *)there{
    
    NSRange f = [content rangeOfString:there];
    if (f.location != NSNotFound){
        content = [content substringToIndex:f.location];
        return content;
    }
    else
        return nil;
}


+(NSString *)returnsContent:(NSString *)content After:(NSString *)here{
    
    NSRange f = [content rangeOfString:here];
    if (f.location != NSNotFound){
        content = [content substringFromIndex:f.location+f.length];
        return content;
    }
    else
        return nil;
}


+(NSString*)returnsContent:(NSString *)content From:(NSString *)here To:(NSString *)there startingAfter:(NSString *)jumpingWord{
    
    content = [self returnsContent:content After:jumpingWord];
    if (content == nil)
        return nil;

    content = [self returnsContent:content After:here];
    if (content == nil)
        return nil;
    
    content = [self returnsContentFromTheBeginning:content To:there];
    if (content == nil)
        return nil;
    
    return content;
}


+(NSString *)returnsUpdatedContent:(NSString **)content From:(NSString *)here To:(NSString *)there {
    
    NSString *cuttedContent;
    cuttedContent = [self returnsContent:*content After:here];
    

    if (cuttedContent == nil){
        //cuttedContent is nil. It means that there is not a beginning. So I will go out returning nil.
        return nil;
    }
    
    
    *content = cuttedContent;
    
    cuttedContent = [self returnsContentFromTheBeginning:*content To:there];
    if (cuttedContent == nil)
        return nil;
    
    NSRange f = [*content rangeOfString:there];
    if (f.location != NSNotFound){
        *content = [*content substringFromIndex:f.location+f.length];
    }
    
    return cuttedContent;
}


+(NSString*)returnsUpdatedContent:(NSString **)content From:(NSString *)here To:(NSString*)there Jumping:(NSString *)jumpingWord{
    
    NSString *cuttedContent = [self returnsContent:*content After:jumpingWord];
    if (cuttedContent == nil)
        return nil;
    
    *content = cuttedContent;
    
    cuttedContent = [self returnsContent:*content After:here];
    if (cuttedContent == nil)
        return nil;
    
    *content = cuttedContent;
    
    cuttedContent =    [self returnsContentFromTheBeginning:*content To:there];
    
    if (cuttedContent == nil)
        return nil;
    
    
    NSRange f = [*content rangeOfString:there];
    if (f.location != NSNotFound){
        *content = [*content substringFromIndex:f.location+f.length];
    }
    
    return cuttedContent;
}


+(NSString *)removeHtmlTags:(NSString *)content{
    
    NSRange range;
    while ((range = [content rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        content = [content stringByReplacingCharactersInRange:range withString:@""];
    
    return content;
}


@end
