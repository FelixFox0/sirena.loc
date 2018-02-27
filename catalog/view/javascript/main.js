! function(e) {
    "function" == typeof define && define.amd ? define(["jquery"], e) : e("object" == typeof exports ? require("jquery") : window.jQuery || window.Zepto)
}(function(e) {
    var t, n, i, s, a, o, r = "Close",
        l = "BeforeClose",
        d = "MarkupParse",
        c = "Open",
        f = "Change",
        h = "mfp",
        u = "." + h,
        p = "mfp-ready",
        m = "mfp-removing",
        v = "mfp-prevent-close",
        g = function() {},
        b = !!window.jQuery,
        _ = e(window),
        C = function(e, n) {
            t.ev.on(h + e + u, n)
        },
        w = function(t, n, i, s) {
            var a = document.createElement("div");
            return a.className = "mfp-" + t, i && (a.innerHTML = i), s ? n && n.appendChild(a) : (a = e(a), n && a.appendTo(n)), a
        },
        y = function(n, i) {
            t.ev.triggerHandler(h + n, i), t.st.callbacks && (n = n.charAt(0).toLowerCase() + n.slice(1), t.st.callbacks[n] && t.st.callbacks[n].apply(t, e.isArray(i) ? i : [i]))
        },
        x = function(n) {
            return n === o && t.currTemplate.closeBtn || (t.currTemplate.closeBtn = e(t.st.closeMarkup.replace("%title%", t.st.tClose)), o = n), t.currTemplate.closeBtn
        },
        k = function() {
            e.magnificPopup.instance || (t = new g, t.init(), e.magnificPopup.instance = t)
        },
        $ = function() {
            var e = document.createElement("p").style,
                t = ["ms", "O", "Moz", "Webkit"];
            if (void 0 !== e.transition) return !0;
            for (; t.length;)
                if (t.pop() + "Transition" in e) return !0;
            return !1
        };
    g.prototype = {
        constructor: g,
        init: function() {
            var n = navigator.appVersion;
            t.isIE7 = -1 !== n.indexOf("MSIE 7."), t.isIE8 = -1 !== n.indexOf("MSIE 8."), t.isLowIE = t.isIE7 || t.isIE8, t.isAndroid = /android/gi.test(n), t.isIOS = /iphone|ipad|ipod/gi.test(n), t.supportsTransition = $(), t.probablyMobile = t.isAndroid || t.isIOS || /(Opera Mini)|Kindle|webOS|BlackBerry|(Opera Mobi)|(Windows Phone)|IEMobile/i.test(navigator.userAgent), i = e(document), t.popupsCache = {}
        },
        open: function(n) {
            var s;
            if (!1 === n.isObj) {
                t.items = n.items.toArray(), t.index = 0;
                var o, r = n.items;
                for (s = 0; s < r.length; s++)
                    if (o = r[s], o.parsed && (o = o.el[0]), o === n.el[0]) {
                        t.index = s;
                        break
                    }
            } else t.items = e.isArray(n.items) ? n.items : [n.items], t.index = n.index || 0;
            if (t.isOpen) return void t.updateItemHTML();
            t.types = [], a = "", n.mainEl && n.mainEl.length ? t.ev = n.mainEl.eq(0) : t.ev = i, n.key ? (t.popupsCache[n.key] || (t.popupsCache[n.key] = {}), t.currTemplate = t.popupsCache[n.key]) : t.currTemplate = {}, t.st = e.extend(!0, {}, e.magnificPopup.defaults, n), t.fixedContentPos = "auto" === t.st.fixedContentPos ? !t.probablyMobile : t.st.fixedContentPos, t.st.modal && (t.st.closeOnContentClick = !1, t.st.closeOnBgClick = !1, t.st.showCloseBtn = !1, t.st.enableEscapeKey = !1), t.bgOverlay || (t.bgOverlay = w("bg").on("click" + u, function() {
                t.close()
            }), t.wrap = w("wrap").attr("tabindex", -1).on("click" + u, function(e) {
                t._checkIfClose(e.target) && t.close()
            }), t.container = w("container", t.wrap)), t.contentContainer = w("content"), t.st.preloader && (t.preloader = w("preloader", t.container, t.st.tLoading));
            var l = e.magnificPopup.modules;
            for (s = 0; s < l.length; s++) {
                var f = l[s];
                f = f.charAt(0).toUpperCase() + f.slice(1), t["init" + f].call(t)
            }
            y("BeforeOpen"), t.st.showCloseBtn && (t.st.closeBtnInside ? (C(d, function(e, t, n, i) {
                n.close_replaceWith = x(i.type)
            }), a += " mfp-close-btn-in") : t.wrap.append(x())), t.st.alignTop && (a += " mfp-align-top"), t.fixedContentPos ? t.wrap.css({
                overflow: t.st.overflowY,
                overflowX: "hidden",
                overflowY: t.st.overflowY
            }) : t.wrap.css({
                top: _.scrollTop(),
                position: "absolute"
            }), (!1 === t.st.fixedBgPos || "auto" === t.st.fixedBgPos && !t.fixedContentPos) && t.bgOverlay.css({
                height: i.height(),
                position: "absolute"
            }), t.st.enableEscapeKey && i.on("keyup" + u, function(e) {
                27 === e.keyCode && t.close()
            }), _.on("resize" + u, function() {
                t.updateSize()
            }), t.st.closeOnContentClick || (a += " mfp-auto-cursor"), a && t.wrap.addClass(a);
            var h = t.wH = _.height(),
                m = {};
            if (t.fixedContentPos && t._hasScrollBar(h)) {
                var v = t._getScrollbarSize();
                v && (m.marginRight = v)
            }
            t.fixedContentPos && (t.isIE7 ? e("body, html").css("overflow", "hidden") : m.overflow = "hidden");
            var g = t.st.mainClass;
            return t.isIE7 && (g += " mfp-ie7"), g && t._addClassToMFP(g), t.updateItemHTML(), y("BuildControls"), e("html").css(m), t.bgOverlay.add(t.wrap).prependTo(t.st.prependTo || e(document.body)), t._lastFocusedEl = document.activeElement, setTimeout(function() {
                t.content ? (t._addClassToMFP(p), t._setFocus()) : t.bgOverlay.addClass(p), i.on("focusin" + u, t._onFocusIn)
            }, 16), t.isOpen = !0, t.updateSize(h), y(c), n
        },
        close: function() {
            t.isOpen && (y(l), t.isOpen = !1, t.st.removalDelay && !t.isLowIE && t.supportsTransition ? (t._addClassToMFP(m), setTimeout(function() {
                t._close()
            }, t.st.removalDelay)) : t._close())
        },
        _close: function() {
            y(r);
            var n = m + " " + p + " ";
            if (t.bgOverlay.detach(), t.wrap.detach(), t.container.empty(), t.st.mainClass && (n += t.st.mainClass + " "), t._removeClassFromMFP(n), t.fixedContentPos) {
                var s = {
                    marginRight: ""
                };
                t.isIE7 ? e("body, html").css("overflow", "") : s.overflow = "", e("html").css(s)
            }
            i.off("keyup.mfp focusin" + u), t.ev.off(u), t.wrap.attr("class", "mfp-wrap").removeAttr("style"), t.bgOverlay.attr("class", "mfp-bg"), t.container.attr("class", "mfp-container"), !t.st.showCloseBtn || t.st.closeBtnInside && !0 !== t.currTemplate[t.currItem.type] || t.currTemplate.closeBtn && t.currTemplate.closeBtn.detach(), t.st.autoFocusLast && t._lastFocusedEl && e(t._lastFocusedEl).focus(), t.currItem = null, t.content = null, t.currTemplate = null, t.prevHeight = 0, y("AfterClose")
        },
        updateSize: function(e) {
            if (t.isIOS) {
                var n = document.documentElement.clientWidth / window.innerWidth,
                    i = window.innerHeight * n;
                t.wrap.css("height", i), t.wH = i
            } else t.wH = e || _.height();
            t.fixedContentPos || t.wrap.css("height", t.wH), y("Resize")
        },
        updateItemHTML: function() {
            var n = t.items[t.index];
            t.contentContainer.detach(), t.content && t.content.detach(), n.parsed || (n = t.parseEl(t.index));
            var i = n.type;
            if (y("BeforeChange", [t.currItem ? t.currItem.type : "", i]), t.currItem = n, !t.currTemplate[i]) {
                var a = !!t.st[i] && t.st[i].markup;
                y("FirstMarkupParse", a), t.currTemplate[i] = !a || e(a)
            }
            s && s !== n.type && t.container.removeClass("mfp-" + s + "-holder");
            var o = t["get" + i.charAt(0).toUpperCase() + i.slice(1)](n, t.currTemplate[i]);
            t.appendContent(o, i), n.preloaded = !0, y(f, n), s = n.type, t.container.prepend(t.contentContainer), y("AfterChange")
        },
        appendContent: function(e, n) {
            t.content = e, e ? t.st.showCloseBtn && t.st.closeBtnInside && !0 === t.currTemplate[n] ? t.content.find(".mfp-close").length || t.content.append(x()) : t.content = e : t.content = "", y("BeforeAppend"), t.container.addClass("mfp-" + n + "-holder"), t.contentContainer.append(t.content)
        },
        parseEl: function(n) {
            var i, s = t.items[n];
            if (s.tagName ? s = {
                    el: e(s)
                } : (i = s.type, s = {
                    data: s,
                    src: s.src
                }), s.el) {
                for (var a = t.types, o = 0; o < a.length; o++)
                    if (s.el.hasClass("mfp-" + a[o])) {
                        i = a[o];
                        break
                    }
                s.src = s.el.attr("data-mfp-src"), s.src || (s.src = s.el.attr("href"))
            }
            return s.type = i || t.st.type || "inline", s.index = n, s.parsed = !0, t.items[n] = s, y("ElementParse", s), t.items[n]
        },
        addGroup: function(e, n) {
            var i = function(i) {
                i.mfpEl = this, t._openClick(i, e, n)
            };
            n || (n = {});
            var s = "click.magnificPopup";
            n.mainEl = e, n.items ? (n.isObj = !0, e.off(s).on(s, i)) : (n.isObj = !1, n.delegate ? e.off(s).on(s, n.delegate, i) : (n.items = e, e.off(s).on(s, i)))
        },
        _openClick: function(n, i, s) {
            if ((void 0 !== s.midClick ? s.midClick : e.magnificPopup.defaults.midClick) || !(2 === n.which || n.ctrlKey || n.metaKey || n.altKey || n.shiftKey)) {
                var a = void 0 !== s.disableOn ? s.disableOn : e.magnificPopup.defaults.disableOn;
                if (a)
                    if (e.isFunction(a)) {
                        if (!a.call(t)) return !0
                    } else if (_.width() < a) return !0;
                n.type && (n.preventDefault(), t.isOpen && n.stopPropagation()), s.el = e(n.mfpEl), s.delegate && (s.items = i.find(s.delegate)), t.open(s)
            }
        },
        updateStatus: function(e, i) {
            if (t.preloader) {
                n !== e && t.container.removeClass("mfp-s-" + n), i || "loading" !== e || (i = t.st.tLoading);
                var s = {
                    status: e,
                    text: i
                };
                y("UpdateStatus", s), e = s.status, i = s.text, t.preloader.html(i), t.preloader.find("a").on("click", function(e) {
                    e.stopImmediatePropagation()
                }), t.container.addClass("mfp-s-" + e), n = e
            }
        },
        _checkIfClose: function(n) {
            if (!e(n).hasClass(v)) {
                var i = t.st.closeOnContentClick,
                    s = t.st.closeOnBgClick;
                if (i && s) return !0;
                if (!t.content || e(n).hasClass("mfp-close") || t.preloader && n === t.preloader[0]) return !0;
                if (n === t.content[0] || e.contains(t.content[0], n)) {
                    if (i) return !0
                } else if (s && e.contains(document, n)) return !0;
                return !1
            }
        },
        _addClassToMFP: function(e) {
            t.bgOverlay.addClass(e), t.wrap.addClass(e)
        },
        _removeClassFromMFP: function(e) {
            this.bgOverlay.removeClass(e), t.wrap.removeClass(e)
        },
        _hasScrollBar: function(e) {
            return (t.isIE7 ? i.height() : document.body.scrollHeight) > (e || _.height())
        },
        _setFocus: function() {
            (t.st.focus ? t.content.find(t.st.focus).eq(0) : t.wrap).focus()
        },
        _onFocusIn: function(n) {
            return n.target === t.wrap[0] || e.contains(t.wrap[0], n.target) ? void 0 : (t._setFocus(), !1)
        },
        _parseMarkup: function(t, n, i) {
            var s;
            i.data && (n = e.extend(i.data, n)), y(d, [t, n, i]), e.each(n, function(e, n) {
                if (void 0 === n || !1 === n) return !0;
                if (s = e.split("_"), s.length > 1) {
                    var i = t.find(u + "-" + s[0]);
                    if (i.length > 0) {
                        var a = s[1];
                        "replaceWith" === a ? i[0] !== n[0] && i.replaceWith(n) : "img" === a ? i.is("img") ? i.attr("src", n) : i.replaceWith('<img src="' + n + '" class="' + i.attr("class") + '" />') : i.attr(s[1], n)
                    }
                } else t.find(u + "-" + e).html(n)
            })
        },
        _getScrollbarSize: function() {
            if (void 0 === t.scrollbarSize) {
                var e = document.createElement("div");
                e.style.cssText = "width: 99px; height: 99px; overflow: scroll; position: absolute; top: -9999px;", document.body.appendChild(e), t.scrollbarSize = e.offsetWidth - e.clientWidth, document.body.removeChild(e)
            }
            return t.scrollbarSize
        }
    }, e.magnificPopup = {
        instance: null,
        proto: g.prototype,
        modules: [],
        open: function(t, n) {
            return k(), t = t ? e.extend(!0, {}, t) : {}, t.isObj = !0, t.index = n || 0, this.instance.open(t)
        },
        close: function() {
            return e.magnificPopup.instance && e.magnificPopup.instance.close()
        },
        registerModule: function(t, n) {
            n.options && (e.magnificPopup.defaults[t] = n.options), e.extend(this.proto, n.proto), this.modules.push(t)
        },
        defaults: {
            disableOn: 0,
            key: null,
            midClick: !1,
            mainClass: "",
            preloader: !0,
            focus: "",
            closeOnContentClick: !1,
            closeOnBgClick: !0,
            closeBtnInside: !0,
            showCloseBtn: !0,
            enableEscapeKey: !0,
            modal: !1,
            alignTop: !1,
            removalDelay: 0,
            prependTo: null,
            fixedContentPos: "auto",
            fixedBgPos: "auto",
            overflowY: "auto",
            closeMarkup: '<button title="%title%" type="button" class="mfp-close">&#215;</button>',
            tClose: "Close (Esc)",
            tLoading: "Loading...",
            autoFocusLast: !0
        }
    }, e.fn.magnificPopup = function(n) {
        k();
        var i = e(this);
        if ("string" == typeof n)
            if ("open" === n) {
                var s, a = b ? i.data("magnificPopup") : i[0].magnificPopup,
                    o = parseInt(arguments[1], 10) || 0;
                a.items ? s = a.items[o] : (s = i, a.delegate && (s = s.find(a.delegate)), s = s.eq(o)), t._openClick({
                    mfpEl: s
                }, i, a)
            } else t.isOpen && t[n].apply(t, Array.prototype.slice.call(arguments, 1));
        else n = e.extend(!0, {}, n), b ? i.data("magnificPopup", n) : i[0].magnificPopup = n, t.addGroup(i, n);
        return i
    };
    var P, I, T, M = "inline",
        S = function() {
            T && (I.after(T.addClass(P)).detach(), T = null)
        };
    e.magnificPopup.registerModule(M, {
        options: {
            hiddenClass: "hide",
            markup: "",
            tNotFound: "Content not found"
        },
        proto: {
            initInline: function() {
                t.types.push(M), C(r + "." + M, function() {
                    S()
                })
            },
            getInline: function(n, i) {
                if (S(), n.src) {
                    var s = t.st.inline,
                        a = e(n.src);
                    if (a.length) {
                        var o = a[0].parentNode;
                        o && o.tagName && (I || (P = s.hiddenClass, I = w(P), P = "mfp-" + P), T = a.after(I).detach().removeClass(P)), t.updateStatus("ready")
                    } else t.updateStatus("error", s.tNotFound), a = e("<div>");
                    return n.inlineElement = a, a
                }
                return t.updateStatus("ready"), t._parseMarkup(i, {}, n), i
            }
        }
    });
    var A, z = "ajax",
        N = function() {
            A && e(document.body).removeClass(A)
        },
        O = function() {
            N(), t.req && t.req.abort()
        };
    e.magnificPopup.registerModule(z, {
        options: {
            settings: null,
            cursor: "mfp-ajax-cur",
            tError: '<a href="%url%">The content</a> could not be loaded.'
        },
        proto: {
            initAjax: function() {
                t.types.push(z), A = t.st.ajax.cursor, C(r + "." + z, O), C("BeforeChange." + z, O)
            },
            getAjax: function(n) {
                A && e(document.body).addClass(A), t.updateStatus("loading");
                var i = e.extend({
                    url: n.src,
                    success: function(i, s, a) {
                        var o = {
                            data: i,
                            xhr: a
                        };
                        y("ParseAjax", o), t.appendContent(e(o.data), z), n.finished = !0, N(), t._setFocus(), setTimeout(function() {
                            t.wrap.addClass(p)
                        }, 16), t.updateStatus("ready"), y("AjaxContentAdded")
                    },
                    error: function() {
                        N(), n.finished = n.loadError = !0, t.updateStatus("error", t.st.ajax.tError.replace("%url%", n.src))
                    }
                }, t.st.ajax.settings);
                return t.req = e.ajax(i), ""
            }
        }
    });
    var L, E = function(n) {
        if (n.data && void 0 !== n.data.title) return n.data.title;
        var i = t.st.image.titleSrc;
        if (i) {
            if (e.isFunction(i)) return i.call(t, n);
            if (n.el) return n.el.attr(i) || ""
        }
        return ""
    };
    e.magnificPopup.registerModule("image", {
        options: {
            markup: '<div class="mfp-figure"><div class="mfp-close"></div><figure><div class="mfp-img"></div><figcaption><div class="mfp-bottom-bar"><div class="mfp-title"></div><div class="mfp-counter"></div></div></figcaption></figure></div>',
            cursor: "mfp-zoom-out-cur",
            titleSrc: "title",
            verticalFit: !0,
            tError: '<a href="%url%">The image</a> could not be loaded.'
        },
        proto: {
            initImage: function() {
                var n = t.st.image,
                    i = ".image";
                t.types.push("image"), C(c + i, function() {
                    "image" === t.currItem.type && n.cursor && e(document.body).addClass(n.cursor)
                }), C(r + i, function() {
                    n.cursor && e(document.body).removeClass(n.cursor), _.off("resize" + u)
                }), C("Resize" + i, t.resizeImage), t.isLowIE && C("AfterChange", t.resizeImage)
            },
            resizeImage: function() {
                var e = t.currItem;
                if (e && e.img && t.st.image.verticalFit) {
                    var n = 0;
                    t.isLowIE && (n = parseInt(e.img.css("padding-top"), 10) + parseInt(e.img.css("padding-bottom"), 10)), e.img.css("max-height", t.wH - n)
                }
            },
            _onImageHasSize: function(e) {
                e.img && (e.hasSize = !0, L && clearInterval(L), e.isCheckingImgSize = !1, y("ImageHasSize", e), e.imgHidden && (t.content && t.content.removeClass("mfp-loading"), e.imgHidden = !1))
            },
            findImageSize: function(e) {
                var n = 0,
                    i = e.img[0],
                    s = function(a) {
                        L && clearInterval(L), L = setInterval(function() {
                            return i.naturalWidth > 0 ? void t._onImageHasSize(e) : (n > 200 && clearInterval(L), n++, void(3 === n ? s(10) : 40 === n ? s(50) : 100 === n && s(500)))
                        }, a)
                    };
                s(1)
            },
            getImage: function(n, i) {
                var s = 0,
                    a = function() {
                        n && (n.img[0].complete ? (n.img.off(".mfploader"), n === t.currItem && (t._onImageHasSize(n), t.updateStatus("ready")), n.hasSize = !0, n.loaded = !0, y("ImageLoadComplete")) : (s++, 200 > s ? setTimeout(a, 100) : o()))
                    },
                    o = function() {
                        n && (n.img.off(".mfploader"), n === t.currItem && (t._onImageHasSize(n), t.updateStatus("error", r.tError.replace("%url%", n.src))), n.hasSize = !0, n.loaded = !0, n.loadError = !0)
                    },
                    r = t.st.image,
                    l = i.find(".mfp-img");
                if (l.length) {
                    var d = document.createElement("img");
                    d.className = "mfp-img", n.el && n.el.find("img").length && (d.alt = n.el.find("img").attr("alt")), n.img = e(d).on("load.mfploader", a).on("error.mfploader", o), d.src = n.src, l.is("img") && (n.img = n.img.clone()), d = n.img[0], d.naturalWidth > 0 ? n.hasSize = !0 : d.width || (n.hasSize = !1)
                }
                return t._parseMarkup(i, {
                    title: E(n),
                    img_replaceWith: n.img
                }, n), t.resizeImage(), n.hasSize ? (L && clearInterval(L), n.loadError ? (i.addClass("mfp-loading"), t.updateStatus("error", r.tError.replace("%url%", n.src))) : (i.removeClass("mfp-loading"), t.updateStatus("ready")), i) : (t.updateStatus("loading"), n.loading = !0, n.hasSize || (n.imgHidden = !0, i.addClass("mfp-loading"), t.findImageSize(n)), i)
            }
        }
    });
    var j, B = function() {
        return void 0 === j && (j = void 0 !== document.createElement("p").style.MozTransform), j
    };
    e.magnificPopup.registerModule("zoom", {
        options: {
            enabled: !1,
            easing: "ease-in-out",
            duration: 300,
            opener: function(e) {
                return e.is("img") ? e : e.find("img")
            }
        },
        proto: {
            initZoom: function() {
                var e, n = t.st.zoom,
                    i = ".zoom";
                if (n.enabled && t.supportsTransition) {
                    var s, a, o = n.duration,
                        d = function(e) {
                            var t = e.clone().removeAttr("style").removeAttr("class").addClass("mfp-animated-image"),
                                i = "all " + n.duration / 1e3 + "s " + n.easing,
                                s = {
                                    position: "fixed",
                                    zIndex: 9999,
                                    left: 0,
                                    top: 0,
                                    "-webkit-backface-visibility": "hidden"
                                },
                                a = "transition";
                            return s["-webkit-" + a] = s["-moz-" + a] = s["-o-" + a] = s[a] = i, t.css(s), t
                        },
                        c = function() {
                            t.content.css("visibility", "visible")
                        };
                    C("BuildControls" + i, function() {
                        if (t._allowZoom()) {
                            if (clearTimeout(s), t.content.css("visibility", "hidden"), !(e = t._getItemToZoom())) return void c();
                            a = d(e), a.css(t._getOffset()), t.wrap.append(a), s = setTimeout(function() {
                                a.css(t._getOffset(!0)), s = setTimeout(function() {
                                    c(), setTimeout(function() {
                                        a.remove(), e = a = null, y("ZoomAnimationEnded")
                                    }, 16)
                                }, o)
                            }, 16)
                        }
                    }), C(l + i, function() {
                        if (t._allowZoom()) {
                            if (clearTimeout(s), t.st.removalDelay = o, !e) {
                                if (!(e = t._getItemToZoom())) return;
                                a = d(e)
                            }
                            a.css(t._getOffset(!0)), t.wrap.append(a), t.content.css("visibility", "hidden"), setTimeout(function() {
                                a.css(t._getOffset())
                            }, 16)
                        }
                    }), C(r + i, function() {
                        t._allowZoom() && (c(), a && a.remove(), e = null)
                    })
                }
            },
            _allowZoom: function() {
                return "image" === t.currItem.type
            },
            _getItemToZoom: function() {
                return !!t.currItem.hasSize && t.currItem.img
            },
            _getOffset: function(n) {
                var i;
                i = n ? t.currItem.img : t.st.zoom.opener(t.currItem.el || t.currItem);
                var s = i.offset(),
                    a = parseInt(i.css("padding-top"), 10),
                    o = parseInt(i.css("padding-bottom"), 10);
                s.top -= e(window).scrollTop() - a;
                var r = {
                    width: i.width(),
                    height: (b ? i.innerHeight() : i[0].offsetHeight) - o - a
                };
                return B() ? r["-moz-transform"] = r.transform = "translate(" + s.left + "px," + s.top + "px)" : (r.left = s.left, r.top = s.top), r
            }
        }
    });
    var F = "iframe",
        H = function(e) {
            if (t.currTemplate[F]) {
                var n = t.currTemplate[F].find("iframe");
                n.length && (e || (n[0].src = "//about:blank"), t.isIE8 && n.css("display", e ? "block" : "none"))
            }
        };
    e.magnificPopup.registerModule(F, {
        options: {
            markup: '<div class="mfp-iframe-scaler"><div class="mfp-close"></div><iframe class="mfp-iframe" src="//about:blank" frameborder="0" allowfullscreen></iframe></div>',
            srcAction: "iframe_src",
            patterns: {
                youtube: {
                    index: "youtube.com",
                    id: "v=",
                    src: "//www.youtube.com/embed/%id%?autoplay=1"
                },
                vimeo: {
                    index: "vimeo.com/",
                    id: "/",
                    src: "//player.vimeo.com/video/%id%?autoplay=1"
                },
                gmaps: {
                    index: "//maps.google.",
                    src: "%id%&output=embed"
                }
            }
        },
        proto: {
            initIframe: function() {
                t.types.push(F), C("BeforeChange", function(e, t, n) {
                    t !== n && (t === F ? H() : n === F && H(!0))
                }), C(r + "." + F, function() {
                    H()
                })
            },
            getIframe: function(n, i) {
                var s = n.src,
                    a = t.st.iframe;
                e.each(a.patterns, function() {
                    return s.indexOf(this.index) > -1 ? (this.id && (s = "string" == typeof this.id ? s.substr(s.lastIndexOf(this.id) + this.id.length, s.length) : this.id.call(this, s)), s = this.src.replace("%id%", s), !1) : void 0
                });
                var o = {};
                return a.srcAction && (o[a.srcAction] = s), t._parseMarkup(i, o, n), t.updateStatus("ready"), i
            }
        }
    });
    var D = function(e) {
            var n = t.items.length;
            return e > n - 1 ? e - n : 0 > e ? n + e : e
        },
        W = function(e, t, n) {
            return e.replace(/%curr%/gi, t + 1).replace(/%total%/gi, n)
        };
    e.magnificPopup.registerModule("gallery", {
        options: {
            enabled: !1,
            arrowMarkup: '<button title="%title%" type="button" class="mfp-arrow mfp-arrow-%dir%"></button>',
            preload: [0, 2],
            navigateByImgClick: !0,
            arrows: !0,
            tPrev: "Previous (Left arrow key)",
            tNext: "Next (Right arrow key)",
            tCounter: "%curr% of %total%"
        },
        proto: {
            initGallery: function() {
                var n = t.st.gallery,
                    s = ".mfp-gallery",
                    o = Boolean(e.fn.mfpFastClick);
                return t.direction = !0, !(!n || !n.enabled) && (a += " mfp-gallery", C(c + s, function() {
                    n.navigateByImgClick && t.wrap.on("click" + s, ".mfp-img", function() {
                        return t.items.length > 1 ? (t.next(), !1) : void 0
                    }), i.on("keydown" + s, function(e) {
                        37 === e.keyCode ? t.prev() : 39 === e.keyCode && t.next()
                    })
                }), C("UpdateStatus" + s, function(e, n) {
                    n.text && (n.text = W(n.text, t.currItem.index, t.items.length))
                }), C(d + s, function(e, i, s, a) {
                    var o = t.items.length;
                    s.counter = o > 1 ? W(n.tCounter, a.index, o) : ""
                }), C("BuildControls" + s, function() {
                    if (t.items.length > 1 && n.arrows && !t.arrowLeft) {
                        var i = n.arrowMarkup,
                            s = t.arrowLeft = e(i.replace(/%title%/gi, n.tPrev).replace(/%dir%/gi, "left")).addClass(v),
                            a = t.arrowRight = e(i.replace(/%title%/gi, n.tNext).replace(/%dir%/gi, "right")).addClass(v),
                            r = o ? "mfpFastClick" : "click";
                        s[r](function() {
                            t.prev()
                        }), a[r](function() {
                            t.next()
                        }), t.isIE7 && (w("b", s[0], !1, !0), w("a", s[0], !1, !0), w("b", a[0], !1, !0), w("a", a[0], !1, !0)), t.container.append(s.add(a))
                    }
                }), C(f + s, function() {
                    t._preloadTimeout && clearTimeout(t._preloadTimeout), t._preloadTimeout = setTimeout(function() {
                        t.preloadNearbyImages(), t._preloadTimeout = null
                    }, 16)
                }), void C(r + s, function() {
                    i.off(s), t.wrap.off("click" + s), t.arrowLeft && o && t.arrowLeft.add(t.arrowRight).destroyMfpFastClick(), t.arrowRight = t.arrowLeft = null
                }))
            },
            next: function() {
                t.direction = !0, t.index = D(t.index + 1), t.updateItemHTML()
            },
            prev: function() {
                t.direction = !1, t.index = D(t.index - 1), t.updateItemHTML()
            },
            goTo: function(e) {
                t.direction = e >= t.index, t.index = e, t.updateItemHTML()
            },
            preloadNearbyImages: function() {
                var e, n = t.st.gallery.preload,
                    i = Math.min(n[0], t.items.length),
                    s = Math.min(n[1], t.items.length);
                for (e = 1; e <= (t.direction ? s : i); e++) t._preloadItem(t.index + e);
                for (e = 1; e <= (t.direction ? i : s); e++) t._preloadItem(t.index - e)
            },
            _preloadItem: function(n) {
                if (n = D(n), !t.items[n].preloaded) {
                    var i = t.items[n];
                    i.parsed || (i = t.parseEl(n)), y("LazyLoad", i), "image" === i.type && (i.img = e('<img class="mfp-img" />').on("load.mfploader", function() {
                        i.hasSize = !0
                    }).on("error.mfploader", function() {
                        i.hasSize = !0, i.loadError = !0, y("LazyLoadError", i)
                    }).attr("src", i.src)), i.preloaded = !0
                }
            }
        }
    });
    var q = "retina";
    e.magnificPopup.registerModule(q, {
            options: {
                replaceSrc: function(e) {
                    return e.src.replace(/\.\w+$/, function(e) {
                        return "@2x" + e
                    })
                },
                ratio: 1
            },
            proto: {
                initRetina: function() {
                    if (window.devicePixelRatio > 1) {
                        var e = t.st.retina,
                            n = e.ratio;
                        (n = isNaN(n) ? n() : n) > 1 && (C("ImageHasSize." + q, function(e, t) {
                            t.img.css({
                                "max-width": t.img[0].naturalWidth / n,
                                width: "100%"
                            })
                        }), C("ElementParse." + q, function(t, i) {
                            i.src = e.replaceSrc(i, n)
                        }))
                    }
                }
            }
        }),
        function() {
            var t = "ontouchstart" in window,
                n = function() {
                    _.off("touchmove" + i + " touchend" + i)
                },
                i = ".mfpFastClick";
            e.fn.mfpFastClick = function(s) {
                return e(this).each(function() {
                    var a, o = e(this);
                    if (t) {
                        var r, l, d, c, f, h;
                        o.on("touchstart" + i, function(e) {
                            c = !1, h = 1, f = e.originalEvent ? e.originalEvent.touches[0] : e.touches[0], l = f.clientX, d = f.clientY, _.on("touchmove" + i, function(e) {
                                f = e.originalEvent ? e.originalEvent.touches : e.touches, h = f.length, f = f[0], (Math.abs(f.clientX - l) > 10 || Math.abs(f.clientY - d) > 10) && (c = !0, n())
                            }).on("touchend" + i, function(e) {
                                n(), c || h > 1 || (a = !0, e.preventDefault(), clearTimeout(r), r = setTimeout(function() {
                                    a = !1
                                }, 1e3), s())
                            })
                        })
                    }
                    o.on("click" + i, function() {
                        a || s()
                    })
                })
            }, e.fn.destroyMfpFastClick = function() {
                e(this).off("touchstart" + i + " click" + i), t && _.off("touchmove" + i + " touchend" + i)
            }
        }(), k()
}), $(document).ready(function(e) {
    e(".main-slider__container").owlCarousel({
            loop: !0,
            margin: 0,
            nav: !0,
            items: 1,
            navText: ['<i class="icon-arrow-l"></i>', '<i class="icon-arrow-l"></i>']
        })
    
    if (e(".js-search").click(function(t) {
            t.preventDefault(), e(".search-block").show()
        }), e(window).innerWidth() < 1100);
    e(".open-popup").magnificPopup({
        type: "inline",
        callbacks: {
            open: function() {
                e(window).innerWidth() < 1100
            }
        },
        overflowY: "hidden",
        fixedBgPos: !0
    }), e("div").is(".first-frame") && e.magnificPopup.open({
        items: {
            src: ".first-frame"
        },
        type: "inline",
        modal: !0
    })
}), $(document).mouseup(function(e) {
    var t = $(".search-block");
    0 === t.has(e.target).length && t.hide()
});