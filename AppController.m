// 
// Copyright (c) 2011 Shun Takebayashi
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
// 

#import "AppController.h"

@implementation AppController

- (void)archive:(id)sender {
	NSURL *sourceUrl = [NSURL URLWithString:[sender stringValue]];
	STWebArchiver *archiver = [[STWebArchiver alloc] init];
	archiver.delegate = self;
	[archiver archiveHTMLData:[NSData dataWithContentsOfURL:sourceUrl]
				 textEncoding:@"UTF-8"
					  baseURL:sourceUrl];
}

- (void)archiver:(STWebArchiver *)archiver didFinishArchiving:(NSData *)archivedData {
	[archivedData writeToFile:@"/Users/shun/Desktop/SampleWebArchive.webarchive" atomically:YES];
	[archiver release];
}

@end
