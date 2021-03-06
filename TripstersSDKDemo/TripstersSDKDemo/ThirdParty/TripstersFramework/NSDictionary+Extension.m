//
//  NSDictionary+Extension.m
//  CRM
//
//  Created by TimTiger on 5/15/14.
//  Copyright (c) 2014 TimTiger. All rights reserved.
//

#import "NSDictionary+Extension.h"
#import "NSString+Extension.h"
#import "NSArray+Extension.h"

@implementation NSMutableDictionary (Extension)

- (void)setIntValue:(NSInteger)value forKey:(NSString *)key {
    [self setObject:[NSString stringWithFormat:@"%ld",(long)value] forKey:key];
}

- (void)addValue:(id)value forKey:(NSString *)key {
    if (value != nil) {
        [self setObject:value forKey:key];
    }
}

@end

@implementation NSDictionary (Extension)

+(BOOL)hasContent:(NSDictionary *)dictonary {
    if (dictonary == nil) {
        return NO;
    }
    
    if ([dictonary isKindOfClass:[NSNull class]]) {
        return NO;
    }
    
    if (dictonary.count < 1) {
        return NO;
    }
    return YES;
}

- (NSString *)stringForKey:(NSString *)aKey {
    NSString *stringValue = (NSString *)[self objectForKey:aKey];
    if ([NSString hasContent:stringValue]) {
        return stringValue;
    }
    return @"";
}

- (NSArray *)arrayForKey:(NSString *)aKey {
    NSArray *arrayValue = (NSArray *)[self objectForKey:aKey];
    if ([NSArray hasContent:arrayValue]) {
        return arrayValue;
    }
    return [[NSArray alloc] init];
}

- (NSDictionary *)dictionaryForKey:(NSString *)aKey {
    NSDictionary *dictionaryValue = (NSDictionary *)[self objectForKey:aKey];
    if ([NSDictionary hasContent:dictionaryValue]) {
        return dictionaryValue;
    }
    return [[NSDictionary alloc] init];
}

- (NSData *)dataForKey:(NSString *)aKey {
    if (![self objectForKey:aKey] || !aKey) {
        return nil;
    }
    
    id value = [self objectForKey:aKey];
    if ([value isKindOfClass:[NSData class]]) {
        return value;
    }
    
    return nil;
}

- (NSInteger)integerForKey:(NSString *)aKey {
   return [self integerForKey:aKey placeholder:0];
}

- (NSInteger)integerForKey:(NSString *)aKey placeholder:(NSInteger)placeholder {
    if (![self objectForKey:aKey] || !aKey) {
        return placeholder;
    }
    
    id value = [self objectForKey:aKey];
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value integerValue];
    }
    
    if ([value isKindOfClass:[NSString class]]) {
        if ([value integerValue]) {
            return [value integerValue];
        }
    }
    
    return placeholder;
}

- (float)floatForKey:(NSString *)aKey {
    if (![self objectForKey:aKey] || !aKey) {
        return 0;
    }
    
    id value = [self objectForKey:aKey];
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value floatValue];
    }
    
    if ([value isKindOfClass:[NSString class]]) {
        if ([value floatValue]) {
            return [value floatValue];
        }
    }
    
    return 0;
}

- (double)doubleForKey:(NSString *)aKey {
    if (![self objectForKey:aKey] || !aKey) {
        return 0;
    }
    
    id value = [self objectForKey:aKey];
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value doubleValue];
    }
    
    if ([value isKindOfClass:[NSString class]]) {
        if ([value doubleValue]) {
            return [value doubleValue];
        }
    }
    
    return 0;
}

- (BOOL)boolForKey:(NSString *)aKey {
    if (![self objectForKey:aKey] || !aKey) {
        return NO;
    }
    
    id value = [self objectForKey:aKey];
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value boolValue];
    }
    
    if ([value isKindOfClass:[NSString class]]) {
        if ([value boolValue]) {
            return [value boolValue];
        }
    }
    
    return NO;
}

@end
