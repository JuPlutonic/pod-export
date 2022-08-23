var e="undefined"!==typeof globalThis?globalThis:"undefined"!==typeof self?self:global;var t={};
/*
  @package NOTY - Dependency-free notification library
  @version version: 3.1.4
  @contributors https://github.com/needim/noty/graphs/contributors
  @documentation Examples and Documentation - http://needim.github.com/noty
  @license Licensed under the MIT licenses: http://www.opensource.org/licenses/mit-license.php
*/(function webpackUniversalModuleDefinition(e,o){t=o()})(t,(function(){return function(e){var t={};function __webpack_require__(o){if(t[o])return t[o].exports;var n=t[o]={i:o,l:false,exports:{}};e[o].call(n.exports,n,n.exports,__webpack_require__);n.l=true;return n.exports}__webpack_require__.m=e;__webpack_require__.c=t;__webpack_require__.i=function(e){return e};__webpack_require__.d=function(e,t,o){__webpack_require__.o(e,t)||Object.defineProperty(e,t,{configurable:false,enumerable:true,get:o})};__webpack_require__.n=function(e){var t=e&&e.__esModule?function getDefault(){return e["default"]}:function getModuleExports(){return e};__webpack_require__.d(t,"a",t);return t};__webpack_require__.o=function(e,t){return Object.prototype.hasOwnProperty.call(e,t)};__webpack_require__.p="";return __webpack_require__(__webpack_require__.s=6)}([function(e,t,o){Object.defineProperty(t,"__esModule",{value:true});t.css=t.deepExtend=t.animationEndEvents=void 0;var n="function"===typeof Symbol&&"symbol"===typeof Symbol.iterator?function(e){return typeof e}:function(e){return e&&"function"===typeof Symbol&&e.constructor===Symbol&&e!==Symbol.prototype?"symbol":typeof e};t.inArray=inArray;t.stopPropagation=stopPropagation;t.generateID=generateID;t.outerHeight=outerHeight;t.addListener=addListener;t.hasClass=hasClass;t.addClass=addClass;t.removeClass=removeClass;t.remove=remove;t.classList=classList;t.visibilityChangeFlow=visibilityChangeFlow;t.createAudioElements=createAudioElements;var i=o(1);var r=_interopRequireWildcard(i);function _interopRequireWildcard(e){if(e&&e.__esModule)return e;var t={};if(null!=e)for(var o in e)Object.prototype.hasOwnProperty.call(e,o)&&(t[o]=e[o]);t.default=e;return t}var s=t.animationEndEvents="webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend";function inArray(e,t,o){var n=void 0;var i=!!o;if(i){for(n in t)if(t.hasOwnProperty(n)&&t[n]===e)return true}else for(n in t)if(t.hasOwnProperty(n)&&t[n]===e)return true;return false}function stopPropagation(e){e=e||window.event;"undefined"!==typeof e.stopPropagation?e.stopPropagation():e.cancelBubble=true}var a=t.deepExtend=function deepExtend(e){e=e||{};for(var t=1;t<arguments.length;t++){var o=arguments[t];if(o)for(var i in o)o.hasOwnProperty(i)&&(Array.isArray(o[i])?e[i]=o[i]:"object"===n(o[i])&&null!==o[i]?e[i]=deepExtend(e[i],o[i]):e[i]=o[i])}return e};function generateID(){var e=arguments.length>0&&void 0!==arguments[0]?arguments[0]:"";var t="noty_"+e+"_";t+="xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx".replace(/[xy]/g,(function(e){var t=16*Math.random()|0;var o="x"===e?t:3&t|8;return o.toString(16)}));return t}function outerHeight(e){var t=e.offsetHeight;var o=window.getComputedStyle(e);t+=parseInt(o.marginTop)+parseInt(o.marginBottom);return t}var u=t.css=function(){var e=["Webkit","O","Moz","ms"];var t={};function camelCase(e){return e.replace(/^-ms-/,"ms-").replace(/-([\da-z])/gi,(function(e,t){return t.toUpperCase()}))}function getVendorProp(t){var o=document.body.style;if(t in o)return t;var n=e.length;var i=t.charAt(0).toUpperCase()+t.slice(1);var r=void 0;while(n--){r=e[n]+i;if(r in o)return r}return t}function getStyleProp(e){e=camelCase(e);return t[e]||(t[e]=getVendorProp(e))}function applyCss(e,t,o){t=getStyleProp(t);e.style[t]=o}return function(e,t){var o=arguments;var n=void 0;var i=void 0;if(2===o.length){for(n in t)if(t.hasOwnProperty(n)){i=t[n];void 0!==i&&t.hasOwnProperty(n)&&applyCss(e,n,i)}}else applyCss(e,o[1],o[2])}}();function addListener(e,t,o){var n=arguments.length>3&&void 0!==arguments[3]&&arguments[3];t=t.split(" ");for(var i=0;i<t.length;i++)document.addEventListener?e.addEventListener(t[i],o,n):document.attachEvent&&e.attachEvent("on"+t[i],o)}function hasClass(e,t){var o="string"===typeof e?e:classList(e);return o.indexOf(" "+t+" ")>=0}function addClass(e,t){var o=classList(e);var n=o+t;hasClass(o,t)||(e.className=n.substring(1))}function removeClass(e,t){var o=classList(e);var n=void 0;if(hasClass(e,t)){n=o.replace(" "+t+" "," ");e.className=n.substring(1,n.length-1)}}function remove(e){e.parentNode&&e.parentNode.removeChild(e)}function classList(e){return(" "+(e&&e.className||"")+" ").replace(/\s+/gi," ")}function visibilityChangeFlow(){var e=void 0;var t=void 0;if("undefined"!==typeof document.hidden){e="hidden";t="visibilitychange"}else if("undefined"!==typeof document.msHidden){e="msHidden";t="msvisibilitychange"}else if("undefined"!==typeof document.webkitHidden){e="webkitHidden";t="webkitvisibilitychange"}function onVisibilityChange(){r.PageHidden=document[e];handleVisibilityChange()}function onBlur(){r.PageHidden=true;handleVisibilityChange()}function onFocus(){r.PageHidden=false;handleVisibilityChange()}function handleVisibilityChange(){r.PageHidden?stopAll():resumeAll()}function stopAll(){setTimeout((function(){Object.keys(r.Store).forEach((function(e){r.Store.hasOwnProperty(e)&&r.Store[e].options.visibilityControl&&r.Store[e].stop()}))}),100)}function resumeAll(){setTimeout((function(){Object.keys(r.Store).forEach((function(e){r.Store.hasOwnProperty(e)&&r.Store[e].options.visibilityControl&&r.Store[e].resume()}));r.queueRenderAll()}),100)}t&&addListener(document,t,onVisibilityChange);addListener(window,"blur",onBlur);addListener(window,"focus",onFocus)}function createAudioElements(e){if(e.hasSound){var t=document.createElement("audio");e.options.sounds.sources.forEach((function(e){var o=document.createElement("source");o.src=e;o.type="audio/"+getExtension(e);t.appendChild(o)}));e.barDom?e.barDom.appendChild(t):document.querySelector("body").appendChild(t);t.volume=e.options.sounds.volume;if(!e.soundPlayed){t.play();e.soundPlayed=true}t.onended=function(){remove(t)}}}function getExtension(e){return e.match(/\.([^.]+)$/)[1]}},function(e,t,o){Object.defineProperty(t,"__esModule",{value:true});t.Defaults=t.Store=t.Queues=t.DefaultMaxVisible=t.docTitle=t.DocModalCount=t.PageHidden=void 0;t.getQueueCounts=getQueueCounts;t.addToQueue=addToQueue;t.removeFromQueue=removeFromQueue;t.queueRender=queueRender;t.queueRenderAll=queueRenderAll;t.ghostFix=ghostFix;t.build=build;t.hasButtons=hasButtons;t.handleModal=handleModal;t.handleModalClose=handleModalClose;t.queueClose=queueClose;t.dequeueClose=dequeueClose;t.fire=fire;t.openFlow=openFlow;t.closeFlow=closeFlow;var n=o(0);var i=_interopRequireWildcard(n);function _interopRequireWildcard(e){if(e&&e.__esModule)return e;var t={};if(null!=e)for(var o in e)Object.prototype.hasOwnProperty.call(e,o)&&(t[o]=e[o]);t.default=e;return t}var r=t.PageHidden=false;var s=t.DocModalCount=0;var a={originalTitle:null,count:0,changed:false,timer:-1};var u=t.docTitle={increment:function increment(){a.count++;u._update()},decrement:function decrement(){a.count--;a.count<=0?u._clear():u._update()},_update:function _update(){var e=document.title;if(a.changed)document.title="("+a.count+") "+a.originalTitle;else{a.originalTitle=e;document.title="("+a.count+") "+e;a.changed=true}},_clear:function _clear(){if(a.changed){a.count=0;document.title=a.originalTitle;a.changed=false}}};var l=t.DefaultMaxVisible=5;var c=t.Queues={global:{maxVisible:l,queue:[]}};var f=t.Store={};var d=t.Defaults={type:"alert",layout:"topRight",theme:"mint",text:"",timeout:false,progressBar:true,closeWith:["click"],animation:{open:"noty_effects_open",close:"noty_effects_close"},id:false,force:false,killer:false,queue:"global",container:false,buttons:[],callbacks:{beforeShow:null,onShow:null,afterShow:null,onClose:null,afterClose:null,onClick:null,onHover:null,onTemplate:null},sounds:{sources:[],volume:1,conditions:[]},titleCount:{conditions:[]},modal:false,visibilityControl:false
/**
         * @param {string} queueName
         * @return {object}
         */};function getQueueCounts(){var e=arguments.length>0&&void 0!==arguments[0]?arguments[0]:"global";var t=0;var o=l;if(c.hasOwnProperty(e)){o=c[e].maxVisible;Object.keys(f).forEach((function(o){f[o].options.queue!==e||f[o].closed||t++}))}return{current:t,maxVisible:o}}
/**
       * @param {Noty} ref
       * @return {void}
       */function addToQueue(e){c.hasOwnProperty(e.options.queue)||(c[e.options.queue]={maxVisible:l,queue:[]});c[e.options.queue].queue.push(e)}
/**
       * @param {Noty} ref
       * @return {void}
       */function removeFromQueue(e){if(c.hasOwnProperty(e.options.queue)){var t=[];Object.keys(c[e.options.queue].queue).forEach((function(o){c[e.options.queue].queue[o].id!==e.id&&t.push(c[e.options.queue].queue[o])}));c[e.options.queue].queue=t}}
/**
       * @param {string} queueName
       * @return {void}
       */function queueRender(){var e=arguments.length>0&&void 0!==arguments[0]?arguments[0]:"global";if(c.hasOwnProperty(e)){var t=c[e].queue.shift();t&&t.show()}}function queueRenderAll(){Object.keys(c).forEach((function(e){queueRender(e)}))}
/**
       * @param {Noty} ref
       * @return {void}
       */function ghostFix(e){var t=i.generateID("ghost");var o=document.createElement("div");o.setAttribute("id",t);i.css(o,{height:i.outerHeight(e.barDom)+"px"});e.barDom.insertAdjacentHTML("afterend",o.outerHTML);i.remove(e.barDom);o=document.getElementById(t);i.addClass(o,"noty_fix_effects_height");i.addListener(o,i.animationEndEvents,(function(){i.remove(o)}))}
/**
       * @param {Noty} ref
       * @return {void}
       */function build(e){findOrCreateContainer(e);var t='<div class="noty_body">'+e.options.text+"</div>"+buildButtons(e)+'<div class="noty_progressbar"></div>';e.barDom=document.createElement("div");e.barDom.setAttribute("id",e.id);i.addClass(e.barDom,"noty_bar noty_type__"+e.options.type+" noty_theme__"+e.options.theme);e.barDom.innerHTML=t;fire(e,"onTemplate")}
/**
       * @param {Noty} ref
       * @return {boolean}
       */function hasButtons(e){return!!(e.options.buttons&&Object.keys(e.options.buttons).length)}
/**
       * @param {Noty} ref
       * @return {string}
       */function buildButtons(e){if(hasButtons(e)){var t=document.createElement("div");i.addClass(t,"noty_buttons");Object.keys(e.options.buttons).forEach((function(o){t.appendChild(e.options.buttons[o].dom)}));e.options.buttons.forEach((function(e){t.appendChild(e.dom)}));return t.outerHTML}return""}
/**
       * @param {Noty} ref
       * @return {void}
       */function handleModal(e){if(e.options.modal){0===s&&createModal(e);t.DocModalCount=s+=1}}
/**
       * @param {Noty} ref
       * @return {void}
       */function handleModalClose(e){if(e.options.modal&&s>0){t.DocModalCount=s-=1;if(s<=0){var o=document.querySelector(".noty_modal");if(o){i.removeClass(o,"noty_modal_open");i.addClass(o,"noty_modal_close");i.addListener(o,i.animationEndEvents,(function(){i.remove(o)}))}}}}function createModal(){var e=document.querySelector("body");var t=document.createElement("div");i.addClass(t,"noty_modal");e.insertBefore(t,e.firstChild);i.addClass(t,"noty_modal_open");i.addListener(t,i.animationEndEvents,(function(){i.removeClass(t,"noty_modal_open")}))}
/**
       * @param {Noty} ref
       * @return {void}
       */function findOrCreateContainer(e){if(e.options.container)e.layoutDom=document.querySelector(e.options.container);else{var t="noty_layout__"+e.options.layout;e.layoutDom=document.querySelector("div#"+t);if(!e.layoutDom){e.layoutDom=document.createElement("div");e.layoutDom.setAttribute("id",t);e.layoutDom.setAttribute("role","alert");e.layoutDom.setAttribute("aria-live","polite");i.addClass(e.layoutDom,"noty_layout");document.querySelector("body").appendChild(e.layoutDom)}}}
/**
       * @param {Noty} ref
       * @return {void}
       */function queueClose(e){if(e.options.timeout){e.options.progressBar&&e.progressDom&&i.css(e.progressDom,{transition:"width "+e.options.timeout+"ms linear",width:"0%"});clearTimeout(e.closeTimer);e.closeTimer=setTimeout((function(){e.close()}),e.options.timeout)}}
/**
       * @param {Noty} ref
       * @return {void}
       */function dequeueClose(e){if(e.options.timeout&&e.closeTimer){clearTimeout(e.closeTimer);e.closeTimer=-1;e.options.progressBar&&e.progressDom&&i.css(e.progressDom,{transition:"width 0ms linear",width:"100%"})}}
/**
       * @param {Noty} ref
       * @param {string} eventName
       * @return {void}
       */function fire(e,t){e.listeners.hasOwnProperty(t)&&e.listeners[t].forEach((function(t){"function"===typeof t&&t.apply(e)}))}
/**
       * @param {Noty} ref
       * @return {void}
       */function openFlow(e){fire(e,"afterShow");queueClose(e);i.addListener(e.barDom,"mouseenter",(function(){dequeueClose(e)}));i.addListener(e.barDom,"mouseleave",(function(){queueClose(e)}))}
/**
       * @param {Noty} ref
       * @return {void}
       */function closeFlow(e){delete f[e.id];e.closing=false;fire(e,"afterClose");i.remove(e.barDom);0!==e.layoutDom.querySelectorAll(".noty_bar").length||e.options.container||i.remove(e.layoutDom);(i.inArray("docVisible",e.options.titleCount.conditions)||i.inArray("docHidden",e.options.titleCount.conditions))&&u.decrement();queueRender(e.options.queue)}},function(t,o,n){Object.defineProperty(o,"__esModule",{value:true});o.NotyButton=void 0;var i=n(0);var r=_interopRequireWildcard(i);function _interopRequireWildcard(e){if(e&&e.__esModule)return e;var t={};if(null!=e)for(var o in e)Object.prototype.hasOwnProperty.call(e,o)&&(t[o]=e[o]);t.default=e;return t}function _classCallCheck(e,t){if(!(e instanceof t))throw new TypeError("Cannot call a class as a function")}var s=o.NotyButton=function NotyButton(t,o,n){var i=this||e;var s=arguments.length>3&&void 0!==arguments[3]?arguments[3]:{};_classCallCheck(this||e,NotyButton);(this||e).dom=document.createElement("button");(this||e).dom.innerHTML=t;(this||e).id=s.id=s.id||r.generateID("button");(this||e).cb=n;Object.keys(s).forEach((function(e){i.dom.setAttribute(e,s[e])}));r.addClass((this||e).dom,o||"noty_btn");return this||e}},function(t,o,n){Object.defineProperty(o,"__esModule",{value:true});var i=function(){function defineProperties(e,t){for(var o=0;o<t.length;o++){var n=t[o];n.enumerable=n.enumerable||false;n.configurable=true;"value"in n&&(n.writable=true);Object.defineProperty(e,n.key,n)}}return function(e,t,o){t&&defineProperties(e.prototype,t);o&&defineProperties(e,o);return e}}();function _classCallCheck(e,t){if(!(e instanceof t))throw new TypeError("Cannot call a class as a function")}var r=o.Push=function(){function Push(){var t=arguments.length>0&&void 0!==arguments[0]?arguments[0]:"/service-worker.js";_classCallCheck(this||e,Push);(this||e).subData={};(this||e).workerPath=t;(this||e).listeners={onPermissionGranted:[],onPermissionDenied:[],onSubscriptionSuccess:[],onSubscriptionCancel:[],onWorkerError:[],onWorkerSuccess:[],onWorkerNotSupported:[]};return this||e}
/**
         * @param {string} eventName
         * @param {function} cb
         * @return {Push}
         */i(Push,[{key:"on",value:function on(t){var o=arguments.length>1&&void 0!==arguments[1]?arguments[1]:function(){};"function"===typeof o&&(this||e).listeners.hasOwnProperty(t)&&(this||e).listeners[t].push(o);return this||e}},{key:"fire",value:function fire(t){var o=this||e;var n=arguments.length>1&&void 0!==arguments[1]?arguments[1]:[];(this||e).listeners.hasOwnProperty(t)&&(this||e).listeners[t].forEach((function(e){"function"===typeof e&&e.apply(o,n)}))}},{key:"create",value:function create(){console.log("NOT IMPLEMENTED YET")}},{key:"isSupported",value:function isSupported(){var e=false;try{e=window.Notification||window.webkitNotifications||navigator.mozNotification||window.external&&void 0!==window.external.msIsSiteMode()}catch(e){}return e}},{key:"getPermissionStatus",value:function getPermissionStatus(){var e="default";if(window.Notification&&window.Notification.permissionLevel)e=window.Notification.permissionLevel;else if(window.webkitNotifications&&window.webkitNotifications.checkPermission)switch(window.webkitNotifications.checkPermission()){case 1:e="default";break;case 0:e="granted";break;default:e="denied"}else window.Notification&&window.Notification.permission?e=window.Notification.permission:navigator.mozNotification?e="granted":window.external&&void 0!==window.external.msIsSiteMode()&&(e=window.external.msIsSiteMode()?"granted":"default");return e.toString().toLowerCase()}},{key:"getEndpoint",value:function getEndpoint(e){var t=e.endpoint;var o=e.subscriptionId;o&&-1===t.indexOf(o)&&(t+="/"+o);return t}},{key:"isSWRegistered",value:function isSWRegistered(){try{return"activated"===navigator.serviceWorker.controller.state}catch(e){return false}}},{key:"unregisterWorker",value:function unregisterWorker(){var t=this||e;"serviceWorker"in navigator&&navigator.serviceWorker.getRegistrations().then((function(e){var o=true;var n=false;var i=void 0;try{for(var r=e[Symbol.iterator](),s;!(o=(s=r.next()).done);o=true){var a=s.value;a.unregister();t.fire("onSubscriptionCancel")}}catch(e){n=true;i=e}finally{try{!o&&r.return&&r.return()}finally{if(n)throw i}}}))}},{key:"requestSubscription",value:function requestSubscription(){var t=this||e;var o=!(arguments.length>0&&void 0!==arguments[0])||arguments[0];var n=this||e;var i=this.getPermissionStatus();var r=function cb(e){if("granted"===e){t.fire("onPermissionGranted");"serviceWorker"in navigator?navigator.serviceWorker.register(t.workerPath).then((function(){navigator.serviceWorker.ready.then((function(e){n.fire("onWorkerSuccess");e.pushManager.subscribe({userVisibleOnly:o}).then((function(e){var t=e.getKey("p256dh");var o=e.getKey("auth");n.subData={endpoint:n.getEndpoint(e),p256dh:t?window.btoa(String.fromCharCode.apply(null,new Uint8Array(t))):null,auth:o?window.btoa(String.fromCharCode.apply(null,new Uint8Array(o))):null};n.fire("onSubscriptionSuccess",[n.subData])})).catch((function(e){n.fire("onWorkerError",[e])}))}))})):n.fire("onWorkerNotSupported")}else if("denied"===e){t.fire("onPermissionDenied");t.unregisterWorker()}};"default"===i?window.Notification&&window.Notification.requestPermission?window.Notification.requestPermission(r):window.webkitNotifications&&window.webkitNotifications.checkPermission&&window.webkitNotifications.requestPermission(r):r(i)}}]);return Push}()},function(t,o,n){(function(o,i){var r;
/*!
        * @overview es6-promise - a tiny implementation of Promises/A+.
        * @copyright Copyright (c) 2014 Yehuda Katz, Tom Dale, Stefan Penner and contributors (Conversion to ES6 API by Jake Archibald)
        * @license   Licensed under MIT license
        *            See https://raw.githubusercontent.com/stefanpenner/es6-promise/master/LICENSE
        * @version   4.1.1
        */(function(e,o){true?t.exports=o():e.ES6Promise=o()})(this||e,(function(){function objectOrFunction(e){var t=typeof e;return null!==e&&("object"===t||"function"===t)}function isFunction(e){return"function"===typeof e}var t=void 0;t=Array.isArray?Array.isArray:function(e){return"[object Array]"===Object.prototype.toString.call(e)};var s=t;var a=0;var u=void 0;var l=void 0;var c=function asap(e,t){m[a]=e;m[a+1]=t;a+=2;2===a&&(l?l(flush):y())};function setScheduler(e){l=e}function setAsap(e){c=e}var f="undefined"!==typeof window?window:void 0;var d=f||{};var h=d.MutationObserver||d.WebKitMutationObserver;var p="undefined"===typeof self&&"undefined"!==typeof o&&"[object process]"==={}.toString.call(o);var v="undefined"!==typeof Uint8ClampedArray&&"undefined"!==typeof importScripts&&"undefined"!==typeof MessageChannel;function useNextTick(){return function(){return o.nextTick(flush)}}function useVertxTimer(){return"undefined"!==typeof u?function(){u(flush)}:useSetTimeout()}function useMutationObserver(){var e=0;var t=new h(flush);var o=document.createTextNode("");t.observe(o,{characterData:true});return function(){o.data=e=++e%2}}function useMessageChannel(){var e=new MessageChannel;e.port1.onmessage=flush;return function(){return e.port2.postMessage(0)}}function useSetTimeout(){var e=setTimeout;return function(){return e(flush,1)}}var m=new Array(1e3);function flush(){for(var e=0;e<a;e+=2){var t=m[e];var o=m[e+1];t(o);m[e]=void 0;m[e+1]=void 0}a=0}function attemptVertx(){try{var e=r;var t=n(9);u=t.runOnLoop||t.runOnContext;return useVertxTimer()}catch(e){return useSetTimeout()}}var y=void 0;y=p?useNextTick():h?useMutationObserver():v?useMessageChannel():void 0===f&&"function"==="function"?attemptVertx():useSetTimeout();function then(t,o){var n=arguments;var i=this||e;var r=new(this||e).constructor(noop);void 0===r[b]&&makePromise(r);var s=i._state;s?function(){var e=n[s-1];c((function(){return invokeCallback(s,r,e,i._result)}))}():subscribe(i,r,t,o);return r}
/**
            `Promise.resolve` returns a promise that will become resolved with the
            passed `value`. It is shorthand for the following:

            ```javascript
            let promise = new Promise(function(resolve, reject){
              resolve(1);
            });

            promise.then(function(value){
              // value === 1
            });
            ```

            Instead of writing the above, your code now simply becomes the following:

            ```javascript
            let promise = Promise.resolve(1);

            promise.then(function(value){
              // value === 1
            });
            ```

            @method resolve
            @static
            @param {Any} value value that the returned promise will be resolved with
            Useful for tooling.
            @return {Promise} a promise that will become fulfilled with the given
            `value`
          */function resolve$1(t){var o=this||e;if(t&&"object"===typeof t&&t.constructor===o)return t;var n=new o(noop);resolve(n,t);return n}var b=Math.random().toString(36).substring(16);function noop(){}var _=void 0;var w=1;var g=2;var C=new ErrorObject;function selfFulfillment(){return new TypeError("You cannot resolve a promise with itself")}function cannotReturnOwn(){return new TypeError("A promises callback cannot return that same promise.")}function getThen(e){try{return e.then}catch(e){C.error=e;return C}}function tryThen(e,t,o,n){try{e.call(t,o,n)}catch(e){return e}}function handleForeignThenable(e,t,o){c((function(e){var n=false;var i=tryThen(o,t,(function(o){if(!n){n=true;t!==o?resolve(e,o):fulfill(e,o)}}),(function(t){if(!n){n=true;reject(e,t)}}),"Settle: "+(e._label||" unknown promise"));if(!n&&i){n=true;reject(e,i)}}),e)}function handleOwnThenable(e,t){t._state===w?fulfill(e,t._result):t._state===g?reject(e,t._result):subscribe(t,void 0,(function(t){return resolve(e,t)}),(function(t){return reject(e,t)}))}function handleMaybeThenable(e,t,o){if(t.constructor===e.constructor&&o===then&&t.constructor.resolve===resolve$1)handleOwnThenable(e,t);else if(o===C){reject(e,C.error);C.error=null}else void 0===o?fulfill(e,t):isFunction(o)?handleForeignThenable(e,t,o):fulfill(e,t)}function resolve(e,t){e===t?reject(e,selfFulfillment()):objectOrFunction(t)?handleMaybeThenable(e,t,getThen(t)):fulfill(e,t)}function publishRejection(e){e._onerror&&e._onerror(e._result);publish(e)}function fulfill(e,t){if(e._state===_){e._result=t;e._state=w;0!==e._subscribers.length&&c(publish,e)}}function reject(e,t){if(e._state===_){e._state=g;e._result=t;c(publishRejection,e)}}function subscribe(e,t,o,n){var i=e._subscribers;var r=i.length;e._onerror=null;i[r]=t;i[r+w]=o;i[r+g]=n;0===r&&e._state&&c(publish,e)}function publish(e){var t=e._subscribers;var o=e._state;if(0!==t.length){var n=void 0,i=void 0,r=e._result;for(var s=0;s<t.length;s+=3){n=t[s];i=t[s+o];n?invokeCallback(o,n,i,r):i(r)}e._subscribers.length=0}}function ErrorObject(){(this||e).error=null}var k=new ErrorObject;function tryCatch(e,t){try{return e(t)}catch(e){k.error=e;return k}}function invokeCallback(e,t,o,n){var i=isFunction(o),r=void 0,s=void 0,a=void 0,u=void 0;if(i){r=tryCatch(o,n);if(r===k){u=true;s=r.error;r.error=null}else a=true;if(t===r){reject(t,cannotReturnOwn());return}}else{r=n;a=true}t._state!==_||(i&&a?resolve(t,r):u?reject(t,s):e===w?fulfill(t,r):e===g&&reject(t,r))}function initializePromise(e,t){try{t((function resolvePromise(t){resolve(e,t)}),(function rejectPromise(t){reject(e,t)}))}catch(t){reject(e,t)}}var P=0;function nextId(){return P++}function makePromise(e){e[b]=P++;e._state=void 0;e._result=void 0;e._subscribers=[]}function Enumerator$1(t,o){(this||e)._instanceConstructor=t;(this||e).promise=new t(noop);(this||e).promise[b]||makePromise((this||e).promise);if(s(o)){(this||e).length=o.length;(this||e)._remaining=o.length;(this||e)._result=new Array((this||e).length);if(0===(this||e).length)fulfill((this||e).promise,(this||e)._result);else{(this||e).length=(this||e).length||0;this._enumerate(o);0===(this||e)._remaining&&fulfill((this||e).promise,(this||e)._result)}}else reject((this||e).promise,validationError())}function validationError(){return new Error("Array Methods must be provided an Array")}Enumerator$1.prototype._enumerate=function(t){for(var o=0;(this||e)._state===_&&o<t.length;o++)this._eachEntry(t[o],o)};Enumerator$1.prototype._eachEntry=function(t,o){var n=(this||e)._instanceConstructor;var i=n.resolve;if(i===resolve$1){var r=getThen(t);if(r===then&&t._state!==_)this._settledAt(t._state,o,t._result);else if("function"!==typeof r){(this||e)._remaining--;(this||e)._result[o]=t}else if(n===Promise$2){var s=new n(noop);handleMaybeThenable(s,t,r);this._willSettleAt(s,o)}else this._willSettleAt(new n((function(e){return e(t)})),o)}else this._willSettleAt(i(t),o)};Enumerator$1.prototype._settledAt=function(t,o,n){var i=(this||e).promise;if(i._state===_){(this||e)._remaining--;t===g?reject(i,n):(this||e)._result[o]=n}0===(this||e)._remaining&&fulfill(i,(this||e)._result)};Enumerator$1.prototype._willSettleAt=function(t,o){var n=this||e;subscribe(t,void 0,(function(e){return n._settledAt(w,o,e)}),(function(e){return n._settledAt(g,o,e)}))};
/**
            `Promise.all` accepts an array of promises, and returns a new promise which
            is fulfilled with an array of fulfillment values for the passed promises, or
            rejected with the reason of the first passed promise to be rejected. It casts all
            elements of the passed iterable to promises as it runs this algorithm.

            Example:

            ```javascript
            let promise1 = resolve(1);
            let promise2 = resolve(2);
            let promise3 = resolve(3);
            let promises = [ promise1, promise2, promise3 ];

            Promise.all(promises).then(function(array){
              // The array here would be [ 1, 2, 3 ];
            });
            ```

            If any of the `promises` given to `all` are rejected, the first promise
            that is rejected will be given as an argument to the returned promises's
            rejection handler. For example:

            Example:

            ```javascript
            let promise1 = resolve(1);
            let promise2 = reject(new Error("2"));
            let promise3 = reject(new Error("3"));
            let promises = [ promise1, promise2, promise3 ];

            Promise.all(promises).then(function(array){
              // Code here never runs because there are rejected promises!
            }, function(error) {
              // error.message === "2"
            });
            ```

            @method all
            @static
            @param {Array} entries array of promises
            @param {String} label optional string for labeling the promise.
            Useful for tooling.
            @return {Promise} promise that is fulfilled when all `promises` have been
            fulfilled, or rejected if any of them become rejected.
            @static
          */function all$1(t){return new Enumerator$1(this||e,t).promise}
/**
            `Promise.race` returns a new promise which is settled in the same way as the
            first passed promise to settle.

            Example:

            ```javascript
            let promise1 = new Promise(function(resolve, reject){
              setTimeout(function(){
                resolve('promise 1');
              }, 200);
            });

            let promise2 = new Promise(function(resolve, reject){
              setTimeout(function(){
                resolve('promise 2');
              }, 100);
            });

            Promise.race([promise1, promise2]).then(function(result){
              // result === 'promise 2' because it was resolved before promise1
              // was resolved.
            });
            ```

            `Promise.race` is deterministic in that only the state of the first
            settled promise matters. For example, even if other promises given to the
            `promises` array argument are resolved, but the first settled promise has
            become rejected before the other promises became fulfilled, the returned
            promise will become rejected:

            ```javascript
            let promise1 = new Promise(function(resolve, reject){
              setTimeout(function(){
                resolve('promise 1');
              }, 200);
            });

            let promise2 = new Promise(function(resolve, reject){
              setTimeout(function(){
                reject(new Error('promise 2'));
              }, 100);
            });

            Promise.race([promise1, promise2]).then(function(result){
              // Code here never runs
            }, function(reason){
              // reason.message === 'promise 2' because promise 2 became rejected before
              // promise 1 became fulfilled
            });
            ```

            An example real-world use case is implementing timeouts:

            ```javascript
            Promise.race([ajax('foo.json'), timeout(5000)])
            ```

            @method race
            @static
            @param {Array} promises array of promises to observe
            Useful for tooling.
            @return {Promise} a promise which settles in the same way as the first passed
            promise to settle.
          */function race$1(t){var o=this||e;return s(t)?new o((function(e,n){var i=t.length;for(var r=0;r<i;r++)o.resolve(t[r]).then(e,n)})):new o((function(e,t){return t(new TypeError("You must pass an array to race."))}))}
/**
            `Promise.reject` returns a promise rejected with the passed `reason`.
            It is shorthand for the following:

            ```javascript
            let promise = new Promise(function(resolve, reject){
              reject(new Error('WHOOPS'));
            });

            promise.then(function(value){
              // Code here doesn't run because the promise is rejected!
            }, function(reason){
              // reason.message === 'WHOOPS'
            });
            ```

            Instead of writing the above, your code now simply becomes the following:

            ```javascript
            let promise = Promise.reject(new Error('WHOOPS'));

            promise.then(function(value){
              // Code here doesn't run because the promise is rejected!
            }, function(reason){
              // reason.message === 'WHOOPS'
            });
            ```

            @method reject
            @static
            @param {Any} reason value that the returned promise will be rejected with.
            Useful for tooling.
            @return {Promise} a promise rejected with the given `reason`.
          */function reject$1(t){var o=this||e;var n=new o(noop);reject(n,t);return n}function needsResolver(){throw new TypeError("You must pass a resolver function as the first argument to the promise constructor")}function needsNew(){throw new TypeError("Failed to construct 'Promise': Please use the 'new' operator, this object constructor cannot be called as a function.")}
/**
            Promise objects represent the eventual result of an asynchronous operation. The
            primary way of interacting with a promise is through its `then` method, which
            registers callbacks to receive either a promise's eventual value or the reason
            why the promise cannot be fulfilled.

            Terminology
            -----------

            - `promise` is an object or function with a `then` method whose behavior conforms to this specification.
            - `thenable` is an object or function that defines a `then` method.
            - `value` is any legal JavaScript value (including undefined, a thenable, or a promise).
            - `exception` is a value that is thrown using the throw statement.
            - `reason` is a value that indicates why a promise was rejected.
            - `settled` the final resting state of a promise, fulfilled or rejected.

            A promise can be in one of three states: pending, fulfilled, or rejected.

            Promises that are fulfilled have a fulfillment value and are in the fulfilled
            state.  Promises that are rejected have a rejection reason and are in the
            rejected state.  A fulfillment value is never a thenable.

            Promises can also be said to *resolve* a value.  If this value is also a
            promise, then the original promise's settled state will match the value's
            settled state.  So a promise that *resolves* a promise that rejects will
            itself reject, and a promise that *resolves* a promise that fulfills will
            itself fulfill.


            Basic Usage:
            ------------

            ```js
            let promise = new Promise(function(resolve, reject) {
              // on success
              resolve(value);

              // on failure
              reject(reason);
            });

            promise.then(function(value) {
              // on fulfillment
            }, function(reason) {
              // on rejection
            });
            ```

            Advanced Usage:
            ---------------

            Promises shine when abstracting away asynchronous interactions such as
            `XMLHttpRequest`s.

            ```js
            function getJSON(url) {
              return new Promise(function(resolve, reject){
                let xhr = new XMLHttpRequest();

                xhr.open('GET', url);
                xhr.onreadystatechange = handler;
                xhr.responseType = 'json';
                xhr.setRequestHeader('Accept', 'application/json');
                xhr.send();

                function handler() {
                  if (this.readyState === this.DONE) {
                    if (this.status === 200) {
                      resolve(this.response);
                    } else {
                      reject(new Error('getJSON: `' + url + '` failed with status: [' + this.status + ']'));
                    }
                  }
                };
              });
            }

            getJSON('/posts.json').then(function(json) {
              // on fulfillment
            }, function(reason) {
              // on rejection
            });
            ```

            Unlike callbacks, promises are great composable primitives.

            ```js
            Promise.all([
              getJSON('/posts'),
              getJSON('/comments')
            ]).then(function(values){
              values[0] // => postsJSON
              values[1] // => commentsJSON

              return values;
            });
            ```

            @class Promise
            @param {function} resolver
            Useful for tooling.
            @constructor
          */function Promise$2(t){(this||e)[b]=nextId();(this||e)._result=(this||e)._state=void 0;(this||e)._subscribers=[];if(noop!==t){"function"!==typeof t&&needsResolver();(this||e)instanceof Promise$2?initializePromise(this||e,t):needsNew()}}Promise$2.all=all$1;Promise$2.race=race$1;Promise$2.resolve=resolve$1;Promise$2.reject=reject$1;Promise$2._setScheduler=setScheduler;Promise$2._setAsap=setAsap;Promise$2._asap=c;Promise$2.prototype={constructor:Promise$2,
/**
              The primary way of interacting with a promise is through its `then` method,
              which registers callbacks to receive either a promise's eventual value or the
              reason why the promise cannot be fulfilled.

              ```js
              findUser().then(function(user){
                // user is available
              }, function(reason){
                // user is unavailable, and you are given the reason why
              });
              ```

              Chaining
              --------

              The return value of `then` is itself a promise.  This second, 'downstream'
              promise is resolved with the return value of the first promise's fulfillment
              or rejection handler, or rejected if the handler throws an exception.

              ```js
              findUser().then(function (user) {
                return user.name;
              }, function (reason) {
                return 'default name';
              }).then(function (userName) {
                // If `findUser` fulfilled, `userName` will be the user's name, otherwise it
                // will be `'default name'`
              });

              findUser().then(function (user) {
                throw new Error('Found user, but still unhappy');
              }, function (reason) {
                throw new Error('`findUser` rejected and we're unhappy');
              }).then(function (value) {
                // never reached
              }, function (reason) {
                // if `findUser` fulfilled, `reason` will be 'Found user, but still unhappy'.
                // If `findUser` rejected, `reason` will be '`findUser` rejected and we're unhappy'.
              });
              ```
              If the downstream promise does not specify a rejection handler, rejection reasons will be propagated further downstream.

              ```js
              findUser().then(function (user) {
                throw new PedagogicalException('Upstream error');
              }).then(function (value) {
                // never reached
              }).then(function (value) {
                // never reached
              }, function (reason) {
                // The `PedgagocialException` is propagated all the way down to here
              });
              ```

              Assimilation
              ------------

              Sometimes the value you want to propagate to a downstream promise can only be
              retrieved asynchronously. This can be achieved by returning a promise in the
              fulfillment or rejection handler. The downstream promise will then be pending
              until the returned promise is settled. This is called *assimilation*.

              ```js
              findUser().then(function (user) {
                return findCommentsByAuthor(user);
              }).then(function (comments) {
                // The user's comments are now available
              });
              ```

              If the assimliated promise rejects, then the downstream promise will also reject.

              ```js
              findUser().then(function (user) {
                return findCommentsByAuthor(user);
              }).then(function (comments) {
                // If `findCommentsByAuthor` fulfills, we'll have the value here
              }, function (reason) {
                // If `findCommentsByAuthor` rejects, we'll have the reason here
              });
              ```

              Simple Example
              --------------

              Synchronous Example

              ```javascript
              let result;

              try {
                result = findResult();
                // success
              } catch(reason) {
                // failure
              }
              ```

              Errback Example

              ```js
              findResult(function(result, err){
                if (err) {
                  // failure
                } else {
                  // success
                }
              });
              ```

              Promise Example;

              ```javascript
              findResult().then(function(result){
                // success
              }, function(reason){
                // failure
              });
              ```

              Advanced Example
              --------------

              Synchronous Example

              ```javascript
              let author, books;

              try {
                author = findAuthor();
                books  = findBooksByAuthor(author);
                // success
              } catch(reason) {
                // failure
              }
              ```

              Errback Example

              ```js

              function foundBooks(books) {

              }

              function failure(reason) {

              }

              findAuthor(function(author, err){
                if (err) {
                  failure(err);
                  // failure
                } else {
                  try {
                    findBoooksByAuthor(author, function(books, err) {
                      if (err) {
                        failure(err);
                      } else {
                        try {
                          foundBooks(books);
                        } catch(reason) {
                          failure(reason);
                        }
                      }
                    });
                  } catch(error) {
                    failure(err);
                  }
                  // success
                }
              });
              ```

              Promise Example;

              ```javascript
              findAuthor().
                then(findBooksByAuthor).
                then(function(books){
                  // found books
              }).catch(function(reason){
                // something went wrong
              });
              ```

              @method then
              @param {Function} onFulfilled
              @param {Function} onRejected
              Useful for tooling.
              @return {Promise}
            */
then:then,
/**
              `catch` is simply sugar for `then(undefined, onRejection)` which makes it the same
              as the catch block of a try/catch statement.

              ```js
              function findAuthor(){
                throw new Error('couldn't find that author');
              }

              // synchronous
              try {
                findAuthor();
              } catch(reason) {
                // something went wrong
              }

              // async with promises
              findAuthor().catch(function(reason){
                // something went wrong
              });
              ```

              @method catch
              @param {Function} onRejection
              Useful for tooling.
              @return {Promise}
            */
catch:function _catch(e){return this.then(null,e)}};function polyfill$1(){var e=void 0;if("undefined"!==typeof i)e=i;else if("undefined"!==typeof self)e=self;else try{e=Function("return this")()}catch(e){throw new Error("polyfill failed because global object is unavailable in this environment")}var t=e.Promise;if(t){var o=null;try{o=Object.prototype.toString.call(t.resolve())}catch(e){}if("[object Promise]"===o&&!t.cast)return}e.Promise=Promise$2}Promise$2.polyfill=polyfill$1;Promise$2.Promise=Promise$2;return Promise$2}))}).call(o,n(7),n(8))},function(e,t){},function(t,o,n){Object.defineProperty(o,"__esModule",{value:true});var i=function(){function defineProperties(e,t){for(var o=0;o<t.length;o++){var n=t[o];n.enumerable=n.enumerable||false;n.configurable=true;"value"in n&&(n.writable=true);Object.defineProperty(e,n.key,n)}}return function(e,t,o){t&&defineProperties(e.prototype,t);o&&defineProperties(e,o);return e}}();n(5);var r=n(4);var s=_interopRequireDefault(r);var a=n(0);var u=_interopRequireWildcard(a);var l=n(1);var c=_interopRequireWildcard(l);var f=n(2);var d=n(3);function _interopRequireWildcard(e){if(e&&e.__esModule)return e;var t={};if(null!=e)for(var o in e)Object.prototype.hasOwnProperty.call(e,o)&&(t[o]=e[o]);t.default=e;return t}function _interopRequireDefault(e){return e&&e.__esModule?e:{default:e}}function _classCallCheck(e,t){if(!(e instanceof t))throw new TypeError("Cannot call a class as a function")}var h=function(){
/**
         * @param {object} options
         * @return {Noty}
         */
function Noty(){var t=arguments.length>0&&void 0!==arguments[0]?arguments[0]:{};_classCallCheck(this||e,Noty);(this||e).options=u.deepExtend({},c.Defaults,t);(this||e).id=(this||e).options.id||u.generateID("bar");(this||e).closeTimer=-1;(this||e).barDom=null;(this||e).layoutDom=null;(this||e).progressDom=null;(this||e).showing=false;(this||e).shown=false;(this||e).closed=false;(this||e).closing=false;(this||e).killable=(this||e).options.timeout||(this||e).options.closeWith.length>0;(this||e).hasSound=(this||e).options.sounds.sources.length>0;(this||e).soundPlayed=false;(this||e).listeners={beforeShow:[],onShow:[],afterShow:[],onClose:[],afterClose:[],onClick:[],onHover:[],onTemplate:[]};(this||e).promises={show:null,close:null};this.on("beforeShow",(this||e).options.callbacks.beforeShow);this.on("onShow",(this||e).options.callbacks.onShow);this.on("afterShow",(this||e).options.callbacks.afterShow);this.on("onClose",(this||e).options.callbacks.onClose);this.on("afterClose",(this||e).options.callbacks.afterClose);this.on("onClick",(this||e).options.callbacks.onClick);this.on("onHover",(this||e).options.callbacks.onHover);this.on("onTemplate",(this||e).options.callbacks.onTemplate);return this||e}
/**
         * @param {string} eventName
         * @param {function} cb
         * @return {Noty}
         */i(Noty,[{key:"on",value:function on(t){var o=arguments.length>1&&void 0!==arguments[1]?arguments[1]:function(){};"function"===typeof o&&(this||e).listeners.hasOwnProperty(t)&&(this||e).listeners[t].push(o);return this||e}},{key:"show",value:function show(){var t=this||e;true===(this||e).options.killer?Noty.closeAll():"string"===typeof(this||e).options.killer&&Noty.closeAll((this||e).options.killer);var o=c.getQueueCounts((this||e).options.queue);if(o.current>=o.maxVisible||c.PageHidden&&(this||e).options.visibilityControl){c.addToQueue(this||e);c.PageHidden&&(this||e).hasSound&&u.inArray("docHidden",(this||e).options.sounds.conditions)&&u.createAudioElements(this||e);c.PageHidden&&u.inArray("docHidden",(this||e).options.titleCount.conditions)&&c.docTitle.increment();return this||e}c.Store[(this||e).id]=this||e;c.fire(this||e,"beforeShow");(this||e).showing=true;if((this||e).closing){(this||e).showing=false;return this||e}c.build(this||e);c.handleModal(this||e);(this||e).options.force?(this||e).layoutDom.insertBefore((this||e).barDom,(this||e).layoutDom.firstChild):(this||e).layoutDom.appendChild((this||e).barDom);(this||e).hasSound&&!(this||e).soundPlayed&&u.inArray("docVisible",(this||e).options.sounds.conditions)&&u.createAudioElements(this||e);u.inArray("docVisible",(this||e).options.titleCount.conditions)&&c.docTitle.increment();(this||e).shown=true;(this||e).closed=false;c.hasButtons(this||e)&&Object.keys((this||e).options.buttons).forEach((function(e){var o=t.barDom.querySelector("#"+t.options.buttons[e].id);u.addListener(o,"click",(function(o){u.stopPropagation(o);t.options.buttons[e].cb()}))}));(this||e).progressDom=(this||e).barDom.querySelector(".noty_progressbar");if(u.inArray("click",(this||e).options.closeWith)){u.addClass((this||e).barDom,"noty_close_with_click");u.addListener((this||e).barDom,"click",(function(e){u.stopPropagation(e);c.fire(t,"onClick");t.close()}),false)}u.addListener((this||e).barDom,"mouseenter",(function(){c.fire(t,"onHover")}),false);(this||e).options.timeout&&u.addClass((this||e).barDom,"noty_has_timeout");(this||e).options.progressBar&&u.addClass((this||e).barDom,"noty_has_progressbar");if(u.inArray("button",(this||e).options.closeWith)){u.addClass((this||e).barDom,"noty_close_with_button");var n=document.createElement("div");u.addClass(n,"noty_close_button");n.innerHTML="×";(this||e).barDom.appendChild(n);u.addListener(n,"click",(function(e){u.stopPropagation(e);t.close()}),false)}c.fire(this||e,"onShow");if(null===(this||e).options.animation.open)(this||e).promises.show=new s.default((function(e){e()}));else if("function"===typeof(this||e).options.animation.open)(this||e).promises.show=new s.default((this||e).options.animation.open.bind(this||e));else{u.addClass((this||e).barDom,(this||e).options.animation.open);(this||e).promises.show=new s.default((function(e){u.addListener(t.barDom,u.animationEndEvents,(function(){u.removeClass(t.barDom,t.options.animation.open);e()}))}))}(this||e).promises.show.then((function(){var e=t;setTimeout((function(){c.openFlow(e)}),100)}));return this||e}},{key:"stop",value:function stop(){c.dequeueClose(this||e);return this||e}},{key:"resume",value:function resume(){c.queueClose(this||e);return this||e}
/**
           * @param {int|boolean} ms
           * @return {Noty}
           */},{key:"setTimeout",value:function(t){function setTimeout(o){return t.apply(this||e,arguments)}setTimeout.toString=function(){return t.toString()};return setTimeout}((function(t){this.stop();(this||e).options.timeout=t;if((this||e).barDom){(this||e).options.timeout?u.addClass((this||e).barDom,"noty_has_timeout"):u.removeClass((this||e).barDom,"noty_has_timeout");var o=this||e;setTimeout((function(){o.resume()}),100)}return this||e}))
/**
           * @param {string} html
           * @param {boolean} optionsOverride
           * @return {Noty}
           */},{key:"setText",value:function setText(t){var o=arguments.length>1&&void 0!==arguments[1]&&arguments[1];(this||e).barDom&&((this||e).barDom.querySelector(".noty_body").innerHTML=t);o&&((this||e).options.text=t);return this||e}
/**
           * @param {string} type
           * @param {boolean} optionsOverride
           * @return {Noty}
           */},{key:"setType",value:function setType(t){var o=this||e;var n=arguments.length>1&&void 0!==arguments[1]&&arguments[1];if((this||e).barDom){var i=u.classList((this||e).barDom).split(" ");i.forEach((function(e){"noty_type__"===e.substring(0,11)&&u.removeClass(o.barDom,e)}));u.addClass((this||e).barDom,"noty_type__"+t)}n&&((this||e).options.type=t);return this||e}
/**
           * @param {string} theme
           * @param {boolean} optionsOverride
           * @return {Noty}
           */},{key:"setTheme",value:function setTheme(t){var o=this||e;var n=arguments.length>1&&void 0!==arguments[1]&&arguments[1];if((this||e).barDom){var i=u.classList((this||e).barDom).split(" ");i.forEach((function(e){"noty_theme__"===e.substring(0,12)&&u.removeClass(o.barDom,e)}));u.addClass((this||e).barDom,"noty_theme__"+t)}n&&((this||e).options.theme=t);return this||e}},{key:"close",value:function close(){var t=this||e;if((this||e).closed)return this||e;if(!(this||e).shown){c.removeFromQueue(this||e);return this||e}c.fire(this||e,"onClose");(this||e).closing=true;if(null===(this||e).options.animation.close)(this||e).promises.close=new s.default((function(e){e()}));else if("function"===typeof(this||e).options.animation.close)(this||e).promises.close=new s.default((this||e).options.animation.close.bind(this||e));else{u.addClass((this||e).barDom,(this||e).options.animation.close);(this||e).promises.close=new s.default((function(e){u.addListener(t.barDom,u.animationEndEvents,(function(){t.options.force?u.remove(t.barDom):c.ghostFix(t);e()}))}))}(this||e).promises.close.then((function(){c.closeFlow(t);c.handleModalClose(t)}));(this||e).closed=true;return this||e}
/**
           * @param {boolean|string} queueName
           * @return {Noty}
           */}],[{key:"closeAll",value:function closeAll(){var t=arguments.length>0&&void 0!==arguments[0]&&arguments[0];Object.keys(c.Store).forEach((function(e){t?c.Store[e].options.queue===t&&c.Store[e].killable&&c.Store[e].close():c.Store[e].killable&&c.Store[e].close()}));return this||e}
/**
           * @param {Object} obj
           * @return {Noty}
           */},{key:"overrideDefaults",value:function overrideDefaults(t){c.Defaults=u.deepExtend({},c.Defaults,t);return this||e}
/**
           * @param {int} amount
           * @param {string} queueName
           * @return {Noty}
           */},{key:"setMaxVisible",value:function setMaxVisible(){var t=arguments.length>0&&void 0!==arguments[0]?arguments[0]:c.DefaultMaxVisible;var o=arguments.length>1&&void 0!==arguments[1]?arguments[1]:"global";c.Queues.hasOwnProperty(o)||(c.Queues[o]={maxVisible:t,queue:[]});c.Queues[o].maxVisible=t;return this||e}
/**
           * @param {string} innerHtml
           * @param {String} classes
           * @param {Function} cb
           * @param {Object} attributes
           * @return {NotyButton}
           */},{key:"button",value:function button(e){var t=arguments.length>1&&void 0!==arguments[1]?arguments[1]:null;var o=arguments[2];var n=arguments.length>3&&void 0!==arguments[3]?arguments[3]:{};return new f.NotyButton(e,t,o,n)}},{key:"version",value:function version(){return"3.1.4"}
/**
           * @param {String} workerPath
           * @return {Push}
           */},{key:"Push",value:function Push(e){return new d.Push(e)}}]);return Noty}();o.default=h;u.visibilityChangeFlow();t.exports=o["default"]},function(t,o){var n=t.exports={};var i;var r;function defaultSetTimout(){throw new Error("setTimeout has not been defined")}function defaultClearTimeout(){throw new Error("clearTimeout has not been defined")}(function(){try{i="function"===typeof setTimeout?setTimeout:defaultSetTimout}catch(e){i=defaultSetTimout}try{r="function"===typeof clearTimeout?clearTimeout:defaultClearTimeout}catch(e){r=defaultClearTimeout}})();function runTimeout(t){if(i===setTimeout)return setTimeout(t,0);if((i===defaultSetTimout||!i)&&setTimeout){i=setTimeout;return setTimeout(t,0)}try{return i(t,0)}catch(o){try{return i.call(null,t,0)}catch(o){return i.call(this||e,t,0)}}}function runClearTimeout(t){if(r===clearTimeout)return clearTimeout(t);if((r===defaultClearTimeout||!r)&&clearTimeout){r=clearTimeout;return clearTimeout(t)}try{return r(t)}catch(o){try{return r.call(null,t)}catch(o){return r.call(this||e,t)}}}var s=[];var a=false;var u;var l=-1;function cleanUpNextTick(){if(a&&u){a=false;u.length?s=u.concat(s):l=-1;s.length&&drainQueue()}}function drainQueue(){if(!a){var e=runTimeout(cleanUpNextTick);a=true;var t=s.length;while(t){u=s;s=[];while(++l<t)u&&u[l].run();l=-1;t=s.length}u=null;a=false;runClearTimeout(e)}}n.nextTick=function(e){var t=new Array(arguments.length-1);if(arguments.length>1)for(var o=1;o<arguments.length;o++)t[o-1]=arguments[o];s.push(new Item(e,t));1!==s.length||a||runTimeout(drainQueue)};function Item(t,o){(this||e).fun=t;(this||e).array=o}Item.prototype.run=function(){(this||e).fun.apply(null,(this||e).array)};n.title="browser";n.browser=true;n.env={};n.argv=[];n.version="";n.versions={};function noop(){}n.on=noop;n.addListener=noop;n.once=noop;n.off=noop;n.removeListener=noop;n.removeAllListeners=noop;n.emit=noop;n.prependListener=noop;n.prependOnceListener=noop;n.listeners=function(e){return[]};n.binding=function(e){throw new Error("process.binding is not supported")};n.cwd=function(){return"/"};n.chdir=function(e){throw new Error("process.chdir is not supported")};n.umask=function(){return 0}},function(t,o){var n;n=function(){return this||e}();try{n=n||Function("return this")()||(1,eval)("this")}catch(e){"object"===typeof window&&(n=window)}t.exports=n},function(e,t){}])}));var o=t;const n=t.Noty,i=t.__esModule,r=t.css,s=t.deepExtend,a=t.animationEndEvents,u=t.inArray,l=t.stopPropagation,c=t.generateID,f=t.outerHeight,d=t.addListener,h=t.hasClass,p=t.addClass,v=t.removeClass,m=t.remove,y=t.classList,b=t.visibilityChangeFlow,_=t.createAudioElements,w=t.Defaults,g=t.Store,C=t.Queues,k=t.DefaultMaxVisible,P=t.docTitle,T=t.DocModalCount,S=t.PageHidden,E=t.getQueueCounts,x=t.addToQueue,D=t.removeFromQueue,q=t.queueRender,A=t.queueRenderAll,O=t.ghostFix,M=t.build,j=t.hasButtons,N=t.handleModal,L=t.handleModalClose,F=t.queueClose,$=t.dequeueClose,H=t.fire,R=t.openFlow,W=t.closeFlow,V=t.NotyButton,B=t.Push;export default o;export{k as DefaultMaxVisible,w as Defaults,T as DocModalCount,n as Noty,V as NotyButton,S as PageHidden,B as Push,C as Queues,g as Store,i as __esModule,p as addClass,d as addListener,x as addToQueue,a as animationEndEvents,M as build,y as classList,W as closeFlow,_ as createAudioElements,r as css,s as deepExtend,$ as dequeueClose,P as docTitle,H as fire,c as generateID,E as getQueueCounts,O as ghostFix,N as handleModal,L as handleModalClose,j as hasButtons,h as hasClass,u as inArray,R as openFlow,f as outerHeight,F as queueClose,q as queueRender,A as queueRenderAll,m as remove,v as removeClass,D as removeFromQueue,l as stopPropagation,b as visibilityChangeFlow};

