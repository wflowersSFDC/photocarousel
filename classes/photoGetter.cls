public without sharing class photoGetter {
    @AuraEnabled
    public static List<Id> getPhotos(Id recordId){
        List<ContentDocumentLink> CDLlist = [SELECT Id, ContentDocumentId, ContentDocument.FileType, ContentDocument.LatestPublishedVersion.ContentURL FROM ContentDocumentLink WHERE LinkedEntityId = :recordId ORDER BY ContentDocument.CreatedDate DESC];
        system.debug(CDLlist);
        List<Id> photoIds = new List<Id>();
        for(ContentDocumentLink CDL: CDLlist){
            system.debug(CDL.ContentDocument.LatestPublishedVersion.ContentURL);
            if(CDL.ContentDocument.FileType == 'JPG'){
                photoIds.add(CDL.ContentDocumentId);
            }
        }
        return photoIds;
    }
}