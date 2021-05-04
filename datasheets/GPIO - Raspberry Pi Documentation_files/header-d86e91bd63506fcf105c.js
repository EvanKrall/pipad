!function(e){var t={};function n(r){if(t[r])return t[r].exports;var o=t[r]={i:r,l:!1,exports:{}};return e[r].call(o.exports,o,o.exports,n),o.l=!0,o.exports}n.m=e,n.c=t,n.d=function(e,t,r){n.o(e,t)||Object.defineProperty(e,t,{enumerable:!0,get:r})},n.r=function(e){"undefined"!==typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(e,"__esModule",{value:!0})},n.t=function(e,t){if(1&t&&(e=n(e)),8&t)return e;if(4&t&&"object"===typeof e&&e&&e.__esModule)return e;var r=Object.create(null);if(n.r(r),Object.defineProperty(r,"default",{enumerable:!0,value:e}),2&t&&"string"!=typeof e)for(var o in e)n.d(r,o,function(t){return e[t]}.bind(null,o));return r},n.n=function(e){var t=e&&e.__esModule?function(){return e.default}:function(){return e};return n.d(t,"a",t),t},n.o=function(e,t){return Object.prototype.hasOwnProperty.call(e,t)},n.p="https://esi-service-staging.herokuapp.com/packs/",n(n.s=5)}({0:function(e,t,n){"use strict";function r(e,t){return function(e){if(Array.isArray(e))return e}(e)||function(e,t){if("undefined"===typeof Symbol||!(Symbol.iterator in Object(e)))return;var n=[],r=!0,o=!1,a=void 0;try{for(var i,u=e[Symbol.iterator]();!(r=(i=u.next()).done)&&(n.push(i.value),!t||n.length!==t);r=!0);}catch(c){o=!0,a=c}finally{try{r||null==u.return||u.return()}finally{if(o)throw a}}return n}(e,t)||function(e,t){if(!e)return;if("string"===typeof e)return o(e,t);var n=Object.prototype.toString.call(e).slice(8,-1);"Object"===n&&e.constructor&&(n=e.constructor.name);if("Map"===n||"Set"===n)return Array.from(e);if("Arguments"===n||/^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n))return o(e,t)}(e,t)||function(){throw new TypeError("Invalid attempt to destructure non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method.")}()}function o(e,t){(null==t||t>e.length)&&(t=e.length);for(var n=0,r=new Array(t);n<t;n++)r[n]=e[n];return r}function a(e,t){for(var n=0;n<t.length;n++){var r=t[n];r.enumerable=r.enumerable||!1,r.configurable=!0,"value"in r&&(r.writable=!0),Object.defineProperty(e,r.key,r)}}n.r(t);var i=function(){function e(t){!function(e,t){if(!(e instanceof t))throw new TypeError("Cannot call a class as a function")}(this,e),this.elements={},this.rootSelector=t.rootSelector,this.selectors=t.selectors||{},this.root=this.getRootElement(),this.getElements()}var t,n,o;return t=e,(n=[{key:"getElements",value:function(){var e=this;Object.entries(this.selectors).map((function(t){var n=r(t,2),o=n[0],a=n[1],i=document.querySelectorAll('[data-esi-js-selector="'.concat(a,'"]'));1!==i.length?e.elements[o]=i:e.elements[o]=i[0]}))}},{key:"getRootElement",value:function(){return document.querySelector(this.rootSelector)}}])&&a(t.prototype,n),o&&a(t,o),e}();t.default=i},5:function(e,t,n){"use strict";function r(e,t){for(var n=0;n<t.length;n++){var r=t[n];r.enumerable=r.enumerable||!1,r.configurable=!0,"value"in r&&(r.writable=!0),Object.defineProperty(e,r.key,r)}}function o(e,t){return(o=Object.setPrototypeOf||function(e,t){return e.__proto__=t,e})(e,t)}function a(e){var t=function(){if("undefined"===typeof Reflect||!Reflect.construct)return!1;if(Reflect.construct.sham)return!1;if("function"===typeof Proxy)return!0;try{return Date.prototype.toString.call(Reflect.construct(Date,[],(function(){}))),!0}catch(e){return!1}}();return function(){var n,r=u(e);if(t){var o=u(this).constructor;n=Reflect.construct(r,arguments,o)}else n=r.apply(this,arguments);return i(this,n)}}function i(e,t){return!t||"object"!==typeof t&&"function"!==typeof t?function(e){if(void 0===e)throw new ReferenceError("this hasn't been initialised - super() hasn't been called");return e}(e):t}function u(e){return(u=Object.setPrototypeOf?Object.getPrototypeOf:function(e){return e.__proto__||Object.getPrototypeOf(e)})(e)}n.r(t),new(function(e){!function(e,t){if("function"!==typeof t&&null!==t)throw new TypeError("Super expression must either be null or a function");e.prototype=Object.create(t&&t.prototype,{constructor:{value:e,writable:!0,configurable:!0}}),t&&o(e,t)}(c,e);var t,n,i,u=a(c);function c(e){var t;return function(e,t){if(!(e instanceof t))throw new TypeError("Cannot call a class as a function")}(this,c),(t=u.call(this,e)).activePanel="",t.navOpen=!1,t.debounceTimeout=200,t.addEvents(),t}return t=c,(n=[{key:"addEvents",value:function(){var e=this;this.elements.nav.addEventListener("focusout",(function(t){var n=t.currentTarget,r=t.relatedTarget;n.contains(r)||e.navPanelClose()})),this.elements.navItems.forEach((function(t){t.addEventListener("mouseenter",e.debounce(e.navPanelOpen.bind(e))),t.addEventListener("mouseleave",e.debounce(e.navPanelClose.bind(e)))})),this.elements.navLinks.forEach((function(t){t.addEventListener("focus",(function(t){return e.navPanelOpen(t)}))})),this.elements.toggle.addEventListener("click",(function(){return e.toggleHandler()}))}},{key:"debounce",value:function(e){var t=this;return this.timeout=null,function(){for(var n=arguments.length,r=new Array(n),o=0;o<n;o++)r[o]=arguments[o];var a=function(){return e.apply(void 0,r)};clearTimeout(t.timeout),t.timeout=setTimeout(a,t.debounceTimeout)}}},{key:"navPanelClose",value:function(){this.activePanel="",this.updateNavAttributes()}},{key:"navPanelOpen",value:function(e){this.activePanel=e.target.dataset.section,this.updateNavAttributes()}},{key:"toggleHandler",value:function(){this.navOpen=!this.navOpen,this.elements.header.dataset.navOpen=this.navOpen,this.elements.toggle.setAttribute("aria-pressed",this.navOpen)}},{key:"updateNavAttributes",value:function(){var e=this;this.elements.nav.dataset.activePanel=this.activePanel,this.elements.navPanels.forEach((function(t){var n=!1,r=!0;t.dataset.section===e.activePanel&&(n=!0,r=!1),t.setAttribute("aria-expanded",n),t.setAttribute("aria-hidden",r)}))}}])&&r(t.prototype,n),i&&r(t,i),c}(n(0).default))({rootSelector:".esi-header",selectors:{header:"header",nav:"nav",navItems:"nav-item",navLinks:"nav-link",navPanels:"nav-panel",toggle:"toggle"}})}});
//# sourceMappingURL=header-d86e91bd63506fcf105c.js.map