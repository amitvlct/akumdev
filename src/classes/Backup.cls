public with sharing class Backup {
/*
 //25 March  To Execute - Database.executeBatch(new  createCSVFileForIdex());
global class createCSVFileForIdex implements Database.batchable<sObject>,Database.stateful,Database.AllowsCallouts {
	global String query;
    global String headerString = '';
    global  String bodyString = '';
    global  Id idOfRecordTypeForCertifiedStones;
    
    global createCSVFileForIdex(){
        
        
        
        for(RecordType recordTypeObj : [ Select Id, Name from RecordType where sObjectType = 'Product2' and isActive = true ]){
            if(null != recordTypeObj && recordTypeObj.Name.containsIgnoreCase('WPS Single Stone') ){
                idOfRecordTypeForCertifiedStones = recordTypeObj.Id;
            }
        }
        
        query = 'Select Name,'
                        + 'Shape__c,'
                        + 'Carats__c,'
                        + 'Color__c,'	
                        + 'Fancy_Color_Primary_Tone__c,'
                        + 'Fancy_Color_Grade__c,'
                        + 'Fancy_Color_Secondary_Tone__c,'
                        + 'Clarity__c,'
                        + 'Treatment__c,'
                        + 'Report_Agency__c,'
                        + 'Report_Number__c,'
                        + 'Sell_Price__c,'
                        + 'Final_Cut__c,'
                        + 'Polish__c,'
                        + 'Symmetry__c,'
                        + 'Length__c,'
                        + 'Width__c,'
                        + 'Depth__c,'
                        + 'Depth_percent__c,'
                        + 'Table_percent__c,'
                        + 'Girdle_Min__c,'
                        + 'Girdle_Max__c,'
                        + 'Culet_Size__c,' 
                        + 'Fluorescence__c,'
                        + 'Quantity_on_Hand__c FROM Product2 where recordTypeId = :idOfRecordTypeForCertifiedStones AND Available_for_Sale__c = false AND Report_Agency__c != \'\' AND Report_Agency__c != \'null\'  AND Total_Quantity__c > 0 ' ;
        
         System.debug('query ::' +query);
       //Header
       //headerString =  'Name1,Shape2,Carats3,Color4,Fancy_Color_Primary_Tone5,Fancy_Color_Grade6,Fancy_Color_Secondary_Tone7,BLANKFIELD8,Clarity9,Treatment10,Report_Agency11,Report_Number12,Sell_Price13,BLANKFIELD14,BLANKFIELD15,Final_Cut16,Polish17,Symmetry18,Length19,Width20,Depth21,Depth_percent22,Table_percent23,BLANKFIELD24,BLANKFIELD25,Girdle_Min26,Girdle_MAX27,Culet_Size28,BLANKFIELD29,BLANKFIELD30,Fluorescence31,BLANKFIELD32,COUNTRY33,CITY34,BLANKFIELD35,BLANKFIELD36,BLANKFIELD37,BLANKFIELD38,BLANKFIELD39,BLANKFIELD40,QuantityOnHand41,BLANKFIELD42'+'\n';
       headerString =  'Supplier Stock Ref,Cut (Shape),Carat,Color,Natural Fancy Color,Natural Fancy Intensity,Natural Fancy Overtone,Treated Color,Clarity,Enhancement,Grading Lab,Certificate Number,Asking Price Per Carat,Last Price Per Carat,% off RAP List,Make (Cut Grade),Polish,Symmetry,Length,Width,Height,Depth,Table,Crown Height,Pavilion Depth,Girdle From,Girdle To,Culet Size,Culet Condition,Graining,Fluorescence Intensity,Fluorescence Color,Country,State / Region,Certificate File,Image File,Online Report,Pair Stock Ref,Pair is Seperable,Asking Price for Pair,Guaranteed Availability,Remarks'+'\n';
    }
    // Start Method
    global Database.QueryLocator start(Database.BatchableContext BC){
        
        return Database.getQueryLocator(query);
    }
    
    // Execute Logic
    global void execute(Database.BatchableContext BC, List<sObject> scope){
        try{
            
            for(sObject certifiedDiamond : scope){
                Product2 certifiedDiamondTemp = (Product2)certifiedDiamond;
              //1C
                if(null == certifiedDiamondTemp.Name){
                    bodyString +='"'+'","';
                }
                else{
                    bodyString += '"'+certifiedDiamondTemp.Name+'","';
                }
                
                //2c
                if(null == certifiedDiamondTemp.Shape__c){
			 		bodyString +=''+'","';
				}else{
                bodyString += certifiedDiamondTemp.Shape__c+'","';
                }
                //3c
                if(null == certifiedDiamondTemp.Carats__c){
			 		bodyString +=''+'","';
				}else{
                bodyString += certifiedDiamondTemp.Carats__c+'","';
                }
                
                
                //4c
                if( certifiedDiamondTemp.Color__c == 'D' || certifiedDiamondTemp.Color__c == 'E' || 
                    certifiedDiamondTemp.Color__c == 'G' || certifiedDiamondTemp.Color__c == 'F' ||
                    certifiedDiamondTemp.Color__c == 'I' || certifiedDiamondTemp.Color__c == 'H' ||
                    certifiedDiamondTemp.Color__c == 'K' || certifiedDiamondTemp.Color__c == 'J' ||
                    certifiedDiamondTemp.Color__c == 'M' || certifiedDiamondTemp.Color__c == 'L' ||
                    certifiedDiamondTemp.Color__c == 'O' || certifiedDiamondTemp.Color__c == 'N' ||
                    certifiedDiamondTemp.Color__c == 'Q' || certifiedDiamondTemp.Color__c == 'P' ||
                    certifiedDiamondTemp.Color__c == 'S' || certifiedDiamondTemp.Color__c == 'R' ||
                    certifiedDiamondTemp.Color__c == 'U' || certifiedDiamondTemp.Color__c == 'T' ||
                    certifiedDiamondTemp.Color__c == 'W' || certifiedDiamondTemp.Color__c == 'V' ||
                    certifiedDiamondTemp.Color__c == 'Y' || certifiedDiamondTemp.Color__c == 'X'|| certifiedDiamondTemp.Color__c == 'Z')
                     { 
					   bodyString +=certifiedDiamondTemp.Color__c+'","';
				     }
				
				else{
            		//Leave Blank
                bodyString += ''+'","';  
				}
                //5c
                
                if(null == certifiedDiamondTemp.Fancy_Color_Primary_Tone__c){
			 		bodyString +=''+'","';
				}else{
                bodyString += certifiedDiamondTemp.Fancy_Color_Primary_Tone__c+'","';
                }
                //6c
                if(null == certifiedDiamondTemp.Fancy_Color_Grade__c){
			 		bodyString +=''+'","';
				}else{
                bodyString += certifiedDiamondTemp.Fancy_Color_Grade__c+'","';
                }
                //7c
                if(null == certifiedDiamondTemp.Fancy_Color_Secondary_Tone__c){
			 		bodyString +=''+'","';
				}else{
                bodyString += certifiedDiamondTemp.Fancy_Color_Secondary_Tone__c+'","';
                }
                // 8c Leave Blank
                bodyString += ''+'","';
                // 9c
                if(null == certifiedDiamondTemp.Clarity__c){
			 		bodyString +=''+'","';
				}else{
                bodyString += certifiedDiamondTemp.Clarity__c+'","';
                }
                //10c
                if(null == certifiedDiamondTemp.Treatment__c){
			 		bodyString +=''+'","';
				}else{
                bodyString += certifiedDiamondTemp.Treatment__c+'","';
                }
                //11c
                if(null == certifiedDiamondTemp.Report_Agency__c){
			 		bodyString +=''+'","';
				}else{
                bodyString += certifiedDiamondTemp.Report_Agency__c+'","';
                }
                //12c
                if(null == certifiedDiamondTemp.Report_Number__c){
			 		bodyString +=''+'","';
				}else{
                bodyString += certifiedDiamondTemp.Report_Number__c+'","';
                }
                //13c
                if(null == certifiedDiamondTemp.Sell_Price__c){
			 		bodyString +=''+'","';
				}else{
                bodyString += certifiedDiamondTemp.Sell_Price__c+'","';
                }
                //14cLeave Blank
                bodyString += ''+'","';
                //15cLeave Blank
                bodyString += ''+'","';
                //16c
                if(null == certifiedDiamondTemp.Final_Cut__c){
			 		bodyString +=''+'","';
				}else{
                bodyString += certifiedDiamondTemp.Final_Cut__c+'","';
                }
                //17c
                if(null == certifiedDiamondTemp.Polish__c){
			 		bodyString +=''+'","';
				}else{
                bodyString += certifiedDiamondTemp.Polish__c+'","';
                }
                //18c
                if(null == certifiedDiamondTemp.Symmetry__c){
			 		bodyString +=''+'","';
				}else{
                bodyString += certifiedDiamondTemp.Symmetry__c+'","';
                }
                //19c
                if(null == certifiedDiamondTemp.Length__c){
			 		bodyString +=''+'","';
				}else{
                bodyString += certifiedDiamondTemp.Length__c+'","';
                }
                //20c
                if(null == certifiedDiamondTemp.Width__c){
			 		bodyString +=''+'","';
				}else{
                bodyString += certifiedDiamondTemp.Width__c+'","';
                }
                //21c
                if(null == certifiedDiamondTemp.Depth__c){
			 		bodyString +=''+'","';
				}else{
                bodyString += certifiedDiamondTemp.Depth__c+'","';
                }
                
                //22c(To be changed trim % sign)
                if(null == certifiedDiamondTemp.Depth_percent__c){
			 		bodyString +=''+'","';
				}else{
                bodyString += certifiedDiamondTemp.Depth_percent__c+'","';
                }
               //23c(To be changed trim % sign)
                if(null == certifiedDiamondTemp.Table_percent__c){
			 		bodyString +=''+'","';
				}else{
                bodyString += certifiedDiamondTemp.Table_percent__c+'","';
                }
               //24cLeave Blank
                bodyString += ''+'","';
                //25cLeave Blank
                bodyString += ''+'","';
               //26c
                if(null == certifiedDiamondTemp.Girdle_Min__c){
			 		bodyString +=''+'","';
				}else{
                bodyString += certifiedDiamondTemp.Girdle_Min__c+'","';
                }
               //27c
                if(null == certifiedDiamondTemp.Girdle_Max__c){
			 		bodyString +=''+'","';
				}else{
                bodyString += certifiedDiamondTemp.Girdle_Max__c+'","';
                }
                //28c
                if(null == certifiedDiamondTemp.Culet_Size__c){
			 		bodyString +=''+'","';
				}else{
                	bodyString += certifiedDiamondTemp.Culet_Size__c+'","';
                }
                //29cLeave Blank
                bodyString += ''+'","';
                //30cLeave Blank
                bodyString += ''+'","';
                //31c
                if(null == certifiedDiamondTemp.Fluorescence__c){
			 		bodyString +=''+'","';
				}else{
                bodyString += certifiedDiamondTemp.Fluorescence__c+'","';
                }
                //32cLeave Blank
                bodyString += ''+'","';
                //33c
                bodyString += 'USA'+'","';
               //34c
                bodyString += 'New York'+'","';
                //35cLeave Blank
                bodyString += ''+'","';
                //36cLeave Blank
                bodyString += ''+'","';
                //37cLeave Blank
                bodyString += ''+'","';
                //38cLeave Blank
                bodyString += ''+'","';
                //39cLeave Blank
                bodyString += ''+'","';
                //40cLeave Blank
                bodyString += ''+'","';
                //41c
                if(certifiedDiamondTemp.Quantity_on_Hand__c > 0){
                    bodyString += 'Yes'+'","';
                }
                else{
                    bodyString += 'No'+'","';
                }
                //42cLeave Blank
                bodyString += ''+'"';
         	
			    bodyString += '\n';
		                
	            System.debug('bodyString Length ::'+ bodyString.length());
            
        }
        }
        catch(Exception excep){
            System.debug('Error - Could not generate file ' + excep.getMessage());
        }
        }
        
    //Finish logic
    global void finish(Database.BatchableContext BC){
        
        //HttpRequest jtt =  new HttpRequest();
		//jtt.setEndPoint('https://technet.rapaport.com/HTTP/Authenticate.aspx');
		//jtt.SetMethod('POST');
		//jtt.setBody('username=jmellet&password=jmellet5355');
		//jtt.SetHeader('Contenttype','application/x-www-form-urlencoded');
		//Http htt = new Http();
		//HttpResponse gt  =htt.send(jtt);
		//system.Debug(gt.getBody());
        
        
        System.debug('bodyString Length ::'+ bodyString.length());
        bodyString = headerString+bodyString; 
        system.debug('@@bodystring'+bodyString);
        blob csvBlob = Blob.valueOf(bodyString);
        string csvname= 'IdexCertDiamond.csv';
        //UtilityClass.transferFileToFTP(csvname,csvBlob);//(Used to create the csv file on clients end in a specific folder)
		//Attachment att = [SELECT id ,body FROM ATtachment WHERE Parentid = '0019000001BVFJ2'];
		//RapnetService.uploadFile(csvBlob,'RapnetCertDiamond.csv','https://technet.rapaport.com/HTTP/Upload/Upload.aspx?Method=file&ticket='+gt.getBody()+'&ReplaceAll=true&ReportOption=None');
		        
        
 //-----------------------------------------------------------------------------------------------------------------------------------------       
       
        Messaging.EmailFileAttachment csvAttc = new Messaging.EmailFileAttachment();
        csvAttc.setFileName(csvname);
        csvAttc.setBody(csvBlob);
        Messaging.SingleEmailMessage email =new Messaging.SingleEmailMessage();
        String[] toAddresses = new list<string> {'amit.kumar@algoworks.com','udit.gauba@gmail.com'};
        String subject ='IdexCertifiedDiamond CSV';
        email.setSubject(subject);
        email.setToAddresses( toAddresses );
        email.setPlainTextBody(' CSV ');
        email.setFileAttachments(new Messaging.EmailFileAttachment[]{csvAttc});
        //HttpResponse response = CsvAttachment(csvBlob,csvname);
        Messaging.SendEmailResult [] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
        
   
    }
    
}
THE END
THE START
FOR POLYGON
// Color a,b,c--Z in doubt
   global class createCSVFileForPolygon implements Database.batchable<sObject>,Database.stateful,Database.AllowsCallouts {
	global String query;
	global String filename = '';//Used to allocate date in file name
	global String csvname = '';
    global String headerString = '';
    global  String bodyString = ''; 
    global  Id idOfRecordTypeForCertifiedStones;
     
    global createCSVFileForPolygon(){
        
        for(RecordType recordTypeObj : [ Select Id, Name from RecordType where sObjectType = 'Product2' and isActive = true ]){
            if(null != recordTypeObj && recordTypeObj.Name.containsIgnoreCase('WPS Single Stone') ){
                idOfRecordTypeForCertifiedStones = recordTypeObj.Id;
            }
        }
        
        query = 'Select Name,'
                        + 'Shape__c,'   //====REQ
                        + 'Carats__c,'  //====REQ
                        + 'Color__c,'	//====REQ
                        + 'Clarity__c,' //====REQ
                        + 'Sell_Price__c,'//===REQ
                        + 'Length__c,'
                        + 'Width__c,'
                        + 'Depth__c,'
                        + 'Report_Agency__c,'
                        + 'Report_Number__c,'
                        + 'Stone_Size__c,'
                        + 'Depth_percent__c,'
                        + 'Table_percent__c,'
                        + 'Crown_Angle__c,'
                        + 'Fluorescence__c,'
                        + 'Crown_Height__c,'
                        + 'Pavilion_Angle__c,'
                        + 'Pavilion_Depth__c,'
                        + 'Girdle_Min__c,'
                        + 'Girdle_Max__c,'
                        + 'Culet_Size__c,' 
                        + 'Polish__c,'
                        + 'Symmetry__c,'
                        + 'Fluorescence_Color__c,'
                        + 'Fluorescence_Intensity__c,'
                        + 'Treatment__c,'
                        + 'Fancy_Color_Primary_Tone__c,'
                        + 'Fancy_Color_Grade__c,'
                        + 'Fancy_Color_Secondary_Tone__c,'
                        + 'Final_Cut__c,'                      
                        + 'Quantity_on_Hand__c FROM Product2 where recordTypeId = :idOfRecordTypeForCertifiedStones AND Available_for_Sale__c = false AND Report_Agency__c != \'\' AND Report_Agency__c != \'null\'  AND Total_Quantity__c > 0 ' ;
        
         System.debug('query ::' +query);
       //Header
       headerString =  'Shape,Carat Weight,Color,Clarity,Price per Carat,Lot #,Stock #,Lab,Certificate ID,Certificate Image,Additional Image,Dimensions,Depth %,Table %,Crown Angle,Crown %,Pavilion Angle,Pavilion %,Girdle(thinnest),Girdle (thickest),Girdle %,Culet Size,Culet Condition,Polish,Symmetry,Fluorescence Color,Fluorescence Intensity,Enhancement Types,Remarks,Availability,Is Active,Fancy Color Main Body,Fancy Color Intensity,Fancy Color Overtone,Is Matched Pair,Separable,Matching Stock #,Pavilion,Syndication,Cut Grade,External Url,Stone Location Country,Stone Location State Prov,Polygon Exclusive,Girdle Condition,Producing Lab,Brand'+'\n';
    }
    // Start Method
    global Database.QueryLocator start(Database.BatchableContext BC){
        
        return Database.getQueryLocator(query);
    }
    
    // Execute Logic
    global void execute(Database.BatchableContext BC, List<sObject> scope){
        try{
            
            for(sObject certifiedDiamond : scope){
                Product2 certifiedDiamondTemp = (Product2)certifiedDiamond;
              //1C
                if(null == certifiedDiamondTemp.Shape__c){
                    bodyString +='"'+'","';
                }
                else{
                    bodyString += '"'+certifiedDiamondTemp.Shape__c+'","';
                }
                
                //2cCarat Weight
                if(null == certifiedDiamondTemp.Carats__c){
			 		bodyString +=''+'","';
				}else{
                bodyString += certifiedDiamondTemp.Carats__c+'","';
                }
                 
                //3c
                if(null == certifiedDiamondTemp.Color__c){
			 		bodyString +=''+'","';
				}else{
                bodyString += certifiedDiamondTemp.Color__c+'","';
                }
                
                //4c
               if(null == certifiedDiamondTemp.Clarity__c){
			 		bodyString +=''+'","';
				}else{
                bodyString += certifiedDiamondTemp.Clarity__c+'","';
                }
				//5c
                if(null == certifiedDiamondTemp.Sell_Price__c){
			 		bodyString +=''+'","';
				}else{
                bodyString += certifiedDiamondTemp.Sell_Price__c+'","';
                }
				//6c Lot= Name
                if(null == certifiedDiamondTemp.Name){
			 		bodyString +=''+'","';
				}else{
                bodyString += certifiedDiamondTemp.Name+'","';
                }
                //7c Stock=Name
                if(null == certifiedDiamondTemp.Name){
			 		bodyString +=''+'","';
				}else{
                bodyString += certifiedDiamondTemp.Name+'","';
                }
                //8cAgency(Split used to convert EGL USA to EGLUSA)
                if(null == certifiedDiamondTemp.Report_Agency__c){
			 		bodyString +=''+'","';
				}else{
					String str2 = '';
					String str = certifiedDiamondTemp.Report_Agency__c;
                    String[] splitString = str.split(' ');
                    for(String s: splitString) {
                        str2 = str2+s;
                     }
                 bodyString += str2+'","';
                
                }
                //9cCer ID
                if(null == certifiedDiamondTemp.Report_Number__c){
			 		bodyString +=''+'","';
				}else{
                bodyString += certifiedDiamondTemp.Report_Number__c+'","';
                }
                //10cLeave Blank Cer Image
                bodyString += ''+'","';
                //11cLeave Blank Add Image
                bodyString += ''+'","';
                //12cLeave Dimens
                if(null == certifiedDiamondTemp.Stone_Size__c||(certifiedDiamondTemp.Length__c == 0 && certifiedDiamondTemp.Width__c == 0 && certifiedDiamondTemp.Depth__c == 0)){
			 		bodyString +=''+'","';
				}else{
                bodyString += certifiedDiamondTemp.Stone_Size__c+'","';
                }
                //13c 
                if(null == certifiedDiamondTemp.Depth_percent__c){
			 		bodyString +=''+'","';
				}else{
                bodyString += certifiedDiamondTemp.Depth_percent__c+'","';
                }
                //14c
                if(null == certifiedDiamondTemp.Table_percent__c){
			 		bodyString +=''+'","';
				}else{
                bodyString += certifiedDiamondTemp.Table_percent__c+'","';
                }
                //15c
                bodyString += ''+'","';
                //16c
                 bodyString += ''+'","';
                //17c Pavillion Angle
                bodyString += ''+'","';
                //18c Pavillion%
                bodyString += ''+'","';
                //19c 
                 if(null == certifiedDiamondTemp.Girdle_Min__c){
			 		bodyString +=''+'","';
				}else{
                bodyString += certifiedDiamondTemp.Girdle_Min__c+'","';
                }
                //20c
                 if(null == certifiedDiamondTemp.Girdle_Max__c){
			 		bodyString +=''+'","';
				}else{
                bodyString += certifiedDiamondTemp.Girdle_Max__c+'","';
                }
                //21Girdle% Leave Blank
                bodyString += ''+'","';
               //22c
                if(null == certifiedDiamondTemp.Culet_Size__c){
			 		bodyString +=''+'","';
				}else{
                bodyString += certifiedDiamondTemp.Culet_Size__c+'","';
                }
                //23 Culet Conditionc LB=============================
                bodyString += ''+'","';
                //24
                if(null == certifiedDiamondTemp.Polish__c){
			 		bodyString +=''+'","';
				}else{
                bodyString += certifiedDiamondTemp.Polish__c+'","';
                }
                //25c
                if(null == certifiedDiamondTemp.Symmetry__c){
			 		bodyString +=''+'","';
				}else{
                bodyString += certifiedDiamondTemp.Symmetry__c+'","';
                }
                //26c Fluorsence Color LB
                bodyString += ''+'","';
                //27c
                if(null == certifiedDiamondTemp.Fluorescence__c){
			 		bodyString +=''+'","';
				}else{
                bodyString += certifiedDiamondTemp.Fluorescence__c+'","';
                }
                //28c Enhancement Type
                if(null == certifiedDiamondTemp.Treatment__c){
			 		bodyString +=''+'","';
				}else{
                bodyString += certifiedDiamondTemp.Treatment__c+'","';
                }
                //29 RemarkscLeave Blank
                bodyString += ''+'","';
                //30c
                if(certifiedDiamondTemp.Quantity_on_Hand__c > 0){
                    bodyString += 'Yes'+'","';
                }
                else{
                    bodyString += 'No'+'","';
                }
                //31 Is Active
                bodyString += ''+'","';
                //32c
                if(null == certifiedDiamondTemp.Fancy_Color_Primary_Tone__c){
			 		bodyString +=''+'","';
				}else{
                bodyString += certifiedDiamondTemp.Fancy_Color_Primary_Tone__c+'","';
                }
                //33c
                if(null == certifiedDiamondTemp.Fancy_Color_Grade__c){
			 		bodyString +=''+'","';
				}
                else if(certifiedDiamondTemp.Fancy_Color_Grade__c.equalsIgnoreCase('Fancy Intense')){
                bodyString += 'Intense'+'","';
                }
                else if(certifiedDiamondTemp.Fancy_Color_Grade__c.equalsIgnoreCase('Fancy Vivid')){
                bodyString += 'Vivid'+'","';
                }
                else if(certifiedDiamondTemp.Fancy_Color_Grade__c.equalsIgnoreCase('Fancy Deep')){
                bodyString += 'Deep'+'","';
                }
                else {
                bodyString += certifiedDiamondTemp.Fancy_Color_Grade__c+'","';
                }
                
                //34c
                if(null == certifiedDiamondTemp.Fancy_Color_Secondary_Tone__c){
			 		bodyString +=''+'","';
				}else{
                bodyString += certifiedDiamondTemp.Fancy_Color_Secondary_Tone__c+'","';
                }
                //35c Leave Blank 
                bodyString += ''+'","';
                //36c Leave Blank  
                bodyString += ''+'","';
                //37c Leave Blank  
                bodyString += ''+'","';
                //38c Leave Blank  
                bodyString += ''+'","';
                //39c Leave Blank  
                bodyString += ''+'","';
                //40c Cut Grade
                if(null == certifiedDiamondTemp.Final_Cut__c){
			 		bodyString +=''+'","';
				}else{
                bodyString += certifiedDiamondTemp.Final_Cut__c+'","';
                }
                //41 External URl
                bodyString += ''+'","';
                //42 Country
                bodyString += 'USA'+'","';
                //43 State Prov
                bodyString += 'USA'+'","';
                //44 Polygon Exclusive
                bodyString += ''+'","';
                //45 Girdle Condition
                bodyString += ''+'","';
                //46 Producing Lab
                bodyString += ''+'","';
                //47 Brand
                bodyString += ''+'"';
			    bodyString += '\n';
		                
	            System.debug('bodyString Length ::'+ bodyString.length());
            
        }
        }
        catch(Exception excep){
            System.debug('Error - Could not generate file ' + excep.getMessage());
        }
        }
        
    //Finish logic
    global void finish(Database.BatchableContext BC){
        
        //HttpRequest jtt =  new HttpRequest();
		//jtt.setEndPoint('https://technet.rapaport.com/HTTP/Authenticate.aspx');
		//jtt.SetMethod('POST');
		//jtt.setBody('username=jmellet&password=jmellet5355');
		//jtt.SetHeader('Contenttype','application/x-www-form-urlencoded');
		//Http htt = new Http();
		//HttpResponse gt  =htt.send(jtt);
		//system.Debug(gt.getBody());
        
        
        System.debug('bodyString Length ::'+ bodyString.length());
        bodyString = headerString+bodyString; 
        system.debug('@@bodystring'+bodyString);
        blob csvBlob = Blob.valueOf(bodyString);
        system.debug('Date.today()::'+'150413_'+string.valueof(Datetime.now().format('yyyyMMdd'))+'_PROD_C_DM'+'.csv');
        filename = '150413_'+string.valueof(Datetime.now().format('yyyyMMdd'))+'_PROD_C_DM'+'.csv';
        csvname = filename;
		//Attachment att = [SELECT id ,body FROM ATtachment WHERE Parentid = '0019000001BVFJ2'];
		//RapnetService.uploadFile(csvBlob,'RapnetCertDiamond.csv','https://technet.rapaport.com/HTTP/Upload/Upload.aspx?Method=file&ticket='+gt.getBody()+'&ReplaceAll=true&ReportOption=None');
		        
        
 //-----------------------------------------------------------------------------------------------------------------------------------------       
       
        Messaging.EmailFileAttachment csvAttc = new Messaging.EmailFileAttachment();
        csvAttc.setFileName(csvname);
        csvAttc.setBody(csvBlob);
        Messaging.SingleEmailMessage email =new Messaging.SingleEmailMessage();
        String[] toAddresses = new list<string> {'amit.kumar@algoworks.com','amitkumar.algoworks@gmail.com'};
        String subject ='Polygon CertDiamond CSV';
        email.setSubject(subject);
        email.setToAddresses( toAddresses );
        email.setPlainTextBody(' CSV ');
        email.setFileAttachments(new Messaging.EmailFileAttachment[]{csvAttc});
        //HttpResponse response = CsvAttachment(csvBlob,csvname);
        Messaging.SendEmailResult [] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
        
   
    }
    
}

TEST CLASS POLYGON START
@isTest
private class Test_createCSVFileForPolygon {

    static testMethod void myUnitTest1() {
    	
        Id idOfRecordTypeForCertifiedStones;
        
        for(RecordType recordTypeObj : [ Select Id, Name from RecordType where sObjectType = 'Product2' and isActive = true ]){
                if(null != recordTypeObj && recordTypeObj.Name.containsIgnoreCase('WPS Single Stone') ){
                    idOfRecordTypeForCertifiedStones = recordTypeObj.Id;
                }
            }
            
            Product2 pro = new Product2();
        pro.Name = 'Test';
        pro.Total_Cost__c = 12;
        pro.Carats__c = 12;
        pro.Sell_Price__c = 100;
        pro.Length__c = 10;
        pro.Width__c = 10;
        pro.Depth__c = 10;
        pro.Report_Number__c = '23456';
        //pro.Stone_Size__c = 7;
        pro.Depth_percent__c = 10;
        pro.Table_percent__c = 10;
        pro.Crown_Angle__c =10;
        pro.Fluorescence__c = 'FlColor';
        pro.Crown_Height__c = 10;
        pro.Pavilion_Angle__c = 10;
        pro.Pavilion_Depth__c = 10;
        pro.Girdle_Min__c = 'girmin';
        pro.Fluorescence_Color__c = 'REd';
        pro.Fluorescence_Intensity__c = 'Bright';
        pro.Treatment__c = 'Diamond';
        pro.Fancy_Color_Primary_Tone__c = 'Yellow';
        pro.Fancy_Color_Grade__c = 'A';
        pro.Fancy_Color_Secondary_Tone__c = 'Yellow';
        pro.Total_Quantity__c = 12;
        pro.Style_Number__c = '23';
        pro.Report_Agency__c ='GIA';
        pro.Available_for_Sale__c = false;
        pro.Color__c = 'D';
        pro.Clarity__c = 'IF';
        pro.Polish__c ='FA';
        pro.Symmetry__c ='GD';
        pro.Shape__c = 'Marquise';
        pro.Fluorescence__c = 'VST';
        pro.Girdle_Max__c = 'VN';
        pro.Culet_Size__c ='EL';
        pro.Final_Cut__c ='G';
        pro.Quantity_On_Memo__c = 12;
        pro.Total_Quantity__c = 123;
        pro.RecordTypeId = idOfRecordTypeForCertifiedStones;
        insert pro;
        
        createCSVFileForPolygon csvObj = new createCSVFileForPolygon();
        csvObj.query = 'Select Name,'//
                        + 'Shape__c,'   //====REQ
                        + 'Carats__c,'  //====REQ----
                        + 'Color__c,'	//====REQ
                        + 'Clarity__c,' //====REQ
                        + 'Sell_Price__c,'//===REQ----
                        + 'Length__c,'//--
                        + 'Width__c,'//--
                        + 'Depth__c,'//--
                        + 'Report_Agency__c,'
                        + 'Report_Number__c,'//--
                        + 'Stone_Size__c,'  //--
                        + 'Depth_percent__c,'//--
                        + 'Table_percent__c,'//--
                        + 'Crown_Angle__c,'//--
                        + 'Fluorescence__c,'//--
                        + 'Crown_Height__c,'//--
                        + 'Pavilion_Angle__c,'//--
                        + 'Pavilion_Depth__c,'//--
                        + 'Girdle_Min__c,'//--
                        + 'Girdle_Max__c,'
                        + 'Culet_Size__c,' 
                        + 'Polish__c,'
                        + 'Symmetry__c,'
                        + 'Fluorescence_Color__c,'//--
                        + 'Fluorescence_Intensity__c,'//--
                        + 'Treatment__c,'//--
                        + 'Fancy_Color_Primary_Tone__c,'//--
                        + 'Fancy_Color_Grade__c,'//--
                        + 'Fancy_Color_Secondary_Tone__c,'//--
                        + 'Final_Cut__c,'                      
                        + 'Quantity_on_Hand__c FROM Product2 where recordTypeId = :idOfRecordTypeForCertifiedStones AND Available_for_Sale__c = false AND Report_Agency__c != \'\' AND Report_Agency__c != \'null\'  AND Total_Quantity__c > 0 ' ;
           
                        ID batchprocessid = Database.executeBatch(csvObj); 
    }
    
      static testMethod void myUnitTest2() {
    	
        Id idOfRecordTypeForCertifiedStones;
        
        for(RecordType recordTypeObj : [ Select Id, Name from RecordType where sObjectType = 'Product2' and isActive = true ]){
                if(null != recordTypeObj && recordTypeObj.Name.containsIgnoreCase('WPS Single Stone') ){
                    idOfRecordTypeForCertifiedStones = recordTypeObj.Id;
                }
            }
            
        Product2 pro = new Product2();
        pro.Name = 'Test1';
        pro.Total_Cost__c = 112;
        pro.Total_Quantity__c = 112;
        pro.Style_Number__c = '25';
        pro.Report_Agency__c ='GIA';
        pro.Available_for_Sale__c = false;
        pro.RecordTypeId = idOfRecordTypeForCertifiedStones;
        insert pro;
        
        createCSVFileForPolygon csvObj = new createCSVFileForPolygon();
        csvObj.query = 'Select Name,'//
                        + 'Shape__c,'   //====REQ
                        + 'Carats__c,'  //====REQ----
                        + 'Color__c,'	//====REQ
                        + 'Clarity__c,' //====REQ
                        + 'Sell_Price__c,'//===REQ----
                        + 'Length__c,'//--
                        + 'Width__c,'//--
                        + 'Depth__c,'//--
                        + 'Report_Agency__c,'
                        + 'Report_Number__c,'//--
                        + 'Stone_Size__c,'  //--
                        + 'Depth_percent__c,'//--
                        + 'Table_percent__c,'//--
                        + 'Crown_Angle__c,'//--
                        + 'Fluorescence__c,'//--
                        + 'Crown_Height__c,'//--
                        + 'Pavilion_Angle__c,'//--
                        + 'Pavilion_Depth__c,'//--
                        + 'Girdle_Min__c,'//--
                        + 'Girdle_Max__c,'
                        + 'Culet_Size__c,' 
                        + 'Polish__c,'
                        + 'Symmetry__c,'
                        + 'Fluorescence_Color__c,'//--
                        + 'Fluorescence_Intensity__c,'//--
                        + 'Treatment__c,'//--
                        + 'Fancy_Color_Primary_Tone__c,'//--
                        + 'Fancy_Color_Grade__c,'//--
                        + 'Fancy_Color_Secondary_Tone__c,'//--
                        + 'Final_Cut__c,'                      
                        + 'Quantity_on_Hand__c FROM Product2 where recordTypeId = :idOfRecordTypeForCertifiedStones AND Available_for_Sale__c = false AND Report_Agency__c != \'\' AND Report_Agency__c != \'null\'  AND Total_Quantity__c > 0 ' ;
           
                        ID batchprocessid = Database.executeBatch(csvObj); 
    }
    
    static testMethod void myUnitTest3() {
    	
        Id idOfRecordTypeForCertifiedStones;
        
        for(RecordType recordTypeObj : [ Select Id, Name from RecordType where sObjectType = 'Product2' and isActive = true ]){
                if(null != recordTypeObj && recordTypeObj.Name.containsIgnoreCase('WPS Single Stone') ){
                    idOfRecordTypeForCertifiedStones = recordTypeObj.Id;
                }
            }
            
        Product2 pro = new Product2();
        pro.Name = 'Test1';
        pro.Total_Cost__c = 112;
        pro.Total_Quantity__c = 112;
        pro.Style_Number__c = '25';
        pro.Report_Agency__c ='GIA';
        pro.Fancy_Color_Grade__c = 'Fancy Intense';
        pro.Available_for_Sale__c = false;
        pro.RecordTypeId = idOfRecordTypeForCertifiedStones;
        insert pro;
        
        createCSVFileForPolygon csvObj = new createCSVFileForPolygon();
        csvObj.query = 'Select Name,'//
                        + 'Shape__c,'   //====REQ
                        + 'Carats__c,'  //====REQ----
                        + 'Color__c,'	//====REQ
                        + 'Clarity__c,' //====REQ
                        + 'Sell_Price__c,'//===REQ----
                        + 'Length__c,'//--
                        + 'Width__c,'//--
                        + 'Depth__c,'//--
                        + 'Report_Agency__c,'
                        + 'Report_Number__c,'//--
                        + 'Stone_Size__c,'  //--
                        + 'Depth_percent__c,'//--
                        + 'Table_percent__c,'//--
                        + 'Crown_Angle__c,'//--
                        + 'Fluorescence__c,'//--
                        + 'Crown_Height__c,'//--
                        + 'Pavilion_Angle__c,'//--
                        + 'Pavilion_Depth__c,'//--
                        + 'Girdle_Min__c,'//--
                        + 'Girdle_Max__c,'
                        + 'Culet_Size__c,' 
                        + 'Polish__c,'
                        + 'Symmetry__c,'
                        + 'Fluorescence_Color__c,'//--
                        + 'Fluorescence_Intensity__c,'//--
                        + 'Treatment__c,'//--
                        + 'Fancy_Color_Primary_Tone__c,'//--
                        + 'Fancy_Color_Grade__c,'//--
                        + 'Fancy_Color_Secondary_Tone__c,'//--
                        + 'Final_Cut__c,'                      
                        + 'Quantity_on_Hand__c FROM Product2 where recordTypeId = :idOfRecordTypeForCertifiedStones AND Available_for_Sale__c = false AND Report_Agency__c != \'\' AND Report_Agency__c != \'null\'  AND Total_Quantity__c > 0 ' ;
           
                        ID batchprocessid = Database.executeBatch(csvObj); 
        pro.Name = 'Test1';
        pro.Total_Cost__c = 112;
        pro.Total_Quantity__c = 112;
        pro.Style_Number__c = '25';
        pro.Report_Agency__c ='GIA';
        pro.Fancy_Color_Grade__c = 'Fancy Vivid';
        pro.Available_for_Sale__c = false;
        pro.RecordTypeId = idOfRecordTypeForCertifiedStones;
        insert pro;
        
                csvObj.query = 'Select Name,'//
                        + 'Shape__c,'   //====REQ
                        + 'Carats__c,'  //====REQ----
                        + 'Color__c,'	//====REQ
                        + 'Clarity__c,' //====REQ
                        + 'Sell_Price__c,'//===REQ----
                        + 'Length__c,'//--
                        + 'Width__c,'//--
                        + 'Depth__c,'//--
                        + 'Report_Agency__c,'
                        + 'Report_Number__c,'//--
                        + 'Stone_Size__c,'  //--
                        + 'Depth_percent__c,'//--
                        + 'Table_percent__c,'//--
                        + 'Crown_Angle__c,'//--
                        + 'Fluorescence__c,'//--
                        + 'Crown_Height__c,'//--
                        + 'Pavilion_Angle__c,'//--
                        + 'Pavilion_Depth__c,'//--
                        + 'Girdle_Min__c,'//--
                        + 'Girdle_Max__c,'
                        + 'Culet_Size__c,' 
                        + 'Polish__c,'
                        + 'Symmetry__c,'
                        + 'Fluorescence_Color__c,'//--
                        + 'Fluorescence_Intensity__c,'//--
                        + 'Treatment__c,'//--
                        + 'Fancy_Color_Primary_Tone__c,'//--
                        + 'Fancy_Color_Grade__c,'//--
                        + 'Fancy_Color_Secondary_Tone__c,'//--
                        + 'Final_Cut__c,'                      
                        + 'Quantity_on_Hand__c FROM Product2 where recordTypeId = :idOfRecordTypeForCertifiedStones AND Available_for_Sale__c = false AND Report_Agency__c != \'\' AND Report_Agency__c != \'null\'  AND Total_Quantity__c > 0 ' ;
           
                        Database.executeBatch(csvObj);
        pro.Name = 'Test1';
        pro.Total_Cost__c = 112;
        pro.Total_Quantity__c = 112;
        pro.Length__c = 0;
        pro.Width__c = 0;
        pro.Depth__c = 0;
        pro.Style_Number__c = '25';
        pro.Report_Agency__c ='GIA';
        pro.Fancy_Color_Grade__c = 'Fancy Deep';
        pro.Available_for_Sale__c = false;
        pro.RecordTypeId = idOfRecordTypeForCertifiedStones;
        insert pro;
        csvObj.query = 'Select Name,'//
                        + 'Shape__c,'   //====REQ
                        + 'Carats__c,'  //====REQ----
                        + 'Color__c,'	//====REQ
                        + 'Clarity__c,' //====REQ
                        + 'Sell_Price__c,'//===REQ----
                        + 'Length__c,'//--
                        + 'Width__c,'//--
                        + 'Depth__c,'//--
                        + 'Report_Agency__c,'
                        + 'Report_Number__c,'//--
                        + 'Stone_Size__c,'  //--
                        + 'Depth_percent__c,'//--
                        + 'Table_percent__c,'//--
                        + 'Crown_Angle__c,'//--
                        + 'Fluorescence__c,'//--
                        + 'Crown_Height__c,'//--
                        + 'Pavilion_Angle__c,'//--
                        + 'Pavilion_Depth__c,'//--
                        + 'Girdle_Min__c,'//--
                        + 'Girdle_Max__c,'
                        + 'Culet_Size__c,' 
                        + 'Polish__c,'
                        + 'Symmetry__c,'
                        + 'Fluorescence_Color__c,'//--
                        + 'Fluorescence_Intensity__c,'//--
                        + 'Treatment__c,'//--
                        + 'Fancy_Color_Primary_Tone__c,'//--
                        + 'Fancy_Color_Grade__c,'//--
                        + 'Fancy_Color_Secondary_Tone__c,'//--
                        + 'Final_Cut__c,'                      
                        + 'Quantity_on_Hand__c FROM Product2 where recordTypeId = :idOfRecordTypeForCertifiedStones AND Available_for_Sale__c = false AND Report_Agency__c != \'\' AND Report_Agency__c != \'null\'  AND Total_Quantity__c > 0 ' ;
           
                      Database.executeBatch(csvObj); 
                      
                      //Trying to catch exception
                      pro.Name = 'Test1';
        pro.Total_Cost__c = 112;
        pro.Total_Quantity__c = 100;
        pro.Length__c = 0;
        pro.Width__c = 0;
        pro.Depth__c = 0;
        pro.Style_Number__c = '25';
        pro.Report_Agency__c ='GIA';
        pro.Fancy_Color_Grade__c = 'Fancy Deep';
        pro.Available_for_Sale__c = false;
        pro.RecordTypeId = idOfRecordTypeForCertifiedStones;
        insert pro;
        csvObj.query = 'Select Name,'//
                        + 'Shape__c,'   //====REQ
                        + 'Carats__c,'  //====REQ----
                        + 'Color__c,'	//====REQ
                        + 'Clarity__c,' //====REQ
                        + 'Sell_Price__c,'//===REQ----
                        + 'Length__c,'//--
                        + 'Width__c,'//--
                        + 'Depth__c,'//--
                        + 'Report_Agency__c,'
                        + 'Report_Number__c,'//--
                        + 'Stone_Size__c,'  //--
                        + 'Depth_percent__c,'//--
                        + 'Table_percent__c,'//--
                        + 'Crown_Angle__c,'//--
                        + 'Fluorescence__c,'//--
                        + 'Crown_Height__c,'//--
                        + 'Pavilion_Angle__c,'//--
                        + 'Pavilion_Depth__c,'//--
                        + 'Girdle_Min__c,'//--
                        + 'Girdle_Max__c,'
                        + 'Culet_Size__c,' 
                        + 'Polish__c,'
                        + 'Symmetry__c,'
                        + 'Fluorescence_Color__c,'//--
                        + 'Fluorescence_Intensity__c,'//--
                        + 'Treatment__c,'//--
                        + 'Fancy_Color_Primary_Tone__c,'//--
                        + 'Fancy_Color_Grade__c,'//--
                        + 'Fancy_Color_Secondary_Tone__c,'//--
                        + 'Final_Cut__c,'                      
                        + 'Quantity_on_Hand__c FROM Product2 where recordTypeId = :idOfRecordTypeForCertifiedStones AND Available_for_Sale__c = false AND Report_Agency__c != \'\' AND Report_Agency__c != \'null\'  AND Total_Quantity__c > 0 ' ;
           
                      Database.executeBatch(csvObj); 
    }
}
TEST CLASS END
THE END
//How to write scheduler in annonomous;
/START SCHEDULER
 List<String> cronJobsIds= new List<String>();

	for(integer i=0;i<=58;i=i+18){
			cronJobsIds.add( System.schedule('createCSVFileForPolygonScheduler'+i, '0 '+i+' * * * ?', new createCSVFileForPolygonScheduler()));
	}

	System.debug('>>>'+cronJobsIds);
	for(String cronjob : cronJobsIds){
		System.debug('\t'+cronjob+',');
	}
/END SCHEDULER
*/
}