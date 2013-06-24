/*
 * File: app/controller/main_controller.js
 * Date: Wed May 15 2013 23:47:39 GMT+0300 (E. Africa Standard Time)
 *
 * This file was generated by Sencha Architect version 2.2.0.
 * http://www.sencha.com/products/architect/
 *
 * This file requires use of the Sencha Touch 2.0.x library, under independent license.
 * License of Sencha Architect does not include license for Sencha Touch 2.0.x. For more
 * details see http://www.sencha.com/license or contact license@sencha.com.
 *
 * This file will be auto-generated each and everytime you save your project.
 *
 * Do NOT hand edit this file.
 */

Ext.define('FlexiPay.controller.main_controller', {
    extend: 'Ext.app.Controller',

    config: {
        refs: {
            introduction: 'introduction_carousel',
            next_button: '[itemId=next_button]',
            registerOption: 'register_options',
            merchant_button: '#merchant',
            agent_button: '#agent',
            customer_button: '#customer',
            merchant_registration: '#merchant_registration',
            agent_registration: '#agent_registration',
            customer_registration: 'customer_registration_form',
            authentication_screen: 'authentication_screen',
            customer_form: '#customer_form',
            authorisation_screen: 'authorisation_screen',
            customer_save: '#save_customer',
            merchant_save: '#merchant_save',
            agent_save: '#agent_save',
            verify_next: '#next_verify',
            verify_input: '#verify_input',
            authorise_done: '#authorise_done',
            authenticate_done: '#authenticate_done',
            mobile_input: '#mobile_input'
        },

        control: {
            "authorise_done": {
                tap: 'onAuthoriseTap'
            },
            "next_button": {
                tap: 'onNextButton'
            },
            "merchant_button": {
                tap: 'onMerchantTap'
            },
            "agent_button": {
                tap: 'onAgentTap'
            },
            "customer_button": {
                tap: 'onCustomerTap'
            },
            "customer_save": {
                tap: 'onCustomerSaveTap'
            },
            "verify_next": {
                tap: 'onVerifyTap'
            },
            "merchant_save": {
                tap: 'onMerchantSaveTap'
            },
            "agent_save": {
                tap: 'onAgentSave'
            },
            "authenticate_done": {
                tap: 'onAuthenticateTap'
            }
        }
    },

    onAuthoriseTap: function(button, e, eOpts) {
        //Get the Form Data
        var form = this.getAuthorisation_screen();
        var values= form.getValues();

        console.log(values);

        //Combine the Passwords
        passcode= values.mypasswordfield1 + values.mypasswordfield2 + values.mypasswordfield3 + values.mypasswordfield4;

        console.log("Entered passcode the following:",passcode);


        //Check that a passcode was Entered
        if(passcode){     
            //1. Is there a phone Number in session storage
            var sessionObject = localStorage.getItem('sessionObject');
            console.log(sessionObject);
            sessionObject=JSON.parse(sessionObject); 

            if(sessionObject.has_account === true){
                Ext.Viewport.setMasked({
                    xtype: 'loadmask',
                    message: 'Logging In...'
                });

                // A)Get the Mobile Number- User has Entered a Mobile Number and has an Account
                if(sessionObject.mobile_number){  
                    console.log("The Logging In with Mobile Number");
                    //B) Perform User Login Process with Mobile Number
                    Ext.Ajax.request({
                        url: 'http://41.89.68.188/restserver/index.php/api/Flexipay_server/login/format/json',
                        method: 'POST',
                        params: {
                            mobile_number:sessionObject.mobile_number,
                            passcode:passcode
                        },

                        success:function(result)
                        {
                            Ext.Viewport.setMasked(false); // hide the load screen

                            //2. Scrutinize the Results
                            //2a. Store the user data to the HTML-5 Session Variable(for later usage)
                            var data = Ext.JSON.decode(result.responseText.trim());

                            if(data.authorize){
                                //2b. Store the USER-ID in Session Storage (HTML5)
                                var sessionObject = {'user_id': data.user_id, 'mobile_number': data.mobile_number, 'access_keys':data.access_keys, 'account_balance': data.account_balance, 'full_names': data.full_names};
                                localStorage.setItem('sessionObject',JSON.stringify(sessionObject));

                                console.log(sessionObject);


                                Ext.Msg.alert("Information","Logged In As: "+ data.full_names +"\n Account Type:"+ data.access_keys + "Account Balance: " + data.account_balance);

                                //Direct User to the screen Based on his Login Info
                                //1.If Customer
                                if(data.access_keys === 'customer_user'){
                                    var user_dashboard = Ext.create('FlexiPay.view.customer_dashboard');     
                                    Ext.Viewport.setActiveItem(user_dashboard);
                                }
                                else if(data.access_keys === 'merchant_user'){
                                    //If Merchant
                                    var merchant_dashboard = Ext.create('FlexiPay.view.merchant_dashboard'); 
                                    Ext.Viewport.setActiveItem(merchant_dashboard);  
                                }else if(data.access_keys === 'agent_user'){
                                    //If Agent
                                    var agent_dashboard = Ext.create('FlexiPay.view.agent_dashboard'); 
                                    Ext.Viewport.setActiveItem(agent_dashboard); 
                                }                 
                            }else{
                                //1. Alert Success
                                Ext.Msg.alert("Failure", "Incorrect Credentials");	
                            }
                        }, 
                        //Failed.. Call this function..
                        failure: function(result){
                            Ext.Viewport.setMasked(false); // hide the load screen
                            Ext.Msg.alert("Failure", "Incorrect Credentials - Mobile/password");	
                        },

                        scope: this
                    });   


                }else{
                    Ext.Msg.alert("Error","Can't find Mobile Number in session storage");  
                }

            }else{
                //2. No Phone number preceed to saving a new Passcode
                console.log("Creating a new Passcode....");
                Ext.Ajax.request({
                    url: 'http://41.89.68.188/restserver/index.php/api/Flexipay_server/changepw/format/json',
                    method: 'POST',
                    params: {
                        new_password:passcode
                    },

                    success:function(result)
                    {
                        Ext.Viewport.setMasked(false); // hide the load screen

                        //1. Alert Success
                        Ext.Msg.alert("Success", "Done! Account Setup");	

                        // Read Session Storage to determine the User
                        var sessionObject = localStorage.getItem('sessionObject');
                        console.log('sessionObject : ',JSON.parse(sessionObject));

                        sessionObject=JSON.parse(sessionObject);

                        //Direct User to the screen Based on his Registration Info
                        //1.If Customer
                        if(sessionObject.access_keys === 'customer_user'){
                            var user_dashboard = Ext.create('FlexiPay.view.customer_dashboard');     
                            Ext.Viewport.setActiveItem(user_dashboard);
                        }
                        else if(sessionObject.access_keys === 'merchant_user'){
                            //If Merchant
                            var merchant_dashboard = Ext.create('FlexiPay.view.merchant_dashboard'); 
                            Ext.Viewport.setActiveItem(merchant_dashboard);  
                        }else if(sessionObject.access_keys === 'agent_user'){
                            //If Agent
                            var agent_dashboard = Ext.create('FlexiPay.view.agent_dashboard'); 
                            Ext.Viewport.setActiveItem(agent_dashboard); 
                        }
                    },

                    //Failed.. Call this function..
                    failure: function(result){
                        Ext.Viewport.setMasked(false); // hide the load screen
                        Ext.Msg.alert("Error: Server Said::","There was something wrong with the Connection");
                    },

                    scope: this
                });    
            }

        }else{
            Ext.Viewport.setMasked(false); // hide the load screen
            Ext.Msg.alert("Error","Cannot be blank!");    
        }

    },

    onNextButton: function(button, e, eOpts) {
        console.log("Next Tapped");

        //TODO: Find Out why Its throwing an Exception when back button is pressed
        Ext.Msg.confirm('Check', 'Do you have an Existing Account?', function(buttonId) {

            if(buttonId == 'yes') { 
                //Push to Login
                if (!this.authentication_screen) {
                    this.authentication_screen = Ext.create('FlexiPay.view.authentication_screen');
                }
                this.getIntroduction().push(this.authentication_screen);
            }

            else{
                //Push to registration.
                if (!this.registerOption) {
                    this.registerOption = Ext.create('FlexiPay.view.registration_options');
                }
                this.getIntroduction().push(this.registerOption);
            }
        },this
        );


    },

    onMerchantTap: function(button, e, eOpts) {
        console.log("Merchant Tapped");


        if (!this.merchant_registration) {
        }

        this.merchant_registration = Ext.create('FlexiPay.view.merchant_registration_form');

        this.getIntroduction().push(this.merchant_registration);
    },

    onAgentTap: function(button, e, eOpts) {
        console.log("Agent Tapped");

        if (!this.agent_registration) {
        }

        this.agent_registration = Ext.create('FlexiPay.view.agent_registration_form');

        this.getIntroduction().push(this.agent_registration);
    },

    onCustomerTap: function(button, e, eOpts) {
        console.log("Customer Tapped");

        if (!this.customer_registration) {
        }

        this.customer_registration = Ext.create('FlexiPay.view.customer_registration_form');

        this.getIntroduction().push(this.customer_registration);
    },

    onCustomerSaveTap: function(button, e, eOpts) {
        var form = this.getCustomer_form();
        var values= form.getValues();
        values['account_id']=3;

        console.log(values);
        Ext.Viewport.setMasked({
            xtype: 'loadmask',
            message: 'Saving Records...'
        });



        //Getting the Instance of the model user which has a proxy
        var record = new FlexiPay.model.Users2(values);
        var errors = record.validate();


        //Ext.device.Notification.vibrate(); //
        if(errors.isValid()){   
            var me = this;
            record.save({
                success:function(result)
                {
                    Ext.Viewport.setMasked(false); // hide the load screen

                    //TODO: Should be coming back and continuing from here
                    Ext.Msg.alert("Success", "You have successfully been registered as a customer. A verification code has been sent to your number, click OK to continue.");	

                    //2a. Store the user data to the HTML-5 Session Variable(for later usage)
                    //var data = Ext.JSON.decode(result.responseText.trim());

                    //console.log(data.v_code);

                    //Direct User to Verification Screen    
                    var verification_screen = Ext.create('FlexiPay.view.Verification_screen');     
                    Ext.Viewport.setActiveItem(verification_screen);
                },

                failure: function(model,operation){
                    Ext.Viewport.setMasked(false); // hide the load screen
                    var reader = model.getProxy().getReader();
                    console.log(model,operation);
                    //var message = reader.getMessage(reader.rawData);
                    Ext.Msg.alert("Error: Server Said::","The Mobile Number exists. Enter a Unique Number");

                    /*METHOD NOT WORKING 
                    var proxy = model.getProxy();
                    proxy.addListener({
                    'exception': function(proxy, response, operation) {
                    var obj = JSON.parse(response.responseText);
                    console.log(obj);  
                    }
                    });
                    */
                }    
            });
        }else{
            Ext.Viewport.setMasked(false); // hide the load screen
            //Ext.Msg.alert("Error", "There were errors in your record, Check the Log for Information");  
            console.log("All Errors",errors.items);

            var data="";
            errors.each(function (item, index, length) {
                // Each item in the errors collection is an instance of the Ext.data.Error class.
                data = data + '|'+item.getField()+' - '+ item.getMessage() +'|' + '\n';
            });
            Ext.Msg.alert("Validation Failed", data);

        }




    },

    onVerifyTap: function(button, e, eOpts) {
        console.log('Verify Tapped');

        var input = this.getVerify_input();
        var values = input.getValue();


        if(values){
            Ext.Viewport.setMasked({
                xtype: 'loadmask',
                message: 'Validating...'
            });

            Ext.Ajax.request({
                url: 'http://41.89.68.188/restserver/index.php/api/Flexipay_server/verify/format/json',
                method: 'POST',
                params: {
                    v_code:values
                },

                success:function(result)
                {
                    Ext.Viewport.setMasked(false); // hide the load screen

                    //1. Should be coming back and continuing from here
                    Ext.Msg.alert("Success", "Verification Success. Choose a secret passcode to verify transactions");	

                    //2. Store the user data to the HTML-5 Session Variable
                    var data = Ext.JSON.decode(result.responseText.trim());

                    //OPTION 2: Store the USER-ID in Session Storage (HTML5)
                    var sessionObject = {'user_id': data.user_id, 'mobile_number': data.mobile_number, 'access_keys':data.access_keys};

                    // Put the session object into storage
                    localStorage.setItem('sessionObject', JSON.stringify(sessionObject ));


                    console.log('sessionObject: ',sessionObject);


                    //3. Send User to pick A 4-Pin Verification
                    //Authorisation Screen
                    var authorisation_screen = Ext.create('FlexiPay.view.Authorisation_screen');
                    Ext.Viewport.setActiveItem(authorisation_screen);

                },

                //Failed.. Call this function..
                failure: function(result){
                    Ext.Viewport.setMasked(false); // hide the load screen
                    Ext.Msg.alert("Error: Server Said::","Incorrect Verification Code Entered");
                },

                scope: this
            });

        }else{
            Ext.Msg.alert("Error","Cannot be blank!");    
        }



    },

    onMerchantSaveTap: function(button, e, eOpts) {
        var form = this.getMerchant_registration();
        var values= form.getValues();
        values['account_id']=1;

        console.log(values);
        Ext.Viewport.setMasked({
            xtype: 'loadmask',
            message: 'Saving Records...'
        });



        //Getting the Instance of the model user which has a proxy
        var record = new FlexiPay.model.Users2(values);
        var errors = record.validate();


        //Ext.device.Notification.vibrate(); //
        if(errors.isValid()){   
            var me = this;
            record.save({
                success:function(result)
                {
                    Ext.Viewport.setMasked(false); // hide the load screen

                    //TODO: Should be coming back and continuing from here
                    Ext.Msg.alert("Success!", "You have successfully been registered as a Merchant. A verification code has been sent to your number, click OK to continue.");	

                    //2a. Store the user data to the HTML-5 Session Variable(for later usage)

                    //var data = Ext.JSON.decode(result.responseText.trim());

                    //console.log(data.v_code);

                    //Direct User to Verification Screen    
                    var verification_screen = Ext.create('FlexiPay.view.Verification_screen');     
                    Ext.Viewport.setActiveItem(verification_screen);
                },

                failure: function(model,operation){
                    Ext.Viewport.setMasked(false); // hide the load screen
                    var reader = model.getProxy().getReader();
                    console.log(model,operation);
                    //var message = reader.getMessage(reader.rawData);
                    Ext.Msg.alert("Error: Server Said::","The Mobile Number exists. Enter a Unique Number");

                    /*METHOD NOT WORKING 
                    var proxy = model.getProxy();
                    proxy.addListener({
                    'exception': function(proxy, response, operation) {
                    var obj = JSON.parse(response.responseText);
                    console.log(obj);  
                    }
                    });
                    */
                }    
            });
        }else{
            Ext.Viewport.setMasked(false); // hide the load screen
            //Ext.Msg.alert("Error", "There were errors in your record, Check the Log for Information");  
            console.log("All Errors",errors.items);

            var data="";
            errors.each(function (item, index, length) {
                // Each item in the errors collection is an instance of the Ext.data.Error class.
                data = data + '|'+item.getField()+' - '+ item.getMessage() +'|' + '\n';
            });
            Ext.Msg.alert("Validation Failed", data);

        }

    },

    onAgentSave: function(button, e, eOpts) {
        var form = this.getAgent_registration();
        var values= form.getValues();
        values['account_id']=2;

        console.log(values);
        Ext.Viewport.setMasked({
            xtype: 'loadmask',
            message: 'Saving Records...'
        });



        //Getting the Instance of the model user which has a proxy
        var record = new FlexiPay.model.Users2(values);
        var errors = record.validate();


        //Ext.device.Notification.vibrate(); //
        if(errors.isValid()){   
            var me = this;
            record.save({
                success:function(result)
                {
                    Ext.Viewport.setMasked(false); // hide the load screen

                    //TODO: Should be coming back and continuing from here
                    Ext.Msg.alert("Success!", "You have successfully been registered as a Agent. A verification code has been sent to your number, click OK to continue.");	

                    //2a. Store the user data to the HTML-5 Session Variable(for later usage)
                    //var data = Ext.JSON.decode(result.responseText.trim());

                    //console.log(data.v_code);
                    //Direct User to Verification Screen    
                    var verification_screen = Ext.create('FlexiPay.view.Verification_screen');     
                    Ext.Viewport.setActiveItem(verification_screen);
                },

                failure: function(model,operation){
                    Ext.Viewport.setMasked(false); // hide the load screen
                    var reader = model.getProxy().getReader();
                    console.log(model,operation);
                    //var message = reader.getMessage(reader.rawData);
                    Ext.Msg.alert("Error: Server Said::","The Mobile Number exists. Enter a Unique Number");
                }    
            });
        }else{
            Ext.Viewport.setMasked(false); // hide the load screen
            //Ext.Msg.alert("Error", "There were errors in your record, Check the Log for Information");  
            console.log("All Errors",errors.items);

            var data="";
            errors.each(function (item, index, length) {
                // Each item in the errors collection is an instance of the Ext.data.Error class.
                data = data + '|'+item.getField()+' - '+ item.getMessage() +'|' + '\n';
            });
            Ext.Msg.alert("Validation Failed", data);

        }
    },

    onAuthenticateTap: function(button, e, eOpts) {
        console.log('Verify Tapped');

        var input = this.getMobile_input();
        var values = input.getValue();


        if(values){   
            //1. Write into Session Storage
            //OPTION 2: Store the USER-ID in Session Storage (HTML5)
            var sessionObject = {'mobile_number':values,'has_account':true};

            // Put the session object into storage
            localStorage.setItem('sessionObject', JSON.stringify(sessionObject ));


            console.log(sessionObject);
            //2. Leave to authorisation screen
            //Authorisation Screen
            var authorisation_screen = Ext.create('FlexiPay.view.Authorisation_screen');
            Ext.Viewport.setActiveItem(authorisation_screen);

        }else{
            Ext.Msg.alert("Error","Cannot be blank!");    
        }

    },

    init: function(application) {
        //alert("Init Called");
    },

    launch: function() {
        //alert("Launch Called");
    }

});