sap.ui.define([], function () {
    "use strict";

    return {

        onClickNavigate: function (oEvent) {
            this.intentBasedNavigation.navigateOutbound("project2");
        }
    }
});