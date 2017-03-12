@RestResource(urlMapping='/myservice')
global class AwsServiceClass {
    @HttpPost
    global static void AwsImageUploadMethod() {
                
        //To get the response from AWS 
        RestRequest req = RestContext.request;
        string filebody = req.requestBody.toString();
        system.debug('@@123'+string.valueof(filebody));
        
         //Parse the Jason Received from AWS  
        string bodyMessage = '';
        string JSONResponseFromAWS = filebody;
        JSONParser parser = JSON.createParser(JSONResponseFromAWS);
        while (parser.nextToken() != null) {
            if (parser.getCurrentToken() == JSONToken.START_OBJECT) {
                while (parser.nextValue() != null){
                    String fieldName = parser.getCurrentName();
                    if(fieldName == 'Message'){
                        bodyMessage = parser.getText();
                        break;
                    }
                }
                if(bodyMessage != ''){
                    break;
                }
            }
        }
        
        system.debug(bodyMessage);
        string fileName = '';
        string eventName = '';
        
        string JSONResponseMessageFromAWS = bodyMessage;
        
        JSONParser parser1 = JSON.createParser(JSONResponseMessageFromAWS);
        while (parser1.nextToken() != null) {
            if (parser1.getCurrentToken() == JSONToken.START_OBJECT) {
                
                while (parser1.nextValue() != null){
                    String fieldName = parser1.getCurrentName();
                    if(fieldName == 'key'){
                        fileName = parser1.getText();
                        break;
                    }
                    if(fieldName == 'eventName'){
                        eventName = parser1.getText();
                        break;
                    }
                }
                if(fileName != ''){
                    break;
                }
            }
        }
        
                
        string downloadurl = 'https://s3-us-west-2.amazonaws.com/akumdocs/'+fileName;
        system.debug(':::downloadurl ::' +downloadurl );

        
          Attachment attachment = new Attachment();
          attachment.Body = Blob.valueOf(downloadurl );
          attachment.Name = String.valueOf(downloadurl );
          attachment.ParentId = '0069000000UV8QS'; 
          insert attachment;
        
       
        
    }
    
}