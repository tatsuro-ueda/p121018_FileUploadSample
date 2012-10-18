## Objective-C File Upload Sample

**upload.html** and iOS project in this repository has same function.

upload.html:

	<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></head>
		<body>
	    <form action="http://localhost:4567/upload" enctype="multipart/form-data" method="POST">
	      <input name="file" type="file">
	      <input type="submit" value="upload">
	      <input name="_method" type="hidden" value="put">
	    </form>
	  	</body>
	</html>

iOS upload function:

	- (IBAction)upload:(id)sender {
	    NSURL *url = [NSURL URLWithString:@"http://localhost:4567"];
	    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:url];
	    NSData *imageData = UIImageJPEGRepresentation([UIImage imageNamed:@"test.jpg"], 0.5);
	    NSMutableURLRequest *request = [httpClient multipartFormRequestWithMethod:@"PUT" path:@"/upload" parameters:nil constructingBodyWithBlock: ^(id <AFMultipartFormData>formData) {
	        [formData appendPartWithFileData:imageData name:@"file" fileName:@"test.jpg" mimeType:@"image/jpg"];
	    }];
    
	    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
	    [operation start];
	}

You should pay attention to the `file`. In many case, this should be `filename`.