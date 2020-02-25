//
//  TACMarsSol.m
//  TACAstronomy
//
//  Created by Lambda_School_Loaner_218 on 2/24/20.
//  Copyright © 2020 Lambda_School_Loaner_218. All rights reserved.
//

#import "TACMarsSol.h"

static NSDateFormatter *_dateFormatter;

@interface TACMarsSol ()

+ (NSDateFormatter *)dateFormatter;

@end

@implementation TACMarsSol

-(instancetype) initWithIdNumber:(NSNumber *)idNumber
                             sol:(NSNumber *)sol
                        imageURL:(NSString *)imageURL
                          camera:(TACMarsCamera *)camera
                       earthDate:(NSDate *)earthDate {
    self = [super init];
    if (self) {
        _idNumber = idNumber;
        _sol = sol;
        _imageURL = [imageURL copy];
        _camera = camera;
        _earthDate = earthDate;
    }
    return self;
}

-(instancetype) initWithDictionary:(NSDictionary *)dictionary {
    NSNumber *idNumber = dictionary[@"id"];
    NSNumber *sol = dictionary[@"sol"];
    NSString *imageURL = dictionary[@"img_src"];
    NSString *earthDateString = dictionary[@"earth_date"];
    NSDate *earthDate = [[TACMarsSol dateFormatter] dateFromString:earthDateString];
    NSDictionary *cameraDictionary = dictionary[@"camera"];
    TACMarsCamera *camera = [[TACMarsCamera alloc] initWithDictionary:cameraDictionary];
    self = [self initWithIdNumber:idNumber sol:sol imageURL:imageURL camera:camera earthDate:earthDate];
    return self;
}

+ (NSDateFormatter *)dateFormatter {
    if (_dateFormatter) {
        return _dateFormatter;
    } else {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-DD"];
        return formatter;
    }
}

@end
