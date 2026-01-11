sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"capexdemo/approvers/test/integration/pages/ApproversList",
	"capexdemo/approvers/test/integration/pages/ApproversObjectPage"
], function (JourneyRunner, ApproversList, ApproversObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('capexdemo/approvers') + '/test/flpSandbox.html#capexdemoapprovers-tile',
        pages: {
			onTheApproversList: ApproversList,
			onTheApproversObjectPage: ApproversObjectPage
        },
        async: true
    });

    return runner;
});

