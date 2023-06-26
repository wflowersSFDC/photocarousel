({
    loadPhotos: function (component, event, helper) {
        var action = component.get("c.getPhotos");
        action.setParams({
            "recordId" : component.get("v.recordId")
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state == 'SUCCESS') {
                component.set('v.photoIds', response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
});