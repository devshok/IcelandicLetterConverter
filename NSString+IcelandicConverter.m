#import "NSString+IcelandicConverter.h"

@implementation NSString (IcelandicConverter)

- (NSString *)returnFormattedStringBy:(NSString *)input {
    
    NSMutableString *result = [NSMutableString string];
    
    char fetchedCharacters[13] = {};
    int fetchedIndexes[13] = {};
    int fetchedCharactersCount = 0;
    unsigned short firstSymbolIndex = 0;
    bool firstSymbolFetched = false;
    
    for (int i = 0; i < input.length; ++i) {
        char symbol = [input characterAtIndex:i];
        if (symbol == '\303') {
            firstSymbolIndex = i;
            firstSymbolFetched = true;
        }
        if (firstSymbolFetched && firstSymbolIndex == i - 1) {
            fetchedCharacters[fetchedCharactersCount] = symbol;
            fetchedIndexes[fetchedCharactersCount] = i - 1;
            ++fetchedCharactersCount;
            firstSymbolFetched = false;
        }
    }
    
    result = [input mutableCopy];
    short int removedOddCharacters = 0;
    
    for (int i = 0; i < fetchedCharactersCount; ++i) {
        
        int index = fetchedIndexes[i];
        char character = fetchedCharacters[i];
        NSRange range = NSMakeRange(index - removedOddCharacters, 2);
        [result deleteCharactersInRange:range];
        
        switch (character) {
            case '\241':
                [result insertString:@"á" atIndex:index - removedOddCharacters];
                break;
            case '\260':
                [result insertString:@"ð" atIndex:index - removedOddCharacters];
                break;
            case '\251':
                [result insertString:@"é" atIndex:index - removedOddCharacters];
                break;
            case '\255':
                [result insertString:@"í" atIndex:index - removedOddCharacters];
                break;
            case '\263':
                [result insertString:@"ó" atIndex:index - removedOddCharacters];
                break;
            case '\272':
                [result insertString:@"ú" atIndex:index - removedOddCharacters];
                break;
            case '\275':
                [result insertString:@"ý" atIndex:index - removedOddCharacters];
                break;
            case '\276':
                [result insertString:@"þ" atIndex:index - removedOddCharacters];
                break;
            case '\246':
                [result insertString:@"æ" atIndex:index - removedOddCharacters];
                break;
            case '\266':
                [result insertString:@"ö" atIndex:index - removedOddCharacters];
                break;
            default:
                break;
        }
        ++removedOddCharacters;
    }
    
    return (NSString *)[result copy];
}

@end