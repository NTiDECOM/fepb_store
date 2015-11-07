/*! modernizr 3.2.0 (Custom Build) | MIT *
 * http://modernizr.com/download/?-bgrepeatspace_bgrepeatround-boxshadow-csschunit-csscolumns-displaytable-ellipsis-history-ie8compat-input-intl-unicode !*/
!function(e,n,t){function r(e,n){return typeof e===n}function i(){var e,n,t,i,o,s,a;for(var l in x)if(x.hasOwnProperty(l)){if(e=[],n=x[l],n.name&&(e.push(n.name.toLowerCase()),n.options&&n.options.aliases&&n.options.aliases.length))for(t=0;t<n.options.aliases.length;t++)e.push(n.options.aliases[t].toLowerCase());for(i=r(n.fn,"function")?n.fn():n.fn,o=0;o<e.length;o++)s=e[o],a=s.split("."),1===a.length?Modernizr[a[0]]=i:(!Modernizr[a[0]]||Modernizr[a[0]]instanceof Boolean||(Modernizr[a[0]]=new Boolean(Modernizr[a[0]])),Modernizr[a[0]][a[1]]=i),g.push((i?"":"no-")+a.join("-"))}}function o(e){var n=b.className,t=Modernizr._config.classPrefix||"";if(w&&(n=n.baseVal),Modernizr._config.enableJSClass){var r=new RegExp("(^|\\s)"+t+"no-js(\\s|$)");n=n.replace(r,"$1"+t+"js$2")}Modernizr._config.enableClasses&&(n+=" "+t+e.join(" "+t),w?b.className.baseVal=n:b.className=n)}function s(){return"function"!=typeof n.createElement?n.createElement(arguments[0]):w?n.createElementNS.call(n,"http://www.w3.org/2000/svg",arguments[0]):n.createElement.apply(n,arguments)}function a(e){return e.replace(/([a-z])-([a-z])/g,function(e,n,t){return n+t.toUpperCase()}).replace(/^-/,"")}function l(){var e=n.body;return e||(e=s(w?"svg":"body"),e.fake=!0),e}function f(e,t,r,i){var o,a,f,d,u="modernizr",p=s("div"),c=l();if(parseInt(r,10))for(;r--;)f=s("div"),f.id=i?i[r]:u+(r+1),p.appendChild(f);return o=s("style"),o.type="text/css",o.id="s"+u,(c.fake?c:p).appendChild(o),c.appendChild(p),o.styleSheet?o.styleSheet.cssText=e:o.appendChild(n.createTextNode(e)),p.id=u,c.fake&&(c.style.background="",c.style.overflow="hidden",d=b.style.overflow,b.style.overflow="hidden",b.appendChild(c)),a=t(p,e),c.fake?(c.parentNode.removeChild(c),b.style.overflow=d,b.offsetHeight):p.parentNode.removeChild(p),!!a}function d(e,n){return function(){return e.apply(n,arguments)}}function u(e,n,t){var i;for(var o in e)if(e[o]in n)return t===!1?e[o]:(i=n[e[o]],r(i,"function")?d(i,t||n):i);return!1}function p(e,n){return!!~(""+e).indexOf(n)}function c(e){return e.replace(/([A-Z])/g,function(e,n){return"-"+n.toLowerCase()}).replace(/^ms-/,"-ms-")}function m(n,r){var i=n.length;if("CSS"in e&&"supports"in e.CSS){for(;i--;)if(e.CSS.supports(c(n[i]),r))return!0;return!1}if("CSSSupportsRule"in e){for(var o=[];i--;)o.push("("+c(n[i])+":"+r+")");return o=o.join(" or "),f("@supports ("+o+") { #modernizr { position: absolute; } }",function(e){return"absolute"==getComputedStyle(e,null).position})}return t}function h(e,n,i,o){function l(){d&&(delete A.style,delete A.modElem)}if(o=r(o,"undefined")?!1:o,!r(i,"undefined")){var f=m(e,i);if(!r(f,"undefined"))return f}for(var d,u,c,h,v,y=["modernizr","tspan"];!A.style;)d=!0,A.modElem=s(y.shift()),A.style=A.modElem.style;for(c=e.length,u=0;c>u;u++)if(h=e[u],v=A.style[h],p(h,"-")&&(h=a(h)),A.style[h]!==t){if(o||r(i,"undefined"))return l(),"pfx"==n?h:!0;try{A.style[h]=i}catch(g){}if(A.style[h]!=v)return l(),"pfx"==n?h:!0}return l(),!1}function v(e,n,t,i,o){var s=e.charAt(0).toUpperCase()+e.slice(1),a=(e+" "+E.join(s+" ")+s).split(" ");return r(n,"string")||r(n,"undefined")?h(a,n,i,o):(a=(e+" "+R.join(s+" ")+s).split(" "),u(a,n,t))}function y(e,n,r){return v(e,t,t,n,r)}var g=[],x=[],C={_version:"3.2.0",_config:{classPrefix:"",enableClasses:!0,enableJSClass:!0,usePrefixes:!0},_q:[],on:function(e,n){var t=this;setTimeout(function(){n(t[e])},0)},addTest:function(e,n,t){x.push({name:e,fn:n,options:t})},addAsyncTest:function(e){x.push({name:null,fn:e})}},Modernizr=function(){};Modernizr.prototype=C,Modernizr=new Modernizr,Modernizr.addTest("history",function(){var n=navigator.userAgent;return-1===n.indexOf("Android 2.")&&-1===n.indexOf("Android 4.0")||-1===n.indexOf("Mobile Safari")||-1!==n.indexOf("Chrome")||-1!==n.indexOf("Windows Phone")?e.history&&"pushState"in e.history:!1}),Modernizr.addTest("ie8compat",!e.addEventListener&&!!n.documentMode&&7===n.documentMode);var b=n.documentElement,w="svg"===b.nodeName.toLowerCase(),S=s("input"),T="autocomplete autofocus list placeholder max min multiple pattern required step".split(" "),_={};Modernizr.input=function(n){for(var t=0,r=n.length;r>t;t++)_[n[t]]=!!(n[t]in S);return _.list&&(_.list=!(!s("datalist")||!e.HTMLDataListElement)),_}(T);var z={elem:s("modernizr")};Modernizr._q.push(function(){delete z.elem}),Modernizr.addTest("csschunit",function(){var e,n=z.elem.style;try{n.fontSize="3ch",e=-1!==n.fontSize.indexOf("ch")}catch(t){e=!1}return e});var L=C.testStyles=f;Modernizr.addTest("unicode",function(){var e,n=s("span"),t=s("span");return L("#modernizr{font-family:Arial,sans;font-size:300em;}",function(r){n.innerHTML=w?"妇":"&#5987",t.innerHTML=w?"☆":"&#9734",r.appendChild(n),r.appendChild(t),e="offsetWidth"in n&&n.offsetWidth!==t.offsetWidth}),e}),L("#modernizr{display: table; direction: ltr}#modernizr div{display: table-cell; padding: 10px}",function(e){var n,t=e.childNodes;n=t[0].offsetLeft<t[1].offsetLeft,Modernizr.addTest("displaytable",n,{aliases:["display-table"]})},2);var k="Moz O ms Webkit",E=C._config.usePrefixes?k.split(" "):[];C._cssomPrefixes=E;var O=function(n){var r,i=prefixes.length,o=e.CSSRule;if("undefined"==typeof o)return t;if(!n)return!1;if(n=n.replace(/^@/,""),r=n.replace(/-/g,"_").toUpperCase()+"_RULE",r in o)return"@"+n;for(var s=0;i>s;s++){var a=prefixes[s],l=a.toUpperCase()+"_"+r;if(l in o)return"@-"+a.toLowerCase()+"-"+n}return!1};C.atRule=O;var R=C._config.usePrefixes?k.toLowerCase().split(" "):[];C._domPrefixes=R;var A={style:z.elem.style};Modernizr._q.unshift(function(){delete A.style}),C.testAllProps=v;var P=C.prefixed=function(e,n,t){return 0===e.indexOf("@")?O(e):(-1!=e.indexOf("-")&&(e=a(e)),n?v(e,n,t):v(e,"pfx"))};Modernizr.addTest("intl",!!P("Intl",e)),C.testAllProps=y,Modernizr.addTest("bgrepeatround",y("backgroundRepeat","round")),Modernizr.addTest("bgrepeatspace",y("backgroundRepeat","space")),Modernizr.addTest("boxshadow",y("boxShadow","1px 1px",!0)),function(){Modernizr.addTest("csscolumns",function(){var e=!1,n=y("columnCount");try{(e=!!n)&&(e=new Boolean(e))}catch(t){}return e});for(var e,n,t=["Width","Span","Fill","Gap","Rule","RuleColor","RuleStyle","RuleWidth","BreakBefore","BreakAfter","BreakInside"],r=0;r<t.length;r++)e=t[r].toLowerCase(),n=y("column"+t[r]),("breakbefore"===e||"breakafter"===e||"breakinside"==e)&&(n=n||y(t[r])),Modernizr.addTest("csscolumns."+e,n)}(),Modernizr.addTest("ellipsis",y("textOverflow","ellipsis")),i(),o(g),delete C.addTest,delete C.addAsyncTest;for(var N=0;N<Modernizr._q.length;N++)Modernizr._q[N]();e.Modernizr=Modernizr}(window,document);