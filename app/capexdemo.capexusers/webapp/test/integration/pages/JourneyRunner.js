sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"capexdemo/capexusers/test/integration/pages/CapexUsersList",
	"capexdemo/capexusers/test/integration/pages/CapexUsersObjectPage"
], function (JourneyRunner, CapexUsersList, CapexUsersObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('capexdemo/capexusers') + '/test/flpSandbox.html#capexdemocapexusers-tile',
        pages: {
			onTheCapexUsersList: CapexUsersList,
			onTheCapexUsersObjectPage: CapexUsersObjectPage
        },
        async: true
    });

    return runner;
});

