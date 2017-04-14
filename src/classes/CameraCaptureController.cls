public with sharing class CameraCaptureController {

    public String filename { get; set; }

    public transient String capturedImage { get; set; }

    public transient Attachment attachment { get; set; }
    
    public Id parentid {get; set; }
    
    public CameraCaptureController(){
        parentid = ApexPages.currentPage().getParameters().get('id');
    }

    public PageReference Upload() {
        if (capturedImage != '' && filename != ''){
            Integer len = capturedImage.length();
            attachment = new Attachment();
            attachment.name = filename+'.png';
            attachment.body = EncodingUtil.Base64Decode(capturedImage.substring(22, len-1));
            attachment.parentid = parentid;
            insert attachment;
        }
        else{
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Either Snapshot or Filename or both are unavailable');
            ApexPages.addMessage(myMsg);
        }
        return null;
    }
}