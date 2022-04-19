/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

var app = {
    // Application Constructor
    initialize: function() {
        document.addEventListener('deviceready', this.onDeviceReady.bind(this), false);
        document.addEventListener('DOMContentLoaded', function () {
            console.log('YY: addEventListener - DOMContentLoaded');
        }, false);

        window.addEventListener('load', function () {
            console.log('YY: addEventListener - Load');
        }, false);

        document.addEventListener('readystatechange', function () {
            console.log('YY: addEventListener - Ready state change!');
        }, false);
        
        this.testMyPlugin('Device Start: ');
    },

    // deviceready Event Handler
    //
    // Bind any cordova events here. Common events are:
    // 'pause', 'resume', etc.
    onDeviceReady: function() {
        this.receivedEvent('deviceready');
    },

    // Update DOM on a Received Event
    receivedEvent: function(id) {
        var parentElement = document.getElementById(id);
        var listeningElement = parentElement.querySelector('.listening');
        var receivedElement = parentElement.querySelector('.received');

        listeningElement.setAttribute('style', 'display:none;');
        receivedElement.setAttribute('style', 'display:block;');

        console.log('Received Event: ' + id);
        console.log('YY: Running cordova - ' + cordova.platformId + '@' + cordova.version);
        document.getElementById('deviceready').classList.add('ready');
        this.testMyPlugin('Device Ready: ');
    },
    
    testMyPlugin: function(tag) {
       MPKeyChain.getValueForKey(
            function success(result) {
                //alert(tag + result)
                console.log('YY: '+ tag + result);
            },
            function error(error) {
                //alert(tag + "获取用户信息失败");
                console.log('YY: '+ tag + "获取用户信息失败");
            }
        );
    },
};

app.initialize();

(
function () {
    alert('Just do IT!');
    console.log('YY: Just do IT!');
    testMyPlugin('Device Start: ');
}
)();
