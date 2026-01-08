sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"capexdemo/capexrequest/test/integration/pages/CapexRequestList",
	"capexdemo/capexrequest/test/integration/pages/CapexRequestObjectPage",
	"capexdemo/capexrequest/test/integration/pages/CapexApprovalObjectPage"
], function (JourneyRunner, CapexRequestList, CapexRequestObjectPage, CapexApprovalObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('capexdemo/capexrequest') + '/test/flpSandbox.html#capexdemocapexrequest-tile',
        pages: {
			onTheCapexRequestList: CapexRequestList,
			onTheCapexRequestObjectPage: CapexRequestObjectPage,
			onTheCapexApprovalObjectPage: CapexApprovalObjectPage
        },
        async: true
    });

    return runner;
});

