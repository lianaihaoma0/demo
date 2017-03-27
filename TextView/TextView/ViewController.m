//
//  ViewController.m
//  TextView
//
//  Created by JeLon_Cai on 2016/11/3.
//  Copyright © 2016年 JeLon_Cai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *html = @"<p>AC米兰官方宣布阿莱格里下课</p><i><u>北京时间1月13日晚6时，意甲AC米兰俱乐部官方宣布主帅阿莱格里下课。昨天的意甲第19轮比赛中，AC米兰客场3比4不敌升班马萨索洛，比赛结束之后就传出了阿莱格里将会被解雇的消息。</i></u>米兰的官方公告中写道：“阿莱格里先生和他的助手们将不再担任球队一线队教练的工作，对此我们非常遗憾，感谢阿莱格里和他的团队几年来为俱乐部做出的贡献，祝愿他在未来的工作中继续取得成功,此前意大利方面的消息都是在阿莱格里下课后，前米兰球星因扎吉将暂时接手球队，<i>不过米兰官方公告中称球队的训练和比赛任务暂时由助理教练毛罗-塔索蒂负责。</i>阿莱格里在2010年世界杯后上任成为AC米兰队主教练，带队第一个赛季就帮助米兰七年后重夺意甲联赛冠军，随后又率队在北京击败国米夺得意大利超级杯，第二个赛季米兰战绩同样不错，<u><p>可惜在关键一战中因为裁判的误判失去了一个重要进球，米兰在联赛冠军的争夺中输给了尤文</u>图斯，后面两个赛季米兰阵容人员不整</p>，不过阿莱格里还是率队赢得了上赛季的第三名，从而获得本赛季欧冠参赛资格。新赛季米兰战绩比上赛季还差，主帅阿莱格里终于被解职。";
//    NSString *test = [self flattenHTML:html trimWhiteSpace:YES];
    NSString *test = [self flattenHTML:html];
    NSLog(@"%@",test);
}


- (NSString *)flattenHTML:(NSString *)html trimWhiteSpace:(BOOL)trim {
    NSScanner *theScanner = [NSScanner scannerWithString:html];
    NSString *text = nil;
    
    while ([theScanner isAtEnd] == NO) {
        // find start of tag
        [theScanner scanUpToString:@"<" intoString:NULL] ;
        // find end of tag
        [theScanner scanUpToString:@">" intoString:&text] ;
        // replace the found tag with a space
        //(you can filter multi-spaces out later if you wish)
        html = [html stringByReplacingOccurrencesOfString:
                [ NSString stringWithFormat:@"%@>", text]
                                               withString:@""];
        //NSLog(@"html==%@",html);
    }
    html = [html stringByReplacingOccurrencesOfString:@" " withString:@""];
    // trim off whitespace
    
    return trim ? [html stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] : html;
}

- (NSString *)flattenHTML:(NSString *)html {
    
    NSScanner *theScanner;
    NSString *text = nil;
    
    theScanner = [NSScanner scannerWithString:html];
    
    while ([theScanner isAtEnd] == NO) {
        
        // find start of tag
        [theScanner scanUpToString:@"<" intoString:NULL] ;
        
        // find end of tag
        [theScanner scanUpToString:@">" intoString:&text] ;
        
        // replace the found tag with a space
        //(you can filter multi-spaces out later if you wish)
        html = [html stringByReplacingOccurrencesOfString:
                [ NSString stringWithFormat:@"%@>", text]
                                               withString:@""];
    }
    
    return html;
    
}

@end
