! function($) {
    function maybeCall(thing, ctx) {
        return "function" == typeof thing ? thing.call(ctx) : thing
    }

    function isElementInDOM(ele) {
        for (; ele = ele.parentNode;)
            if (ele == document) return !0;
        return !1
    }

    function Tipsy(element, options) {
        this.$element = $(element), this.options = options, this.enabled = !0, this.fixTitle()
    }
    Tipsy.prototype = {
        show: function() {
            var title = this.getTitle();
            if (title && this.enabled) {
                var $tip = this.tip();
                $tip.find(".tipsy-inner")[this.options.html ? "html" : "text"](title), $tip[0].className = "tipsy", $tip.remove().css({
                    top: 0,
                    left: 0,
                    visibility: "hidden",
                    display: "block"
                }).prependTo(document.body);
                var tp, pos = $.extend({}, this.$element.offset(), {
                        width: this.$element[0].offsetWidth,
                        height: this.$element[0].offsetHeight
                    }),
                    actualWidth = $tip[0].offsetWidth,
                    actualHeight = $tip[0].offsetHeight,
                    gravity = maybeCall(this.options.gravity, this.$element[0]);
                switch (gravity.charAt(0)) {
                    case "n":
                        tp = {
                            top: pos.top + pos.height + this.options.offset,
                            left: pos.left + pos.width / 2 - actualWidth / 2
                        };
                        break;
                    case "s":
                        tp = {
                            top: pos.top - actualHeight - this.options.offset,
                            left: pos.left + pos.width / 2 - actualWidth / 2
                        };
                        break;
                    case "e":
                        tp = {
                            top: pos.top + pos.height / 2 - actualHeight / 2,
                            left: pos.left - actualWidth - this.options.offset
                        };
                        break;
                    case "w":
                        tp = {
                            top: pos.top + pos.height / 2 - actualHeight / 2,
                            left: pos.left + pos.width + this.options.offset
                        }
                }
                2 == gravity.length && (tp.left = "w" == gravity.charAt(1) ? pos.left + pos.width / 2 - 15 : pos.left + pos.width / 2 - actualWidth + 15), $tip.css(tp).addClass("tipsy-" + gravity), $tip.find(".tipsy-arrow")[0].className = "tipsy-arrow tipsy-arrow-" + gravity.charAt(0), this.options.className && $tip.addClass(maybeCall(this.options.className, this.$element[0])), this.options.fade ? $tip.stop().css({
                    opacity: 0,
                    display: "block",
                    visibility: "visible"
                }).animate({
                    opacity: this.options.opacity
                }) : $tip.css({
                    visibility: "visible",
                    opacity: this.options.opacity
                })
            }
        },
        hide: function() {
            this.options.fade ? this.tip().stop().fadeOut(function() {
                $(this).remove()
            }) : this.tip().remove()
        },
        fixTitle: function() {
            var $e = this.$element;
            ($e.attr("title") || "string" != typeof $e.attr("original-title")) && $e.attr("original-title", $e.attr("title") || "").removeAttr("title")
        },
        getTitle: function() {
            var title, $e = this.$element,
                o = this.options;
            this.fixTitle();
            var title, o = this.options;
            return "string" == typeof o.title ? title = $e.attr("title" == o.title ? "original-title" : o.title) : "function" == typeof o.title && (title = o.title.call($e[0])), title = ("" + title).replace(/(^\s*|\s*$)/, ""), title || o.fallback
        },
        tip: function() {
            return this.$tip || (this.$tip = $('<div class="tipsy"></div>').html('<div class="tipsy-arrow"></div><div class="tipsy-inner"></div>'), this.$tip.data("tipsy-pointee", this.$element[0])), this.$tip
        },
        validate: function() {
            this.$element[0].parentNode || (this.hide(), this.$element = null, this.options = null)
        },
        enable: function() {
            this.enabled = !0
        },
        disable: function() {
            this.enabled = !1
        },
        toggleEnabled: function() {
            this.enabled = !this.enabled
        }
    }, $.fn.tipsy = function(options) {
        function get(ele) {
            var tipsy = $.data(ele, "tipsy");
            return tipsy || (tipsy = new Tipsy(ele, $.fn.tipsy.elementOptions(ele, options)), $.data(ele, "tipsy", tipsy)), tipsy
        }

        function enter() {
            var tipsy = get(this);
            tipsy.hoverState = "in", 0 == options.delayIn ? tipsy.show() : (tipsy.fixTitle(), setTimeout(function() {
                "in" == tipsy.hoverState && tipsy.show()
            }, options.delayIn))
        }

        function leave() {
            var tipsy = get(this);
            tipsy.hoverState = "out", 0 == options.delayOut ? tipsy.hide() : setTimeout(function() {
                "out" == tipsy.hoverState && tipsy.hide()
            }, options.delayOut)
        }
        if (options === !0) return this.data("tipsy");
        if ("string" == typeof options) {
            var tipsy = this.data("tipsy");
            return tipsy && tipsy[options](), this
        }
        if (options = $.extend({}, $.fn.tipsy.defaults, options), options.live || this.each(function() {
            get(this)
        }), "manual" != options.trigger) {
            var binder = options.live ? "live" : "bind",
                eventIn = "hover" == options.trigger ? "mouseenter" : "focus",
                eventOut = "hover" == options.trigger ? "mouseleave" : "blur";
            this[binder](eventIn, enter)[binder](eventOut, leave)
        }
        return this
    }, $.fn.tipsy.defaults = {
        className: null,
        delayIn: 0,
        delayOut: 0,
        fade: !1,
        fallback: "",
        gravity: "n",
        html: !1,
        live: !1,
        offset: 0,
        opacity: .8,
        title: "title",
        trigger: "hover"
    }, $.fn.tipsy.revalidate = function() {
        $(".tipsy").each(function() {
            var pointee = $.data(this, "tipsy-pointee");
            pointee && isElementInDOM(pointee) || $(this).remove()
        })
    }, $.fn.tipsy.elementOptions = function(ele, options) {
        return $.extend({}, options, {
            offset: ele.getAttribute("data-offset") || options.offset || 0,
            gravity: ele.getAttribute("data-gravity") || "n"
        }, $.metadata ? $(ele).metadata() : {})
    }, $.fn.tipsy.autoNS = function() {
        return $(this).offset().top > $(document).scrollTop() + $(window).height() / 2 ? "s" : "n"
    }, $.fn.tipsy.autoWE = function() {
        return $(this).offset().left > $(document).scrollLeft() + $(window).width() / 2 ? "e" : "w"
    }, $.fn.tipsy.autoBounds = function(margin, prefer) {
        return function() {
            var dir = {
                    ns: prefer[0],
                    ew: prefer.length > 1 ? prefer[1] : !1
                },
                boundTop = $(document).scrollTop() + margin,
                boundLeft = $(document).scrollLeft() + margin,
                $this = $(this);
            return $this.offset().top < boundTop && (dir.ns = "n"), $this.offset().left < boundLeft && (dir.ew = "w"), $(window).width() + $(document).scrollLeft() - $this.offset().left < margin && (dir.ew = "e"), $(window).height() + $(document).scrollTop() - $this.offset().top < margin && (dir.ns = "s"), dir.ns + (dir.ew ? dir.ew : "")
        }
    }
}(jQuery);
! function() {
    var DIACRITICS_REMOVAL_MAP = [{
            base: " ",
            regex: /[\u00A0]/g
        }, {
            base: "0",
            regex: /[\u07C0]/g
        }, {
            base: "A",
            regex: /[\u0041\u24B6\uFF21\u00C0\u00C1\u00C2\u1EA6\u1EA4\u1EAA\u1EA8\u00C3\u0100\u0102\u1EB0\u1EAE\u1EB4\u1EB2\u0226\u01E0\u00C4\u01DE\u1EA2\u00C5\u01FA\u01CD\u0200\u0202\u1EA0\u1EAC\u1EB6\u1E00\u0104\u023A\u2C6F]/g
        }, {
            base: "AA",
            regex: /[\uA732]/g
        }, {
            base: "AE",
            regex: /[\u00C6\u01FC\u01E2]/g
        }, {
            base: "AO",
            regex: /[\uA734]/g
        }, {
            base: "AU",
            regex: /[\uA736]/g
        }, {
            base: "AV",
            regex: /[\uA738\uA73A]/g
        }, {
            base: "AY",
            regex: /[\uA73C]/g
        }, {
            base: "B",
            regex: /[\u0042\u24B7\uFF22\u1E02\u1E04\u1E06\u0243\u0181]/g
        }, {
            base: "C",
            regex: /[\uFF43\u24b8\uff23\uA73E\u1E08]/g
        }, {
            base: "D",
            regex: /[\u0044\u24B9\uFF24\u1E0A\u010E\u1E0C\u1E10\u1E12\u1E0E\u0110\u018A\u0189\u1D05\uA779]/g
        }, {
            base: "Dh",
            regex: /[\u00D0]/g
        }, {
            base: "DZ",
            regex: /[\u01F1\u01C4]/g
        }, {
            base: "Dz",
            regex: /[\u01F2\u01C5]/g
        }, {
            base: "E",
            regex: /[\u025B\u0045\u24BA\uFF25\u00C8\u00C9\u00CA\u1EC0\u1EBE\u1EC4\u1EC2\u1EBC\u0112\u1E14\u1E16\u0114\u0116\u00CB\u1EBA\u011A\u0204\u0206\u1EB8\u1EC6\u0228\u1E1C\u0118\u1E18\u1E1A\u0190\u018E\u1D07]/g
        }, {
            base: "F",
            regex: /[\uA77C\u0046\u24BB\uFF26\u1E1E\u0191\uA77B]/g
        }, {
            base: "G",
            regex: /[\u0047\u24BC\uFF27\u01F4\u011C\u1E20\u011E\u0120\u01E6\u0122\u01E4\u0193\uA7A0\uA77D\uA77E\u0262]/g
        }, {
            base: "H",
            regex: /[\u0048\u24BD\uFF28\u0124\u1E22\u1E26\u021E\u1E24\u1E28\u1E2A\u0126\u2C67\u2C75\uA78D]/g
        }, {
            base: "I",
            regex: /[\x49\u24BE\uFF29\xCC\xCD\xCE\u0128\u012A\u012C\u0130\xCF\u1E2E\u1EC8\u01CF\u0208\u020A\u1ECA\u012E\u1E2C\u0197]/g
        }, {
            base: "J",
            regex: /[\x4A\u24BF\uFF2A\u0134\u0248\u0237]/g
        }, {
            base: "K",
            regex: /[\x4B\u24C0\uFF2B\u1E30\u01E8\u1E32\u0136\u1E34\u0198\u2C69\uA740\uA742\uA744\uA7A2]/g
        }, {
            base: "L",
            regex: /[\x4C\u24C1\uFF2C\u013F\u0139\u013D\u1E36\u1E38\u013B\u1E3C\u1E3A\u0141\u023D\u2C62\u2C60\uA748\uA746\uA780]/g
        }, {
            base: "LJ",
            regex: /[\u01C7]/g
        }, {
            base: "Lj",
            regex: /[\u01C8]/g
        }, {
            base: "M",
            regex: /[\x4D\u24C2\uFF2D\u1E3E\u1E40\u1E42\u2C6E\u019C\u03FB]/g
        }, {
            base: "N",
            regex: /[\uA7A4\u0220\x4E\u24C3\uFF2E\u01F8\u0143\xD1\u1E44\u0147\u1E46\u0145\u1E4A\u1E48\u019D\uA790\u1D0E]/g
        }, {
            base: "NJ",
            regex: /[\u01CA]/g
        }, {
            base: "Nj",
            regex: /[\u01CB]/g
        }, {
            base: "O",
            regex: /[\u24C4\uFF2F\xD2\xD3\xD4\u1ED2\u1ED0\u1ED6\u1ED4\xD5\u1E4C\u022C\u1E4E\u014C\u1E50\u1E52\u014E\u022E\u0230\xD6\u022A\u1ECE\u0150\u01D1\u020C\u020E\u01A0\u1EDC\u1EDA\u1EE0\u1EDE\u1EE2\u1ECC\u1ED8\u01EA\u01EC\xD8\u01FE\u0186\x4F\u019F\uA74A\uA74C]/g
        }, {
            base: "OE",
            regex: /[\u0152]/g
        }, {
            base: "OI",
            regex: /[\u01A2]/g
        }, {
            base: "OO",
            regex: /[\uA74E]/g
        }, {
            base: "OU",
            regex: /[\u0222]/g
        }, {
            base: "P",
            regex: /[\x50\u24C5\uFF30\u1E54\u1E56\u01A4\u2C63\uA750\uA752\uA754]/g
        }, {
            base: "Q",
            regex: /[\x51\u24C6\uFF31\uA756\uA758\u024A]/g
        }, {
            base: "R",
            regex: /[\x52\u24C7\uFF32\u0154\u1E58\u0158\u0210\u0212\u1E5A\u1E5C\u0156\u1E5E\u024C\u2C64\uA75A\uA7A6\uA782]/g
        }, {
            base: "S",
            regex: /[\x53\u24C8\uFF33\u1E9E\u015A\u1E64\u015C\u1E60\u0160\u1E66\u1E62\u1E68\u0218\u015E\u2C7E\uA7A8\uA784]/g
        }, {
            base: "T",
            regex: /[\x54\u24C9\uFF34\u1E6A\u0164\u1E6C\u021A\u0162\u1E70\u1E6E\u0166\u01AC\u01AE\u023E\uA786]/g
        }, {
            base: "Th",
            regex: /[\u00DE]/g
        }, {
            base: "TZ",
            regex: /[\uA728]/g
        }, {
            base: "U",
            regex: /[\x55\u24CA\uFF35\xD9\xDA\xDB\u0168\u1E78\u016A\u1E7A\u016C\xDC\u01DB\u01D7\u01D5\u01D9\u1EE6\u016E\u0170\u01D3\u0214\u0216\u01AF\u1EEA\u1EE8\u1EEE\u1EEC\u1EF0\u1EE4\u1E72\u0172\u1E76\u1E74\u0244]/g
        }, {
            base: "V",
            regex: /[\x56\u24CB\uFF36\u1E7C\u1E7E\u01B2\uA75E\u0245]/g
        }, {
            base: "VY",
            regex: /[\uA760]/g
        }, {
            base: "W",
            regex: /[\x57\u24CC\uFF37\u1E80\u1E82\u0174\u1E86\u1E84\u1E88\u2C72]/g
        }, {
            base: "X",
            regex: /[\x58\u24CD\uFF38\u1E8A\u1E8C]/g
        }, {
            base: "Y",
            regex: /[\x59\u24CE\uFF39\u1EF2\xDD\u0176\u1EF8\u0232\u1E8E\u0178\u1EF6\u1EF4\u01B3\u024E\u1EFE]/g
        }, {
            base: "Z",
            regex: /[\x5A\u24CF\uFF3A\u0179\u1E90\u017B\u017D\u1E92\u1E94\u01B5\u0224\u2C7F\u2C6B\uA762]/g
        }, {
            base: "a",
            regex: /[\u0061\u24D0\uFF41\u1E9A\u00E0\u00E1\u00E2\u1EA7\u1EA5\u1EAB\u1EA9\u00E3\u0101\u0103\u1EB1\u1EAF\u1EB5\u1EB3\u0227\u01E1\u00E4\u01DF\u1EA3\u00E5\u01FB\u01CE\u0201\u0203\u1EA1\u1EAD\u1EB7\u1E01\u0105\u2C65\u0250\u0251]/g
        }, {
            base: "aa",
            regex: /[\uA733]/g
        }, {
            base: "ae",
            regex: /[\u00E6\u01FD\u01E3]/g
        }, {
            base: "ao",
            regex: /[\uA735]/g
        }, {
            base: "au",
            regex: /[\uA737]/g
        }, {
            base: "av",
            regex: /[\uA739\uA73B]/g
        }, {
            base: "ay",
            regex: /[\uA73D]/g
        }, {
            base: "b",
            regex: /[\u0062\u24D1\uFF42\u1E03\u1E05\u1E07\u0180\u0183\u0253\u0182]/g
        }, {
            base: "c",
            regex: /[\u0063\u24D2\u0107\u0109\u010B\u010D\u00E7\u1E09\u0188\u023C\uA73F\u2184\u0043\u0106\u0108\u010A\u010C\u00C7\u0187\u023B]/g
        }, {
            base: "d",
            regex: /[\u0064\u24D3\uFF44\u1E0B\u010F\u1E0D\u1E11\u1E13\u1E0F\u0111\u018C\u0256\u0257\u018B\u13E7\u0501\uA7AA]/g
        }, {
            base: "dh",
            regex: /[\u00F0]/g
        }, {
            base: "dz",
            regex: /[\u01F3\u01C6]/g
        }, {
            base: "e",
            regex: /[\u0065\u24D4\uFF45\u00E8\u00E9\u00EA\u1EC1\u1EBF\u1EC5\u1EC3\u1EBD\u0113\u1E15\u1E17\u0115\u0117\u00EB\u1EBB\u011B\u0205\u0207\u1EB9\u1EC7\u0229\u1E1D\u0119\u1E19\u1E1B\u0247\u01DD]/g
        }, {
            base: "f",
            regex: /[\u0066\u24D5\uFF46\u1E1F\u0192]/g
        }, {
            base: "ff",
            regex: /[\uFB00]/g
        }, {
            base: "fi",
            regex: /[\uFB01]/g
        }, {
            base: "fl",
            regex: /[\uFB02]/g
        }, {
            base: "ffi",
            regex: /[\uFB03]/g
        }, {
            base: "ffl",
            regex: /[\uFB04]/g
        }, {
            base: "g",
            regex: /[\u0067\u24D6\uFF47\u01F5\u011D\u1E21\u011F\u0121\u01E7\u0123\u01E5\u0260\uA7A1\uA77F\u1D79]/g
        }, {
            base: "h",
            regex: /[\u0068\u24D7\uFF48\u0125\u1E23\u1E27\u021F\u1E25\u1E29\u1E2B\u1E96\u0127\u2C68\u2C76\u0265]/g
        }, {
            base: "hv",
            regex: /[\u0195]/g
        }, {
            base: "i",
            regex: /[\x69\u24D8\uFF49\xEC\xED\xEE\u0129\u012B\u012D\xEF\u1E2F\u1EC9\u01D0\u0209\u020B\u1ECB\u012F\u1E2D\u0268\u0131]/g
        }, {
            base: "j",
            regex: /[\x6A\u24D9\uFF4A\u0135\u01F0\u0249]/g
        }, {
            base: "k",
            regex: /[\x6B\u24DA\uFF4B\u1E31\u01E9\u1E33\u0137\u1E35\u0199\u2C6A\uA741\uA743\uA745\uA7A3]/g
        }, {
            base: "l",
            regex: /[\x6C\u24DB\uFF4C\u0140\u013A\u013E\u1E37\u1E39\u013C\u1E3D\u1E3B\u017F\u0142\u019A\u026B\u2C61\uA749\uA781\uA747\u026D]/g
        }, {
            base: "lj",
            regex: /[\u01C9]/g
        }, {
            base: "m",
            regex: /[\x6D\u24DC\uFF4D\u1E3F\u1E41\u1E43\u0271\u026F]/g
        }, {
            base: "n",
            regex: /[\x6E\u24DD\uFF4E\u01F9\u0144\xF1\u1E45\u0148\u1E47\u0146\u1E4B\u1E49\u019E\u0272\u0149\uA791\uA7A5\u043B\u0509]/g
        }, {
            base: "nj",
            regex: /[\u01CC]/g
        }, {
            base: "o",
            regex: /[\x6F\u24DE\uFF4F\xF2\xF3\xF4\u1ED3\u1ED1\u1ED7\u1ED5\xF5\u1E4D\u022D\u1E4F\u014D\u1E51\u1E53\u014F\u022F\u0231\xF6\u022B\u1ECF\u0151\u01D2\u020D\u020F\u01A1\u1EDD\u1EDB\u1EE1\u1EDF\u1EE3\u1ECD\u1ED9\u01EB\u01ED\xF8\u01FF\uA74B\uA74D\u0275\u0254\u1D11]/g
        }, {
            base: "oe",
            regex: /[\u0153]/g
        }, {
            base: "oi",
            regex: /[\u01A3]/g
        }, {
            base: "oo",
            regex: /[\uA74F]/g
        }, {
            base: "ou",
            regex: /[\u0223]/g
        }, {
            base: "p",
            regex: /[\x70\u24DF\uFF50\u1E55\u1E57\u01A5\u1D7D\uA751\uA753\uA755\u03C1]/g
        }, {
            base: "q",
            regex: /[\x71\u24E0\uFF51\u024B\uA757\uA759]/g
        }, {
            base: "r",
            regex: /[\x72\u24E1\uFF52\u0155\u1E59\u0159\u0211\u0213\u1E5B\u1E5D\u0157\u1E5F\u024D\u027D\uA75B\uA7A7\uA783]/g
        }, {
            base: "s",
            regex: /[\x73\u24E2\uFF53\u015B\u1E65\u015D\u1E61\u0161\u1E67\u1E63\u1E69\u0219\u015F\u023F\uA7A9\uA785\u1E9B\u0282]/g
        }, {
            base: "ss",
            regex: /[\xDF]/g
        }, {
            base: "t",
            regex: /[\x74\u24E3\uFF54\u1E6B\u1E97\u0165\u1E6D\u021B\u0163\u1E71\u1E6F\u0167\u01AD\u0288\u2C66\uA787]/g
        }, {
            base: "th",
            regex: /[\u00FE]/g
        }, {
            base: "tz",
            regex: /[\uA729]/g
        }, {
            base: "u",
            regex: /[\x75\u24E4\uFF55\xF9\xFA\xFB\u0169\u1E79\u016B\u1E7B\u016D\xFC\u01DC\u01D8\u01D6\u01DA\u1EE7\u016F\u0171\u01D4\u0215\u0217\u01B0\u1EEB\u1EE9\u1EEF\u1EED\u1EF1\u1EE5\u1E73\u0173\u1E77\u1E75\u0289]/g
        }, {
            base: "v",
            regex: /[\x76\u24E5\uFF56\u1E7D\u1E7F\u028B\uA75F\u028C]/g
        }, {
            base: "vy",
            regex: /[\uA761]/g
        }, {
            base: "w",
            regex: /[\x77\u24E6\uFF57\u1E81\u1E83\u0175\u1E87\u1E85\u1E98\u1E89\u2C73]/g
        }, {
            base: "x",
            regex: /[\x78\u24E7\uFF58\u1E8B\u1E8D]/g
        }, {
            base: "y",
            regex: /[\x79\u24E8\uFF59\u1EF3\xFD\u0177\u1EF9\u0233\u1E8F\xFF\u1EF7\u1E99\u1EF5\u01B4\u024F\u1EFF]/g
        }, {
            base: "z",
            regex: /[\x7A\u24E9\uFF5A\u017A\u1E91\u017C\u017E\u1E93\u1E95\u01B6\u0225\u0240\u2C6C\uA763]/g
        }],
        MAP_LENGTH = DIACRITICS_REMOVAL_MAP.length,
        ALL_ASCII_REGEX = /^[\x00-\x7f]*$/,
        diacriticsRemove = function(str) {
            if (ALL_ASCII_REGEX.test(str)) return str;
            for (var i = 0; MAP_LENGTH > i; ++i) {
                var removal = DIACRITICS_REMOVAL_MAP[i];
                str = str.replace(removal.regex, removal.base)
            }
            return str
        };
    "undefined" != typeof module && module.exports ? module.exports = {
        remove: diacriticsRemove
    } : "function" == typeof define && define.amd ? define(function() {
        return {
            remove: diacriticsRemove
        }
    }) : this.diacriticsRemove = diacriticsRemove
}();
/*
! function(factory) {
    return factory ? "function" == typeof define && define.amd ? define(["components/jquery"], factory) : factory("object" == typeof exports ? require("jquery") : window.jQuery) : void 0
}(function($) {
    var $container, $drop, $dropUl, $teamSettings, ajaxRevokeUser, ajaxUserFormSubmission, basicErrorHandler, dropDownItemClick, hideDropDown, infoMessage, initTokenField, listItemClick, refreshCounter, sendingUserForm, setupDrops, submitPeopleForm;
    return $container = $("#container"), $container.data("peopleManagerReady") ? !1 : (initTokenField = function() {}, $container.data("peopleManagerReady", !0), $drop = null, $dropUl = null, basicErrorHandler = function(jqXHR) {
        return alert(jqXHR.responseText ? "An Error occurred.\n\n" + jqXHR.responseText : "There was an unknown error. Please refresh the page and try it again.")
    }, setupDrops = function(el) {
        $drop = $(el).closest(".userCard.list").children(".userCardMenu"), $dropUl = $drop.children().first()
    }, hideDropDown = function() {
        null != $drop && $drop.addClass("inactiveMenu")
    }, listItemClick = function(event) {
        var $li, isInviteClass, liId, liRole, liTeam, liType, pos;
        return setupDrops(event.target), event.preventDefault(), $dropUl.removeData(["type", "role", "id", "query"]), $li = $(this).closest(".userCard.listItem"), $li.data("selfie") ? void hideDropDown() : (pos = $li.position(), void(parseInt($drop.css("left"), 10) === pos.left && parseInt($drop.css("top"), 10) === pos.top ? hideDropDown() : (isInviteClass = "", liType = $li.data("type"), liRole = $li.data("role") || "", liTeam = $li.data("team"), liId = $li.data("id") || "", "Invite" === liType && (liRole = liRole.charAt(0).toUpperCase() + liRole.slice(1), isInviteClass += " invite" + liRole), liTeam && (liId = "team", isInviteClass += " isTeam"), $dropUl.attr("class", "is" + liType + isInviteClass).data("type", liType).data("role", liRole).data("id", liId).data("query", $li.data("query")), $drop.css(pos).removeClass("inactiveMenu"))))
    }, dropDownItemClick = function(event) {
        var $cards, $link, $parentElement, ajaxParams, href, queryAd, roleIco, targetRole, userCard, userId, userRole, userType;
        setupDrops(event.target), event.preventDefault(), $drop.addClass("inactiveMenu"), hideDropDown(), $link = $(this), userId = $dropUl.data("id"), userType = $dropUl.data("type"), userRole = $dropUl.data("role"), queryAd = $dropUl.data("query") || !1, queryAd = queryAd ? "?" + queryAd : "", queryAd ? queryAd += "&role=" + userRole.toLowerCase() + "&_csrf=" + $link.data("csrftoken") : queryAd = "?_csrf=" + $link.data("csrftoken"), $parentElement = $link.parent(), $cards = $drop.siblings(".userCard.listItem"), ajaxParams = {
            type: $link.data("type"),
            cache: !1,
            data: "POST" === $link.data("type") ? {
                id: userId
            } : null,
            dataType: "json",
            error: basicErrorHandler
        }, href = $link.attr("href"), $parentElement.is("[class*=remove]") ? $.ajax($.extend(ajaxParams, {
            url: href + encodeURIComponent(userId) + queryAd,
            success: function() {
                $cards.filter('[data-id="' + userId + '"]').filter('[data-type="' + userType + '"]').remove(), $cards = $drop.siblings(".userCard.listItem"), refreshCounter($cards, $drop)
            }
        })) : $parentElement.is("[class*=morph]") ? (userCard = $cards.filter('[data-id="' + userId + '"]'), roleIco = userCard.find(".infoIco.opposite"), targetRole = $link.attr("data-target-role"), $.ajax($.extend(ajaxParams, {
            url: href + queryAd,
            success: function() {
                userCard.attr("data-role", targetRole.toLowerCase()).data("role", targetRole.toLowerCase()), "Invite" !== userCard.attr("data-type") && userCard.attr("data-type", targetRole).data("type", targetRole), roleIco.toggleClass("hidden"), "team" === userId && $(".accessibleToTeam span").text("" + targetRole + "s"), refreshCounter($cards, $drop)
            }
        }))) : $parentElement.is("[class*=resend]") && $.ajax($.extend(ajaxParams, {
            url: href + queryAd,
            success: function() {
                infoMessage($link.closest(".panel"), "Invitation resent successfully"), userCard = $cards.filter('[data-id="' + userId + '"]'), userCard.addClass("highlightedAsNew"), setTimeout(function() {
                    return userCard.removeClass("highlightedAsNew")
                }, 2e3)
            }
        }))
    } 
    /*submitPeopleForm = function(e) {
        e.preventDefault(), hideDropDown(), ajaxUserFormSubmission($(this))
    }, $container.delegate(".peoplePanel form.addAllowedUser", "submit", submitPeopleForm), $container.delegate(".peoplePanel .dropdownLink", "click", dropDownItemClick), $container.delegate(".userCard.listItem", "click", listItemClick), $container.delegate(".userCard.listItem .userName", "click", function(e) {
        return e.stopPropagation()
    }), $container.delegate(".changeData", "click", function(e) {
        hideDropDown(), e = $(this), e.hasClass("active") || (e.siblings(".active").removeClass("active"), e.addClass("active"), $(e.data("target")).attr("data-" + (e.data("attr") || "filter"), "" + (e.data("filter") || "all")))
    }), $container.delegate(".peoplePanel", "click", function(e) {
        e.isDefaultPrevented() ? e.preventDefault() : hideDropDown()
    }), $container.delegate(".cancelButton", "click", function(e) {
        return e.preventDefault(), $("#addMembersForm").addClass("zeroH")
    }), refreshCounter = function($cards, $cardOrMenu) {
        var $menu;
        return $menu = $($cardOrMenu.closest(".userCard.list").data("menu")), $cards = $cards.not("[data-team]"), $(".changeData", $menu).each(function(indexOf, el) {
            var $badge, $el, num;
            if ($el = $(el), $badge = $el.find(".numBadge, .badgeLike"), $badge.length) {
                switch (num = $cards.length, $el.data("filter")) {
                    case "admin":
                    case "member":
                    case "editor":
                    case "viewer":
                        num = $cards.filter("[data-role='" + $el.data("filter") + "']").length;
                        break;
                    case "invite":
                        num = $cards.filter('[data-type="Invite"]').length
                }
                return $badge.text(num)
            }
        })
    },
     infoMessage = function(div, text) {
        return div.find(".infoMessage").text(text).stop(1, 1).show().wait(2e3).fadeOut(500)
    }, sendingUserForm = !1, ajaxUserFormSubmission = function(form) {
        var btnIcon;
        return sendingUserForm ? !1 : (sendingUserForm = !0, btnIcon = form.find('button[type="submit"] i').attr("class", "icon-refresh icon-spin"), $.ajax({
            type: "POST",
            dataType: "json",
            url: form.attr("action"),
            data: form.serialize(),
            xhrFields: {
                withCredentials: !0
            },
            accepts: {
                json: "application/json"
            },
            failure: function() {
                return alert("Form submission failed, please try again")
            },
            error: function() {
                return alert("Form submission failed, please try again")
            },
            complete: function() {
                return sendingUserForm = !1, btnIcon.attr("class", "")
            },
            success: function(res) {
                var madeMyDay, resentMsg, user, userHtml, usersWithAccess, _i, _len, _ref;
                for (usersWithAccess = $(form.data("where")), madeMyDay = !1, userHtml = "", _ref = res.emails, _i = 0, _len = _ref.length; _len > _i; _i++) user = _ref[_i], madeMyDay = !0, userHtml += user.html;
                madeMyDay && (userHtml = $(userHtml), setTimeout(function($el) {
                    return function() {
                        return $el.removeClass("highlightedAsNew")
                    }
                }(userHtml), 2e3), usersWithAccess.prepend(userHtml), usersWithAccess.removeClass("isEmpty")), form.get(0).reset(), form.find(".token-field").trigger("token:reset"), $(".addMembersLink").trigger("click"), refreshCounter(usersWithAccess.children(".listItem"), usersWithAccess), resentMsg = res.resent ? ", resent " + res.resent + " invitation" + (res.resent > 1 ? "s" : "") : "", infoMessage(form.closest(".overlay"), "Added " + res.emails.length + " user" + (res.emails.length > 1 ? "s" : "") + resentMsg)
            }
        }))
    }, ajaxRevokeUser = function(el) {
        var url;
        return el.data("id") || (el = el.closest(".jsRemoveUser")), el || alert("Sorry, there is apparently a bug in our javascript. Could You please tell us?"), (url = el.attr("href")) ? url += "/" + el.data("id") : (url = el.parent().data("baseuri") || window.config.baseAjaxUrl, url += "settings/people/remove_", url += el.data("member") ? "member" : el.data("admin") ? "admin" : el.data("visitor") ? "user" : "editor", url += "/" + el.data("id")), $.ajax({
            type: "DELETE",
            dataType: "json",
            xhrFields: {
                withCredentials: !0
            },
            accepts: {
                json: "application/json"
            },
            url: url,
            failure: function() {
                return alert("User remove failed, please try again")
            },
            error: function(jqXHR) {
                return alert(jqXHR.responseText ? "User remove failed.\n\n" + jqXHR.responseText : "User remove failed.")
            },
            success: function(res) {
                var $childs;
                res = el.parent(), el.remove(), $childs = res.children(".listItem"), refreshCounter($childs, res), $childs.length > 1 ? res.removeClass("isEmpty") : res.addClass("isEmpty")
            }
        })
    },*/ 
/*
    $teamSettings = $container.find(".teamSettings"), $teamSettings.length && (! function($el) {
        var $img, $input, baseUrl, timer;
        return $img = $el.find("img.teamAvatarImg"), $input = $el.find("input.md5"), baseUrl = $img.data("base"), timer = null, $input.bind("keyup", function() {
            var val;
            clearTimeout(timer), val = this.value, timer = setTimeout(function() {
                return val && val.indexOf("@") > 1 ? $img.attr("src", baseUrl.replace("%s", SparkMD5.hash("" + val))) : void 0
            }, 300)
        })
    }($teamSettings), function($el) {
        var $inputs;
        return $inputs = $el.find(".teamSettingsSwitch"), $inputs.each(function(indexOf, $el) {
            var bindingsEvents, timer;
            return $el = $($el), timer = null, bindingsEvents = $el.is("select") ? "change" : "change click", $el.bind(bindingsEvents, function() {
                clearTimeout(timer), timer = setTimeout(function() {
                    var checked, data;
                    return $el.closest(".flatRadioWrap").stop(1, 1).removeClass("saved").addClass("loading").show(), checked = $el.is("input") ? $el.prop("checked") : $el.val(), data = {
                        team_defaultName: $el.attr("name")
                    }, data[$el.attr("name")] = checked ? $el.val() : "0", $.ajax({
                        url: $el.closest("form").attr("action") + ("?_csrf=" + $el.data("csrftoken")),
                        type: "POST",
                        data: data,
                        complete: function() {
                            return timer = setTimeout(function() {
                                return $el.closest(".flatRadioWrap").stop(1, 1).show().removeClass("loading").addClass("saved"), timer = setTimeout(function() {
                                    return $el.closest(".flatRadioWrap").removeClass("saved")
                                }, 2e3)
                            }, 100)
                        }
                    })
                }, 100)
            })
        })
    }($teamSettings)), window.initPeople = initTokenField, initTokenField())*/
/*});*/

var focusInside, retrieveLoginBox, retrievedJsModules;
retrievedJsModules = {}, retrieveLoginBox = function(link, container, cbDone, cbFail) {
    var called, calls, script, scripts, _i, _len;
    if (cbDone = cbDone || function() {}, cbFail = cbFail || function() {}, link.hasClass("loadingNow")) return !1;
    if (link.hasClass("cacheable") && link.hasClass("alreadyLoaded")) return focusInside($(link.data("loadedData")).show()), "function" == typeof cbDone && cbDone(), !1;
    if (null == container && (container = link.data("container") || "#container"), calls = [], called = [], scripts = link.data("scripts"))
        for (scripts = scripts.split(","), _i = 0, _len = scripts.length; _len > _i; _i++) script = scripts[_i], retrievedJsModules[script] || (calls.push($.getScript(script)), called.push(script));
    return $.when.apply(null, calls).then(function() {
        var call, _j, _len1;
        if (calls.length)
            for (_j = 0, _len1 = called.length; _len1 > _j; _j++) call = called[_j], retrievedJsModules[call] = !0;
        return $.ajax({
            url: link.attr("href"),
            type: "GET",
            data: {
                xhr: 1
            },
            cache: link.hasClass("cacheable"),
            complete: function() {
                link.removeClass("loadingNow")
            },
            error: function(jqXHR) {
                return alert(jqXHR.responseText ? "An Error occurred.\n\n" + jqXHR.responseText : "Cannot send form; please try again"), "function" == typeof cbFail ? cbFail() : void 0
            },
            success: function(data) {
                var executableFn;
                return link.addClass("alreadyLoaded"), $("#invitationOverlay .close, #container > .overlay .close").trigger("click"), data = $(container).append(data).children().last(), link.hasClass("cacheable") && link.data("loadedData", data), focusInside(data), (executableFn = link.data("afterjs")) && "function" == typeof window[executableFn] && window[executableFn](), "function" == typeof cbDone ? cbDone() : void 0
            }
        })
    })
}, focusInside = function(el) {
    return el.find('input[type="text"]:visible:first, textarea:visible:first').trigger("focus")
}, $(document).ready(function($) {
    var $container, $filterLayerEls, hideSwitchLayers, hideSwitchLayersOnKey, layersToHide, sendingInvitation, showingLayers;
    return $("html").removeClass("no-js").addClass("js").addClass("jsDomReady"), $.fn.wait = function(time, type) {
        return null == time && (time = 1e3), null == type && (type = "fx"), this.queue(type, function() {
            var self;
            return self = this, setTimeout(function() {
                return $(self).dequeue()
            }, time)
        })
    }, $container = $("#container"), $("header .hint").tipsy({
        offset: -20,
        opacity: .95,
        fade: !1,
        gravity: "n",
        title: "data-hint"
    }), $("header .vLockedTooltip").tipsy({
        offset: 10,
        opacity: .95,
        fade: !1,
        gravity: "n",
        title: "data-hint",
        live: !0
    }), $(".teamApisListItem .vLocked").tipsy({
        offset: 5,
        opacity: .95,
        fade: !1,
        gravity: "n",
        title: "data-hint"
    }), $(".hintMe").tipsy({
        offset: 0,
        opacity: .95,
        fase: !1,
        gravity: "n",
        title: "title",
        live: !0
    }), $("input.openLightBox, button.openLightBox, a.openLightBox").bind("click", function(e) {
        e.preventDefault(), focusInside($($(this).data("lightbox")).removeClass("visuallyhidden").show())
    }), $container.delegate(".hiddenToggler", "click", function(e) {
        e.preventDefault(), e = $(this), e.toggleClass("isHidden isShown"), $(e.data("target")).toggleClass(e.data("toggle-class") || "hidden"), e.hasClass("isShown") && (e = e.data("focus")) && focusInside($(e))
    }), $filterLayerEls = $(".filterLayer"), $filterLayerEls.length && $filterLayerEls.each(function(indexOf, layer) {
        var $filterClass, $filterInputEl, $filterWhatEl, $layer, fillInListItems, filterChilds, filterListTexts, getTextOfListItem;
        return filterListTexts = null, $filterWhatEl = null, $layer = $(layer), $filterInputEl = $layer.find(".filterInput"), $filterClass = $filterInputEl.data("toggle-class") || "visuallyhidden", filterChilds = $filterInputEl.data("childs") || !1, fillInListItems = function() {
            return filterListTexts = [], $filterWhatEl = $($filterInputEl.data("list")), $filterWhatEl = [].slice.call($filterWhatEl, 0).map(getTextOfListItem)
        }, getTextOfListItem = function($listItem) {
            var text;
            return $listItem = $($listItem), text = filterChilds ? $listItem.find(filterChilds).text() || "" : $listItem.text(), filterListTexts.push(window.diacriticsRemove(text).trim().toLowerCase()), $listItem
        }, fillInListItems(), $layer.find("input").on("click input", function(e) {
            var filtered, inputedText;
            "click" === (null != e ? e.type : void 0) && (this.hasAttribute("data-playevents") || e.preventDefault()), inputedText = window.diacriticsRemove(this.value || "").trim().toLowerCase(), this.hasAttribute("data-fresh") && fillInListItems(), filtered = $filterWhatEl.filter(function($filterListItem, filterListIndex) {
                return ~filterListTexts[filterListIndex].indexOf(inputedText) ? ($filterListItem.removeClass($filterClass), !0) : ($filterListItem.addClass($filterClass), !1)
            })
        })
    }), layersToHide = $(".switcherWrap"), showingLayers = !1, layersToHide.each(function(indexOfEl, el) {
        var layer, toggler;
        return el = $(el), layer = el.find(".switcherLayer"), toggler = el.find(".switcherToggle"), toggler.bind("click dblclick", function(e) {
            return e.preventDefault(), el.hasClass("selected") ? void hideSwitchLayers() : (hideSwitchLayers(), showingLayers = !0, el.toggleClass("selected", !layer.toggleClass("visuallyhidden").hasClass("visuallyhidden")), !1)
        })
    }), hideSwitchLayers = function(e) {
        return !showingLayers || e && (e.isDefaultPrevented() || $(e.target).closest(".switcherLayer").length) ? void 0 : (showingLayers = !1, layersToHide.removeClass("selected").filter(".switcherLayer").addClass("visuallyhidden"))
    }, hideSwitchLayersOnKey = function(e) {
        showingLayers && 27 === e.keyCode && hideSwitchLayers()
    }, layersToHide.length > 0 && (layersToHide = layersToHide.add(layersToHide.find(".switcherLayer")), $("body").on("click.hideSwitchLayers", hideSwitchLayers).on("keyup", hideSwitchLayersOnKey)), sendingInvitation = !1, $container.delegate(".closeLayer", "click", function() {
        return $(this).next().find(".close").trigger("click")
    }), $container.delegate(".close", "click", function(e) {
        var $el;
        return e = $(this), $el = e.closest('div[id*="Overlay"], .overlay, .loginOverlay'), e.hasClass("removeAfterClose") ? $el.remove() : $el.hasClass("vsh") ? $el.addClass("visuallyhidden") : $el.hide()
    }).on("click", "a.ajaxLoadLink", function(e) {
        var postObject, urlToLoad;
        return $.ajaxSetup({
            xhrFields: {
                withCredentials: !0
            }
        }), e.preventDefault(), e = $(this), e.find("i").attr("class", "icon-spin icon-refresh"), postObject = "post" === e.data("method") ? {} : null, urlToLoad = e.data("url"), $(e.data("where")).load(urlToLoad + ("" + (~urlToLoad.indexOf("?") ? "&" : "?") + "_t=" + $.now()), postObject), $.ajaxSetup({
            xhrFields: {
                withCredentials: !1
            }
        })
    }).on("click", "a.ajaxLink", function(e) {
        e.preventDefault(), retrieveLoginBox($(this))
    }).on("submit", "#invitation form", function(e) {
        var btnIcon, emailRegExp, frm, inputElement, inputValue;
        return e.stopPropagation(), e.preventDefault(), sendingInvitation ? !1 : (sendingInvitation = !0, emailRegExp = /^(?:[\w\!\#\$\%\&\'\*\+\-\/\=\?\^\`\{\|\}\~]+\.)*[\w\!\#\$\%\&\'\*\+\-\/\=\?\^\`\{\|\}\~]+@(?:(?:(?:[a-zA-Z0-9](?:[a-zA-Z0-9\-](?!\.)){0,61}[a-zA-Z0-9]?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9\-](?!$)){0,61}[a-zA-Z0-9]?)|(?:\[(?:(?:[01]?\d{1,2}|2[0-4]\d|25[0-5])\.){3}(?:[01]?\d{1,2}|2[0-4]\d|25[0-5])\]))$/, frm = $(this), inputElement = frm.find("input.textField"), inputValue = inputElement.val(), emailRegExp.test(inputValue) ? (btnIcon = frm.find('button[type="submit"] i').attr("class", "icon-spin icon-refresh").next().text("Sending..."), $.ajax({
            url: $(this).attr("action"),
            type: "POST",
            data: $(this).serialize(),
            xhrFields: {
                withCredentials: !0
            },
            accepts: {
                json: "application/json"
            },
            failure: function() {
                return alert("Cannot send form; please try again")
            },
            error: function() {
                return alert("Cannot send form; please try again")
            },
            complete: function() {
                return sendingInvitation = !1, btnIcon.attr("class", "").next().text("Send Invitation")
            },
            success: function() {
                return $("#invitationOverlay").remove()
            }
        })) : alert("Please enter a valid email address."))
    }).delegate(".createApiForm", "submit", function(e) {
        var btn, inputNewApiName;
        return e.preventDefault(), e = $(this), inputNewApiName = e.find("input.newApiName"), inputNewApiName.length && inputNewApiName.val().trim() ? (btn = e.find(".createApiButton").val("Creating..."), e.trigger("apiary:track", {
            apiName: inputNewApiName
        }), void $.ajax({
            url: e.attr("action"),
            type: "POST",
            data: e.serialize() + "&xhr=1",
            dataType: "json",
            xhrFields: {
                withCredentials: !0
            },
            accepts: {
                json: "application/json"
            },
            failure: function(jqXHR) {
                btn.val("Create"), alert("Cannot send form; please try again\n\n" + jqXHR.responseText)
            },
            error: function(jqXHR) {
                btn.val("Create"), alert("Cannot send form; please try again\n\n" + jqXHR.responseText)
            },
            success: function(data) {
                1 === (null != data ? data.state : void 0) && data.redirectTo && (e.hide().prev().text("Redirecting..."), setTimeout(function() {
                    return window.location.href = data.redirectTo
                }, 300))
            }
        })) : (inputNewApiName.addClass("bad"), setTimeout(function() {
            return inputNewApiName.removeClass("bad").trigger("focus")
        }, 300), !1)
    })
});