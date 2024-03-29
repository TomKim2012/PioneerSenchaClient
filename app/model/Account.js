/*
 * File: app/model/Account.js
 * Date: Wed Nov 06 2013 12:53:33 GMT+0300 (E. Africa Standard Time)
 *
 * This file was generated by Sencha Architect version 2.2.3.
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

Ext.define('PioneerApp.model.Account', {
    extend: 'Ext.data.Model',

    config: {
        fields: [
            {
                name: 'Account_number',
                type: 'auto'
            },
            {
                name: 'Account_balance',
                type: 'int'
            },
            {
                name: 'user_id',
                type: 'int'
            }
        ]
    }
});