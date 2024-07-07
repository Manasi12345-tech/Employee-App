sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'project3/test/integration/FirstJourney',
		'project3/test/integration/pages/EmployeesActiveList',
		'project3/test/integration/pages/EmployeesActiveObjectPage'
    ],
    function(JourneyRunner, opaJourney, EmployeesActiveList, EmployeesActiveObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('project3') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheEmployeesActiveList: EmployeesActiveList,
					onTheEmployeesActiveObjectPage: EmployeesActiveObjectPage
                }
            },
            opaJourney.run
        );
    }
);