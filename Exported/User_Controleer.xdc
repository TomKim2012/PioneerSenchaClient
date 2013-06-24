{
    "xdsVersion": "2.2.0",
    "frameworkVersion": "touch20",
    "internals": {
        "type": "Ext.app.Controller",
        "reference": {
            "name": "items",
            "type": "array"
        },
        "codeClass": null,
        "userConfig": {
            "designer|userClassName": "user_dashboard"
        },
        "cn": [
            {
                "type": "controllerref",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|userClassName": "nfc_share",
                    "ref": "nfc_share",
                    "selector": "#nfc_share"
                }
            },
            {
                "type": "controllerref",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|userClassName": "swap_cards",
                    "ref": "swap_cards",
                    "selector": "#swap_cards"
                }
            },
            {
                "type": "controllerref",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|userClassName": "topup_btn",
                    "ref": "topup_btn",
                    "selector": "#topup_btn"
                }
            },
            {
                "type": "controllerref",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|userClassName": "pay_btn",
                    "ref": "pay_btn",
                    "selector": "#pay_btn"
                }
            },
            {
                "type": "controlleraction",
                "reference": {
                    "name": "listeners",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|userClassName": "onSegmentedbuttonToggle",
                    "fn": "onSegmentedbuttonToggle",
                    "implHandler": [
                        "var swap_cards=this.getSwap_cards();",
                        "if(button.id==='pay_btn'){",
                        "    swap_cards.setActiveItem(1);",
                        "}else if(button.id==='topup_btn'){",
                        "    swap_cards.setActiveItem(0);",
                        "}"
                    ],
                    "name": "toggle",
                    "designer|targetType": "Ext.SegmentedButton",
                    "designer|controlQuery": "user_segmented_button"
                }
            },
            {
                "type": "controllerref",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|userClassName": "agent_topup",
                    "ref": "agent_topup",
                    "selector": "#agent_topup"
                }
            },
            {
                "type": "controllerref",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|userClassName": "friend_topup",
                    "ref": "friend_topup",
                    "selector": "#friend_topup"
                }
            },
            {
                "type": "controllerref",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|userClassName": "mobile_money",
                    "ref": "mobile_money",
                    "selector": "#mobile_money"
                }
            },
            {
                "type": "controllerref",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|userClassName": "credit_topup",
                    "ref": "credit_topup",
                    "selector": "#credit_topup"
                }
            },
            {
                "type": "controllerref",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|userClassName": "user_segmented_button",
                    "ref": "user_segmented_button",
                    "selector": "#user_segmented_button"
                }
            },
            {
                "type": "controlleraction",
                "reference": {
                    "name": "listeners",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|userClassName": "onAgent_topupTap",
                    "fn": "onAgent_topupTap",
                    "implHandler": [
                        "// Aliases for record creation functions.",
                        "var createTextRecord = blackberrynfc.ndef.message.createTextRecord;",
                        "var createURIRecord = blackberrynfc.ndef.message.createURIRecord;",
                        "var createSpRecord = blackberrynfc.ndef.message.createSpRecord;",
                        "",
                        "",
                        "try {",
                        "    //1. Read Session Variable for user_id",
                        "    var sessionObject = localStorage.getItem('sessionObject');",
                        "    console.log(sessionObject);",
                        "    sessionObject=JSON.parse(sessionObject); ",
                        "",
                        "",
                        "    //2. Read the User-Id",
                        "    var text = sessionObject.user_id;",
                        "    var uri = \"mytomkim.com\";",
                        "",
                        "    if (text===\"\" || uri===\"\") {",
                        "        alert(\"Please enter text for both fields...\");",
                        "        return;",
                        "    }",
                        "",
                        "    var textRecord = createTextRecord(\"en\",text);",
                        "    //var uriRecord = createURIRecord(uri);",
                        "    var records = Array(textRecord);",
                        "    var spRecord = createSpRecord(records);",
                        "    var data = spRecord.getEncoded(\"invoke\");",
                        "",
                        "    var query = {",
                        "        \"action\": \"bb.action.SHARE\",",
                        "        \"type\": \"application/vnd.rim.nfc.ndef\",",
                        "        \"data\": data",
                        "    };",
                        "",
                        "    blackberry.invoke.invoke(query,shareGood,shareBad);",
                        "} catch (e) {",
                        "    alert(e);",
                        "}"
                    ],
                    "name": "tap",
                    "designer|targetType": "Ext.Button",
                    "designer|controlQuery": "agent_topup"
                }
            },
            {
                "type": "controlleraction",
                "reference": {
                    "name": "listeners",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|userClassName": "onFriend_topupTap",
                    "fn": "onFriend_topupTap",
                    "implHandler": [
                        "// Aliases for record creation functions.",
                        "var createTextRecord = blackberrynfc.ndef.message.createTextRecord;",
                        "var createURIRecord = blackberrynfc.ndef.message.createURIRecord;",
                        "var createSpRecord = blackberrynfc.ndef.message.createSpRecord;",
                        "",
                        "",
                        "try {",
                        "    //1. Read Session Variable for user_id",
                        "    var sessionObject = localStorage.getItem('sessionObject');",
                        "    console.log(sessionObject);",
                        "    sessionObject=JSON.parse(sessionObject); ",
                        "",
                        "",
                        "    //2. Read the User-Id",
                        "    var text = sessionObject.user_id;",
                        "    var uri = \"mytomkim.com\";",
                        "",
                        "    if (text===\"\" || uri===\"\") {",
                        "        alert(\"Please enter text for both fields...\");",
                        "        return;",
                        "    }",
                        "",
                        "    var textRecord = createTextRecord(\"en\",text);",
                        "    //var uriRecord = createURIRecord(uri);",
                        "    var records = Array(textRecord);",
                        "    var spRecord = createSpRecord(records);",
                        "    var data = spRecord.getEncoded(\"invoke\");",
                        "",
                        "    var query = {",
                        "        \"action\": \"bb.action.SHARE\",",
                        "        \"type\": \"application/vnd.rim.nfc.ndef\",",
                        "        \"data\": data",
                        "    };",
                        "",
                        "    blackberry.invoke.invoke(query,shareGood,shareBad);",
                        "} catch (e) {",
                        "    alert(e);",
                        "}"
                    ],
                    "name": "tap",
                    "designer|targetType": "Ext.Button",
                    "designer|controlQuery": "friend_topup"
                }
            },
            {
                "type": "controllerref",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|userClassName": "to_friend",
                    "ref": "to_friend",
                    "selector": "#to_friend"
                }
            },
            {
                "type": "controllerref",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|userClassName": "to_merchant",
                    "ref": "to_merchant",
                    "selector": "#to_merchant"
                }
            },
            {
                "type": "controlleraction",
                "reference": {
                    "name": "listeners",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|userClassName": "onTo_MerchantTap",
                    "fn": "onTo_MerchantTap",
                    "implHandler": [
                        "//Get the Amount",
                        "var swap_cards=this.getSwap_cards();",
                        "swap_cards.setActiveItem(2);",
                        ""
                    ],
                    "name": "tap",
                    "designer|targetType": "Ext.Button",
                    "designer|controlQuery": "to_merchant"
                }
            },
            {
                "type": "controlleraction",
                "reference": {
                    "name": "listeners",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|userClassName": "onTo_friendTap",
                    "fn": "onTo_friendTap",
                    "implHandler": [
                        "//Get the Amount",
                        "var swap_cards=this.getSwap_cards();",
                        "swap_cards.setActiveItem(2);",
                        "",
                        "var payment_input=this.getPayment_input();",
                        "var amount= payment_input.getValue();",
                        "",
                        "//Save it in Session",
                        "var transactionObject = {'amount': amount};",
                        "localStorage.setItem('transactionObject', transactionObject);",
                        "",
                        "",
                        "//Set Masked",
                        "Ext.Viewport.setMasked({",
                        "    xtype: 'loadmask',",
                        "    message: 'Waiting for Friends Phone, Tell Friend to Place her phone close...!'",
                        "});",
                        ""
                    ],
                    "name": "tap",
                    "designer|targetType": "Ext.Button",
                    "designer|controlQuery": "to_friend"
                }
            },
            {
                "type": "controllerref",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|userClassName": "payment_input",
                    "ref": "payment_input",
                    "selector": "#payment_input"
                }
            },
            {
                "type": "controllerref",
                "reference": {
                    "name": "items",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|userClassName": "amount_ok",
                    "ref": "amount_ok",
                    "selector": "#amount_ok"
                }
            },
            {
                "type": "controlleraction",
                "reference": {
                    "name": "listeners",
                    "type": "array"
                },
                "codeClass": null,
                "userConfig": {
                    "designer|userClassName": "onAmount_okTap",
                    "fn": "onAmount_okTap",
                    "implHandler": [
                        "",
                        "var payment_input=this.getPayment_input();",
                        "var amount= payment_input.getValue();",
                        "",
                        "//Save it in Session",
                        "var transactionObject = {'amount': amount};",
                        "localStorage.setItem('transactionObject', transactionObject);",
                        "",
                        "",
                        "//Set Masked",
                        "Ext.Viewport.setMasked({",
                        "    xtype: 'loadmask',",
                        "    message: 'Waiting for Merchant Phone, Tell Merchant to Place her/his phone close...'",
                        "});",
                        ""
                    ],
                    "name": "tap",
                    "designer|targetType": "Ext.Button",
                    "designer|controlQuery": "amount_ok"
                }
            }
        ]
    },
    "linkedNodes": {},
    "boundStores": {},
    "boundModels": {}
}