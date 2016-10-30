//
//  Connection.m
//  Projeto_IOS
//
//  Created by Rodrigo Nóbrega on 10/30/16.
//  Copyright © 2016 iesb. All rights reserved.
//

#import "Connection.h"


@implementation Connection




+ (void) estabelecimentos:(void(^)(NSArray<Estabelecimento *> *especialidadesArray)) block {
    
    
    

    NSURL *url = [NSURL URLWithString:@"http://andremurta.esy.es/ios/select.php"];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    dispatch_async(dispatch_get_main_queue(), ^{
        [NSURLConnection sendAsynchronousRequest:urlRequest queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
         {
             
             
             if (error) {
                 
                 NSLog(@"Error,%@", [error localizedDescription]);
                 block([NSArray<Estabelecimento *> new]);
             } else {
                 
                 NSError *error = nil;
                 NSDictionary *responseObj = [self createResponse:data error:&error];
                 
                 if(!error) {
                     NSMutableArray* estabelecimentosRetorno = [NSMutableArray new];
                     for (NSArray* a in responseObj) {
                         for (NSDictionary *estabDict in a) {
                             Estabelecimento* e = [[Estabelecimento alloc] initWithDicitionary:estabDict];
                             [estabelecimentosRetorno addObject:e];
                         }
                         
                     }
                     block(estabelecimentosRetorno);
                     
                 } else {
                     NSLog(@"Error in parsing JSON");
                 }
                 
             }
         }];
    });
    
}

+ (NSDictionary *)createResponse:(NSData *)data error:(NSError **)error {
    
    NSString* jsonString = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
    NSData* jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];

    return [NSJSONSerialization
            JSONObjectWithData:jsonData
            options:0
            error:error];
}


@end
