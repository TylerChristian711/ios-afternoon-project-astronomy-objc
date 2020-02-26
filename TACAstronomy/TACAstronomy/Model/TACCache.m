//
//  TACCache.m
//  TACAstronomy
//
//  Created by Lambda_School_Loaner_218 on 2/25/20.
//  Copyright © 2020 Lambda_School_Loaner_218. All rights reserved.
//

#import "TACCache.h"

@interface TACCache ()

@property (nonnull, nonatomic) NSMutableDictionary *cache;
@property (nonnull, atomic) dispatch_queue_t dispatchQueue;

@end

@implementation TACCache

-(instancetype) init {
    self = [super init];
    if (self) {
        _cache = [[NSMutableDictionary alloc] init];
        _dispatchQueue = dispatch_queue_create("TACAstronomy.PhotoCacheQueue", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

-(void)cacheItem:(id)value forkey:(NSNumber *)key {
    dispatch_sync(self.dispatchQueue, ^{
        [self.cache setObject:value forKey:key];
    });
}

-(id)itemForKey:(NSNumber *)key {
    __block id value;
    dispatch_sync(self.dispatchQueue, ^{
        value = [self.cache objectForKey:key];
    });
    return value;
}

-(id)removeItemForKey:(NSNumber *)key {
    __block id value;
    dispatch_sync(self.dispatchQueue, ^{
        value = [self.cache objectForKey:key];
        [self.cache removeObjectForKey:key];
    });
    return value;
}

-(void)clear {
    dispatch_sync(self.dispatchQueue, ^{
        [self.cache removeAllObjects];
    });
}

@end
