/*
 * File: app/view/Authorisation_screen.js
 * Date: Mon May 13 2013 16:46:08 GMT+0300 (E. Africa Standard Time)
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

Ext.define('FlexiPay.view.Authorisation_screen', {
    extend: 'Ext.form.Panel',
    alias: 'widget.authorisation_screen',

    config: {
        id: 'authorisation_panel',
        ui: 'light',
        layout: {
            type: 'fit'
        },
        items: [
            {
                xtype: 'container',
                ui: '',
                layout: {
                    align: 'center',
                    type: 'vbox'
                },
                items: [
                    {
                        xtype: 'fieldset',
                        title: 'Enter Your Passcode'
                    },
                    {
                        xtype: 'container',
                        padding: '0 3',
                        style: '',
                        defaults: {
                            flex: 1,
                            margin: 4,
                            maxLength: 1,
                            clearIcon: false,
                            pattern: '[0-9]*',
                            style: 'border:1px solid blue;',
                            
                        },
                        layout: {
                            align: 'center',
                            pack: 'center',
                            type: 'hbox'
                        },
                        items: [
                            {
                                xtype: 'passwordfield',
                                style: 'border:1px solid blue;',
                                name: 'mypasswordfield1'
                            },
                            {
                                xtype: 'passwordfield',
                                name: 'mypasswordfield2'
                            },
                            {
                                xtype: 'passwordfield',
                                name: 'mypasswordfield3'
                            },
                            {
                                xtype: 'passwordfield',
                                name: 'mypasswordfield4'
                            }
                        ]
                    },
                    {
                        xtype: 'label',
                        html: 'Please Enter your 4 digit pin',
                        styleHtmlContent: true
                    },
                    {
                        xtype: 'button',
                        id: 'authorise_done',
                        ui: 'confirm',
                        iconAlign: 'right',
                        iconCls: 'arrow_right',
                        iconMask: true,
                        text: 'DONE'
                    }
                ]
            }
        ]
    }

});