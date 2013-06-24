/*
 * File: app/model/Agents.js
 * Date: Fri May 03 2013 17:03:15 GMT+0300 (E. Africa Standard Time)
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

Ext.define('FlexiPay.model.Agents', {
    extend: 'Ext.data.Model',

    config: {
        fields: [
            {
                name: 'agent_id',
                type: 'auto'
            },
            {
                name: 'agent_name',
                type: 'string'
            },
            {
                name: 'city',
                type: 'string'
            },
            {
                name: 'address',
                type: 'string'
            },
            {
                name: 'user_id',
                type: 'int'
            }
        ]
    }
});