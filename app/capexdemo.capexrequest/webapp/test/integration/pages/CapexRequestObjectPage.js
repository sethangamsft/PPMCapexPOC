sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'capexdemo.capexrequest',
            componentId: 'CapexRequestObjectPage',
            contextPath: '/CapexRequest'
        },
        CustomPageDefinitions
    );
});