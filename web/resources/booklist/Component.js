// sap.ui.define([
// 	"sap/ui/core/UIComponent"
// ], function (UIComponent) {
// 	"use strict";

// 	return UIComponent.extend("ycs.fiori.assetlist.Component", {

// 		metadata: {
// 			manifest: "json"
// 		},
// 		 async: true

// 	});
// });

sap.ui.define(
    ["sap/fe/AppComponent"],
    ac => ac.extend("ycs.fiori.booklist.Component", {
        metadata: {
            manifest: 'json'
        }
    })
)