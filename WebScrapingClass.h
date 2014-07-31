//
//  webScrapingClass.h
//
//  Created by Semprox Lab of Jacopo Moscioni on 30/12/12.
    //reviewed on 31/07/2014: Translated in English.
//  Copyright (c) 2012 Semprox Lab. All rights reserved.
//

@interface WebScrapingClass : NSObject;

+(NSString *)returnsContentPageFrom:(NSString *)link;

+(NSString *)returnsContent :(NSString *)content From:(NSString *)here To:(NSString *)there;

+(NSString *)returnsContentFromTheBeginning:(NSString *)content To:(NSString *)there;

+(NSString *)returnsContent:(NSString *)content After:(NSString *)here;

+(NSString*)returnsContent:(NSString *)content From:(NSString *)here To:(NSString *)there startingAfter:(NSString *)jumpingWord;

+(NSString *)returnsUpdatedContent:(NSString **)content From:(NSString *)here To:(NSString *)there;

+(NSString*)returnsUpdatedContent:(NSString **)content From:(NSString *)here To:(NSString*)there Jumping:(NSString *)jumpingWord;

+(NSString *)removeHtmlTags:(NSString *)content;

@end
