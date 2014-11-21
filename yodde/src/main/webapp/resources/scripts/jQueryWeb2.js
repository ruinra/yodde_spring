(function(a) {
	a.fn.supersubs = function(b) {
		var c = a.extend({}, a.fn.supersubs.defaults, b);
		return this.each(function() {
			var d = a(this);
			var e = a.meta ? a.extend({}, c, d.data()) : c;
			var f = a('<li id="menu-fontsize">&#8212;</li>').css({
				padding: 0,
				position: "absolute",
				top: "-999em",
				width: "auto"
			}).appendTo(d).width();
			a("#menu-fontsize").remove();
			$ULs = d.find("ul");
			$ULs.each(function(l) {
				var k = $ULs.eq(l);
				var j = k.children();
				var g = j.children("a");
				var m = j.css("white-space", "nowrap").css("float");
				var h = k.add(j).add(g).css({
					"float": "none",
					width: "auto"
				}).end().end()[0].clientWidth / f;
				h += e.extraWidth;
				if (h > e.maxWidth) {
					h = e.maxWidth
				} else {
					if (h < e.minWidth) {
						h = e.minWidth
					}
				}
				h += "em";
				k.css("width", h);
				j.css({
					"float": m,
					width: "100%",
					"white-space": "normal"
				}).each(function() {
					var n = a(">ul", this);
					var i = n.css("left") !== undefined ? "left" : "right";
					n.css(i, h)
				})
			})
		})
	};
	a.fn.supersubs.defaults = {
		minWidth: 9,
		maxWidth: 25,
		extraWidth: 0
	}
})(jQuery);
jQuery.noConflict();
jQuery(document).ready(function() {
	jQuery("ul.sf-menu").supersubs({
		minWidth: 8,
		maxWidth: 15,
		extraWidth: 1
	}).superfish({
		delay: 400,
		animation: {
			opacity: 'show',
			height: 'show'
		},
		speed: 'fast',
		autoArrows: true,
		dropShadows: true
	});
});;
(function($) {
	$.fn.superfish = function(op) {
		var sf = $.fn.superfish,
			c = sf.c,
			$arrow = $(['<span class="', c.arrowClass, '"> &#187;</span>'].join('')),
			over = function() {
				var $$ = $(this),
					menu = getMenu($$);
				clearTimeout(menu.sfTimer);
				$$.showSuperfishUl().siblings().hideSuperfishUl();
			},
			out = function() {
				var $$ = $(this),
					menu = getMenu($$),
					o = sf.op;
				clearTimeout(menu.sfTimer);
				menu.sfTimer = setTimeout(function() {
					o.retainPath = ($.inArray($$[0], o.$path) > -1);
					$$.hideSuperfishUl();
					if (o.$path.length && $$.parents(['li.', o.hoverClass].join('')).length < 1) {
						over.call(o.$path);
					}
				}, o.delay);
			},
			getMenu = function($menu) {
				var menu = $menu.parents(['ul.', c.menuClass, ':first'].join(''))[0];
				sf.op = sf.o[menu.serial];
				return menu;
			},
			addArrow = function($a) {
				$a.addClass(c.anchorClass).append($arrow.clone());
			};
		return this.each(function() {
			var s = this.serial = sf.o.length;
			var o = $.extend({}, sf.defaults, op);
			o.$path = $('li.' + o.pathClass, this).slice(0, o.pathLevels).each(function() {
				$(this).addClass([o.hoverClass, c.bcClass].join(' ')).filter('li:has(ul)').removeClass(o.pathClass);
			});
			sf.o[s] = sf.op = o;
			$('li:has(ul)', this)[($.fn.hoverIntent && !o.disableHI) ? 'hoverIntent' : 'hover'](over, out).each(function() {
				if (o.autoArrows) addArrow($('>a:first-child', this));
			}).not('.' + c.bcClass).hideSuperfishUl();
			var $a = $('a', this);
			$a.each(function(i) {
				var $li = $a.eq(i).parents('li');
				$a.eq(i).focus(function() {
					over.call($li);
				}).blur(function() {
					out.call($li);
				});
			});
			o.onInit.call(this);
		}).each(function() {
			var menuClasses = [c.menuClass];
			if (sf.op.dropShadows && !($.browser.msie && $.browser.version < 7)) menuClasses.push(c.shadowClass);
			$(this).addClass(menuClasses.join(' '));
		});
	};
	var sf = $.fn.superfish;
	sf.o = [];
	sf.op = {};
	sf.IE7fix = function() {
		var o = sf.op;
		if ($.browser.msie && $.browser.version > 6 && o.dropShadows && o.animation.opacity != undefined)
			this.toggleClass(sf.c.shadowClass + '-off');
	};
	sf.c = {
		bcClass: 'sf-breadcrumb',
		menuClass: 'sf-js-enabled',
		anchorClass: 'sf-with-ul',
		arrowClass: 'sf-sub-indicator',
		shadowClass: 'sf-shadow'
	};
	sf.defaults = {
		hoverClass: 'sfHover',
		pathClass: 'overideThisToUse',
		pathLevels: 1,
		delay: 800,
		animation: {
			opacity: 'show'
		},
		speed: 'normal',
		autoArrows: true,
		dropShadows: true,
		disableHI: false,
		onInit: function() {},
		onBeforeShow: function() {},
		onShow: function() {},
		onHide: function() {}
	};
	$.fn.extend({
		hideSuperfishUl: function() {
			var o = sf.op,
				not = (o.retainPath === true) ? o.$path : '';
			o.retainPath = false;
			var $ul = $(['li.', o.hoverClass].join(''), this).add(this).not(not).removeClass(o.hoverClass).find('>ul').hide().css('visibility', 'hidden');
			o.onHide.call($ul);
			return this;
		},
		showSuperfishUl: function() {
			var o = sf.op,
				sh = sf.c.shadowClass + '-off',
				$ul = this.addClass(o.hoverClass).find('>ul:hidden').css('visibility', 'visible');
			sf.IE7fix.call($ul);
			o.onBeforeShow.call($ul);
			$ul.animate(o.animation, o.speed, function() {
				sf.IE7fix.call($ul);
				o.onShow.call($ul);
			});
			return this;
		}
	});
})(jQuery);;
/*
 * FitVids 1.0
 *
 * Copyright 2013, Chris Coyier - http://css-tricks.com + Dave Rupert - http://daverupert.com
 * Credit to Thierry Koblentz - http://www.alistapart.com/articles/creating-intrinsic-ratios-for-video/
 * Released under the WTFPL license - http://sam.zoy.org/wtfpl/
 *
 * Date: Thu Sept 01 18:00:00 2011 -0500
 */
(function($) {
	"use strict";
	$.fn.fitVids = function(options) {
		var settings = {
			customSelector: null
		};
		if (!document.getElementById('fit-vids-style')) {
			var div = document.createElement('div'),
				ref = document.getElementsByTagName('base')[0] || document.getElementsByTagName('script')[0],
				cssStyles = '&shy;<style>.fluid-width-video-wrapper{width:100%;position:relative;padding:0;}.fluid-width-video-wrapper iframe,.fluid-width-video-wrapper object,.fluid-width-video-wrapper embed {position:absolute;top:0;left:0;width:100%;height:100%;}</style>';
			div.className = 'fit-vids-style';
			div.id = 'fit-vids-style';
			div.style.display = 'none';
			div.innerHTML = cssStyles;
			ref.parentNode.insertBefore(div, ref);
		}
		if (options) {
			$.extend(settings, options);
		}
		return this.each(function() {
			var selectors = ["iframe[src*='player.vimeo.com']", "iframe[src*='youtube.com']", "iframe[src*='youtube-nocookie.com']", "iframe[src*='kickstarter.com'][src*='video.html']", "object", "embed"];
			if (settings.customSelector) {
				selectors.push(settings.customSelector);
			}
			var $allVideos = $(this).find(selectors.join(','));
			$allVideos = $allVideos.not("object object");
			$allVideos.each(function() {
				var $this = $(this);
				if (this.tagName.toLowerCase() === 'embed' && $this.parent('object').length || $this.parent('.fluid-width-video-wrapper').length) {
					return;
				}
				var height = (this.tagName.toLowerCase() === 'object' || ($this.attr('height') && !isNaN(parseInt($this.attr('height'), 10)))) ? parseInt($this.attr('height'), 10) : $this.height(),
					width = !isNaN(parseInt($this.attr('width'), 10)) ? parseInt($this.attr('width'), 10) : $this.width(),
					aspectRatio = height / width;
				if (!$this.attr('id')) {
					var videoID = 'fitvid' + Math.floor(Math.random() * 999999);
					$this.attr('id', videoID);
				}
				$this.wrap('<div class="fluid-width-video-wrapper"></div>').parent('.fluid-width-video-wrapper').css('padding-top', (aspectRatio * 100) + "%");
				$this.removeAttr('height').removeAttr('width');
			});
		});
	};
})(window.jQuery || window.Zepto);;
/* Copyright 2012, Ben Lin (http://dreamerslab.com/)
 * Licensed under the MIT License (LICENSE.txt).
 *
 * Version: 1.0.13
 *
 * Requires: jQuery 1.2.3 ~ 1.8.2
 */
;
(function(a) {
	a.fn.extend({
		actual: function(b, l) {
			if (!this[b]) {
				throw '$.actual => The jQuery method "' + b + '" you called does not exist';
			}
			var f = {
				absolute: false,
				clone: false,
				includeMargin: false
			};
			var i = a.extend(f, l);
			var e = this.eq(0);
			var h, j;
			if (i.clone === true) {
				h = function() {
					var m = "position: absolute !important; top: -1000 !important; ";
					e = e.clone().attr("style", m).appendTo("body");
				};
				j = function() {
					e.remove();
				};
			} else {
				var g = [];
				var d = "";
				var c;
				h = function() {
					c = e.parents().andSelf().filter(":hidden");
					d += "visibility: hidden !important; display: block !important; ";
					if (i.absolute === true) {
						d += "position: absolute !important; ";
					}
					c.each(function() {
						var m = a(this);
						g.push(m.attr("style"));
						m.attr("style", d);
					});
				};
				j = function() {
					c.each(function(m) {
						var o = a(this);
						var n = g[m];
						if (n === undefined) {
							o.removeAttr("style");
						} else {
							o.attr("style", n);
						}
					});
				};
			}
			h();
			var k = /(outer)/g.test(b) ? e[b](i.includeMargin) : e[b]();
			j();
			return k;
		}
	});
})(jQuery);;;
(function(b) {
	function j(e, a) {
		if (0 === e.indexOf("#")) b(e).clone(!0).appendTo(c.empty()).show();
		else {
			if (a) {
				var d = b("<iframe />").attr({
					src: e,
					frameborder: 0,
					hspace: 0
				}).css({
					width: "100%",
					height: "100%"
				});
				c.html(d)
			} else c.load(e);
			c.data("localEl", !1)
		}
	}

	function k(b, a) {
		var d = c.outerWidth(!0),
			f = {},
			g = {};
		if (!c.is(":visible") && !h) {
			h = !0;
			switch (b) {
				case "left":
					c.css({
						left: "auto",
						right: "-" + d + "px"
					});
					f["margin-left"] = "-=" + d;
					g.right = "+=" + d;
					break;
				default:
					c.css({
						left: "-" + d + "px",
						right: "auto"
					}), f["margin-left"] = "+=" + d, g.left = "+=" + d
			}
			l.animate(f, a);
			c.show().animate(g, a, function() {
				h = !1
			})
		}
	}
	var l = b("body"),
		c = b("#pageslide"),
		h = !1,
		m;
	0 == c.length && (c = b("<div />").attr("id", "pageslide").css("display", "none").appendTo(b("body")));
	b.fn.pageslide = function(e) {
		this.click(function(a) {
			var d = b(this),
				f = b.extend({
					href: d.attr("href")
				}, e);
			a.preventDefault();
			a.stopPropagation();
			c.is(":visible") && d[0] == m ? b.pageslide.close() : (b.pageslide(f), m = d[0])
		})
	};
	b.fn.pageslide.defaults = {
		speed: 200,
		direction: "right",
		modal: !1,
		iframe: !0,
		href: null
	};
	b.pageslide = function(e) {
		var a = b.extend({}, b.fn.pageslide.defaults, e);
		c.is(":visible") && c.data("direction") != a.direction ? b.pageslide.close(function() {
			j(a.href, a.iframe);
			k(a.direction, a.speed)
		}) : (j(a.href, a.iframe), c.is(":hidden") && k(a.direction, a.speed));
		c.data(a)
	};
	b.pageslide.close = function(c) {
		var a = b("#pageslide"),
			d = a.outerWidth(!0),
			f = a.data("speed"),
			g = {},
			i = {};
		if (!a.is(":hidden") && !h) {
			h = !0;
			switch (a.data("direction")) {
				case "left":
					g["margin-left"] = "+=" + d;
					i.right = "-=" + d;
					break;
				default:
					g["margin-left"] = "-=" + d, i.left = "-=" + d
			}
			a.animate(i, f);
			l.animate(g, f, function() {
				a.hide();
				h = !1;
				"undefined" != typeof c && c()
			})
		}
	};
	c.click(function(b) {
		b.stopPropagation()
	});
	b(document).bind("click keyup", function(e) {
		"keyup" == e.type && 27 != e.keyCode || c.is(":visible") && !c.data("modal") && b.pageslide.close()
	})
})(jQuery);;
/* http://tinynav.viljamis.com v1.05 by @viljamis */
(function(a, i, g) {
	a.fn.tinyNav = function(j) {
		var d = a.extend({
			active: "selected",
			header: ""
		}, j);
		return this.each(function() {
			g++;
			var h = a(this),
				e = "tinynav" + g,
				f = ".l_" + e,
				b = a("<select/>").addClass("tinynav " + e);
			if (h.is("ul,ol")) {
				"" !== d.header && b.append(a("<option/>").text(d.header));
				var c = "";
				h.addClass("l_" + e).find("a").each(function() {
					c += '<option value="' + a(this).attr("href") + '">';
					var b;
					for (b = 0; b < a(this).parents("ul, ol").length - 1; b++) c += "- ";
					c += a(this).text() + "</option>"
				});
				b.append(c);
				d.header || b.find(":eq(" +
					a(f + " li").index(a(f + " li." + d.active)) + ")").attr("selected", !0);
				b.change(function() {
					i.location.href = a(this).val()
				});
				a(f).after(b)
			}
		})
	}
})(jQuery, this, 0);;;
(function($) {
	var h = $.scrollTo = function(a, b, c) {
		$(window).scrollTo(a, b, c)
	};
	h.defaults = {
		axis: 'xy',
		duration: parseFloat($.fn.jquery) >= 1.3 ? 0 : 1,
		limit: true
	};
	h.window = function(a) {
		return $(window)._scrollable()
	};
	$.fn._scrollable = function() {
		return this.map(function() {
			var a = this,
				isWin = !a.nodeName || $.inArray(a.nodeName.toLowerCase(), ['iframe', '#document', 'html', 'body']) != -1;
			if (!isWin) return a;
			var b = (a.contentWindow || a).document || a.ownerDocument || a;
			return /webkit/i.test(navigator.userAgent) || b.compatMode == 'BackCompat' ? b.body : b.documentElement
		})
	};
	$.fn.scrollTo = function(e, f, g) {
		if (typeof f == 'object') {
			g = f;
			f = 0
		}
		if (typeof g == 'function') g = {
			onAfter: g
		};
		if (e == 'max') e = 9e9;
		g = $.extend({}, h.defaults, g);
		f = f || g.duration;
		g.queue = g.queue && g.axis.length > 1;
		if (g.queue) f /= 2;
		g.offset = both(g.offset);
		g.over = both(g.over);
		return this._scrollable().each(function() {
			if (e == null) return;
			var d = this,
				$elem = $(d),
				targ = e,
				toff, attr = {},
				win = $elem.is('html,body');
			switch (typeof targ) {
				case 'number':
				case 'string':
					if (/^([+-]=?)?\d+(\.\d+)?(px|%)?$/.test(targ)) {
						targ = both(targ);
						break
					}
					targ = $(targ, this);
					if (!targ.length) return;
				case 'object':
					if (targ.is || targ.style) toff = (targ = $(targ)).offset()
			}
			$.each(g.axis.split(''), function(i, a) {
				var b = a == 'x' ? 'Left' : 'Top',
					pos = b.toLowerCase(),
					key = 'scroll' + b,
					old = d[key],
					max = h.max(d, a);
				if (toff) {
					attr[key] = toff[pos] + (win ? 0 : old - $elem.offset()[pos]);
					if (g.margin) {
						attr[key] -= parseInt(targ.css('margin' + b)) || 0;
						attr[key] -= parseInt(targ.css('border' + b + 'Width')) || 0
					}
					attr[key] += g.offset[pos] || 0;
					if (g.over[pos]) attr[key] += targ[a == 'x' ? 'width' : 'height']() * g.over[pos]
				} else {
					var c = targ[pos];
					attr[key] = c.slice && c.slice(-1) == '%' ? parseFloat(c) / 100 * max : c
				}
				if (g.limit && /^\d+$/.test(attr[key])) attr[key] = attr[key] <= 0 ? 0 : Math.min(attr[key], max);
				if (!i && g.queue) {
					if (old != attr[key]) animate(g.onAfterFirst);
					delete attr[key]
				}
			});
			animate(g.onAfter);

			function animate(a) {
				$elem.animate(attr, f, g.easing, a && function() {
					a.call(this, targ, g)
				})
			}
		}).end()
	};
	h.max = function(a, b) {
		var c = b == 'x' ? 'Width' : 'Height',
			scroll = 'scroll' + c;
		if (!$(a).is('html,body')) return a[scroll] - $(a)[c.toLowerCase()]();
		var d = 'client' + c,
			html = a.ownerDocument.documentElement,
			body = a.ownerDocument.body;
		return Math.max(html[scroll], body[scroll]) - Math.min(html[d], body[d])
	};

	function both(a) {
		return typeof a == 'object' ? a : {
			top: a,
			left: a
		}
	}
})(jQuery);;
(function(a, b, c) {
	"use strict";
	var d = a.document,
		e = a.Modernizr,
		f = function(a) {
			return a.charAt(0).toUpperCase() + a.slice(1)
		},
		g = "Moz Webkit O Ms".split(" "),
		h = function(a) {
			var b = d.documentElement.style,
				c;
			if (typeof b[a] == "string") return a;
			a = f(a);
			for (var e = 0, h = g.length; e < h; e++) {
				c = g[e] + a;
				if (typeof b[c] == "string") return c
			}
		},
		i = h("transform"),
		j = h("transitionProperty"),
		k = {
			csstransforms: function() {
				return !!i
			},
			csstransforms3d: function() {
				var a = !!h("perspective");
				if (a) {
					var c = " -o- -moz- -ms- -webkit- -khtml- ".split(" "),
						d = "@media (" + c.join("transform-3d),(") + "modernizr)",
						e = b("<style>" + d + "{#modernizr{height:3px}}" + "</style>").appendTo("head"),
						f = b('<div id="modernizr" />').appendTo("html");
					a = f.height() === 3, f.remove(), e.remove()
				}
				return a
			},
			csstransitions: function() {
				return !!j
			}
		},
		l;
	if (e)
		for (l in k) e.hasOwnProperty(l) || e.addTest(l, k[l]);
	else {
		e = a.Modernizr = {
			_version: "1.6ish: miniModernizr for Isotope"
		};
		var m = " ",
			n;
		for (l in k) n = k[l](), e[l] = n, m += " " + (n ? "" : "no-") + l;
		b("html").addClass(m)
	}
	if (e.csstransforms) {
		var o = e.csstransforms3d ? {
				translate: function(a) {
					return "translate3d(" + a[0] + "px, " + a[1] + "px, 0) "
				},
				scale: function(a) {
					return "scale3d(" + a + ", " + a + ", 1) "
				}
			} : {
				translate: function(a) {
					return "translate(" + a[0] + "px, " + a[1] + "px) "
				},
				scale: function(a) {
					return "scale(" + a + ") "
				}
			},
			p = function(a, c, d) {
				var e = b.data(a, "isoTransform") || {},
					f = {},
					g, h = {},
					j;
				f[c] = d, b.extend(e, f);
				for (g in e) j = e[g], h[g] = o[g](j);
				var k = h.translate || "",
					l = h.scale || "",
					m = k + l;
				b.data(a, "isoTransform", e), a.style[i] = m
			};
		b.cssNumber.scale = !0, b.cssHooks.scale = {
			set: function(a, b) {
				p(a, "scale", b)
			},
			get: function(a, c) {
				var d = b.data(a, "isoTransform");
				return d && d.scale ? d.scale : 1
			}
		}, b.fx.step.scale = function(a) {
			b.cssHooks.scale.set(a.elem, a.now + a.unit)
		}, b.cssNumber.translate = !0, b.cssHooks.translate = {
			set: function(a, b) {
				p(a, "translate", b)
			},
			get: function(a, c) {
				var d = b.data(a, "isoTransform");
				return d && d.translate ? d.translate : [0, 0]
			}
		}
	}
	var q, r;
	e.csstransitions && (q = {
		WebkitTransitionProperty: "webkitTransitionEnd",
		MozTransitionProperty: "transitionend",
		OTransitionProperty: "oTransitionEnd",
		transitionProperty: "transitionEnd"
	}[j], r = h("transitionDuration"));
	var s = b.event,
		t;
	s.special.smartresize = {
		setup: function() {
			b(this).bind("resize", s.special.smartresize.handler)
		},
		teardown: function() {
			b(this).unbind("resize", s.special.smartresize.handler)
		},
		handler: function(a, b) {
			var c = this,
				d = arguments;
			a.type = "smartresize", t && clearTimeout(t), t = setTimeout(function() {
				jQuery.event.handle.apply(c, d)
			}, b === "execAsap" ? 0 : 100)
		}
	}, b.fn.smartresize = function(a) {
		return a ? this.bind("smartresize", a) : this.trigger("smartresize", ["execAsap"])
	}, b.Isotope = function(a, c, d) {
		this.element = b(c), this._create(a), this._init(d)
	};
	var u = ["width", "height"],
		v = b(a);
	b.Isotope.settings = {
		resizable: !0,
		layoutMode: "masonry",
		containerClass: "isotope",
		itemClass: "isotope-item",
		hiddenClass: "isotope-hidden",
		hiddenStyle: {
			opacity: 0,
			scale: .001
		},
		visibleStyle: {
			opacity: 1,
			scale: 1
		},
		containerStyle: {
			position: "relative",
			overflow: "hidden"
		},
		animationEngine: "best-available",
		animationOptions: {
			queue: !1,
			duration: 800
		},
		sortBy: "original-order",
		sortAscending: !0,
		resizesContainer: !0,
		transformsEnabled: !b.browser.opera,
		itemPositionDataEnabled: !1
	}, b.Isotope.prototype = {
		_create: function(a) {
			this.options = b.extend({}, b.Isotope.settings, a), this.styleQueue = [], this.elemCount = 0;
			var c = this.element[0].style;
			this.originalStyle = {};
			var d = u.slice(0);
			for (var e in this.options.containerStyle) d.push(e);
			for (var f = 0, g = d.length; f < g; f++) e = d[f], this.originalStyle[e] = c[e] || "";
			this.element.css(this.options.containerStyle), this._updateAnimationEngine(), this._updateUsingTransforms();
			var h = {
				"original-order": function(a, b) {
					return b.elemCount++, b.elemCount
				},
				random: function() {
					return Math.random()
				}
			};
			this.options.getSortData = b.extend(this.options.getSortData, h), this.reloadItems(), this.offset = {
				left: parseInt(this.element.css("padding-left") || 0, 10),
				top: parseInt(this.element.css("padding-top") || 0, 10)
			};
			var i = this;
			setTimeout(function() {
				i.element.addClass(i.options.containerClass)
			}, 0), this.options.resizable && v.bind("smartresize.isotope", function() {
				i.resize()
			}), this.element.delegate("." + this.options.hiddenClass, "click", function() {
				return !1
			})
		},
		_getAtoms: function(a) {
			var b = this.options.itemSelector,
				c = b ? a.filter(b).add(a.find(b)) : a,
				d = {
					position: "absolute"
				};
			return this.usingTransforms && (d.left = 0, d.top = 0), c.css(d).addClass(this.options.itemClass), this.updateSortData(c, !0), c
		},
		_init: function(a) {
			this.$filteredAtoms = this._filter(this.$allAtoms), this._sort(), this.reLayout(a)
		},
		option: function(a) {
			if (b.isPlainObject(a)) {
				this.options = b.extend(!0, this.options, a);
				var c;
				for (var d in a) c = "_update" + f(d), this[c] && this[c]()
			}
		},
		_updateAnimationEngine: function() {
			var a = this.options.animationEngine.toLowerCase().replace(/[ _\-]/g, ""),
				b;
			switch (a) {
				case "css":
				case "none":
					b = !1;
					break;
				case "jquery":
					b = !0;
					break;
				default:
					b = !e.csstransitions
			}
			this.isUsingJQueryAnimation = b, this._updateUsingTransforms()
		},
		_updateTransformsEnabled: function() {
			this._updateUsingTransforms()
		},
		_updateUsingTransforms: function() {
			var a = this.usingTransforms = this.options.transformsEnabled && e.csstransforms && e.csstransitions && !this.isUsingJQueryAnimation;
			a || (delete this.options.hiddenStyle.scale, delete this.options.visibleStyle.scale), this.getPositionStyles = a ? this._translate : this._positionAbs
		},
		_filter: function(a) {
			var b = this.options.filter === "" ? "*" : this.options.filter;
			if (!b) return a;
			var c = this.options.hiddenClass,
				d = "." + c,
				e = a.filter(d),
				f = e;
			if (b !== "*") {
				f = e.filter(b);
				var g = a.not(d).not(b).addClass(c);
				this.styleQueue.push({
					$el: g,
					style: this.options.hiddenStyle
				})
			}
			return this.styleQueue.push({
				$el: f,
				style: this.options.visibleStyle
			}), f.removeClass(c), a.filter(b)
		},
		updateSortData: function(a, c) {
			var d = this,
				e = this.options.getSortData,
				f, g;
			a.each(function() {
				f = b(this), g = {};
				for (var a in e) !c && a === "original-order" ? g[a] = b.data(this, "isotope-sort-data")[a] : g[a] = e[a](f, d);
				b.data(this, "isotope-sort-data", g)
			})
		},
		_sort: function() {
			var a = this.options.sortBy,
				b = this._getSorter,
				c = this.options.sortAscending ? 1 : -1,
				d = function(d, e) {
					var f = b(d, a),
						g = b(e, a);
					return f === g && a !== "original-order" && (f = b(d, "original-order"), g = b(e, "original-order")), (f > g ? 1 : f < g ? -1 : 0) * c
				};
			this.$filteredAtoms.sort(d)
		},
		_getSorter: function(a, c) {
			return b.data(a, "isotope-sort-data")[c]
		},
		_translate: function(a, b) {
			return {
				translate: [a, b]
			}
		},
		_positionAbs: function(a, b) {
			return {
				left: a,
				top: b
			}
		},
		_pushPosition: function(a, b, c) {
			b = Math.round(b + this.offset.left), c = Math.round(c + this.offset.top);
			var d = this.getPositionStyles(b, c);
			this.styleQueue.push({
				$el: a,
				style: d
			}), this.options.itemPositionDataEnabled && a.data("isotope-item-position", {
				x: b,
				y: c
			})
		},
		layout: function(a, b) {
			var c = this.options.layoutMode;
			this["_" + c + "Layout"](a);
			if (this.options.resizesContainer) {
				var d = this["_" + c + "GetContainerSize"]();
				this.styleQueue.push({
					$el: this.element,
					style: d
				})
			}
			this._processStyleQueue(a, b), this.isLaidOut = !0
		},
		_processStyleQueue: function(a, c) {
			var d = this.isLaidOut ? this.isUsingJQueryAnimation ? "animate" : "css" : "css",
				f = this.options.animationOptions,
				g = this.options.onLayout,
				h, i, j, k;
			i = function(a, b) {
				b.$el[d](b.style, f)
			};
			if (this._isInserting && this.isUsingJQueryAnimation) i = function(a, b) {
				h = b.$el.hasClass("no-transition") ? "css" : d, b.$el[h](b.style, f)
			};
			else if (c || g || f.complete) {
				var l = !1,
					m = [c, g, f.complete],
					n = this;
				j = !0, k = function() {
					if (l) return;
					var b;
					for (var c = 0, d = m.length; c < d; c++) b = m[c], typeof b == "function" && b.call(n.element, a, n);
					l = !0
				};
				if (this.isUsingJQueryAnimation && d === "animate") f.complete = k, j = !1;
				else if (e.csstransitions) {
					var o = 0,
						p = this.styleQueue[0],
						s = p && p.$el,
						t;
					while (!s || !s.length) {
						t = this.styleQueue[o++];
						if (!t) return;
						s = t.$el
					}
					var u = parseFloat(getComputedStyle(s[0])[r]);
					u > 0 && (i = function(a, b) {
						b.$el[d](b.style, f).one(q, k)
					}, j = !1)
				}
			}
			b.each(this.styleQueue, i), j && k(), this.styleQueue = []
		},
		resize: function() {
			this["_" + this.options.layoutMode + "ResizeChanged"]() && this.reLayout()
		},
		reLayout: function(a) {
			this["_" + this.options.layoutMode + "Reset"](), this.layout(this.$filteredAtoms, a)
		},
		addItems: function(a, b) {
			var c = this._getAtoms(a);
			this.$allAtoms = this.$allAtoms.add(c), b && b(c)
		},
		insert: function(a, b) {
			this.element.append(a);
			var c = this;
			this.addItems(a, function(a) {
				var d = c._filter(a);
				c._addHideAppended(d), c._sort(), c.reLayout(), c._revealAppended(d, b)
			})
		},
		appended: function(a, b) {
			var c = this;
			this.addItems(a, function(a) {
				c._addHideAppended(a), c.layout(a), c._revealAppended(a, b)
			})
		},
		_addHideAppended: function(a) {
			this.$filteredAtoms = this.$filteredAtoms.add(a), a.addClass("no-transition"), this._isInserting = !0, this.styleQueue.push({
				$el: a,
				style: this.options.hiddenStyle
			})
		},
		_revealAppended: function(a, b) {
			var c = this;
			setTimeout(function() {
				a.removeClass("no-transition"), c.styleQueue.push({
					$el: a,
					style: c.options.visibleStyle
				}), c._isInserting = !1, c._processStyleQueue(a, b)
			}, 10)
		},
		reloadItems: function() {
			this.$allAtoms = this._getAtoms(this.element.children())
		},
		remove: function(a, b) {
			var c = this,
				d = function() {
					c.$allAtoms = c.$allAtoms.not(a), a.remove(), b && b.call(c.element)
				};
			a.filter(":not(." + this.options.hiddenClass + ")").length ? (this.styleQueue.push({
				$el: a,
				style: this.options.hiddenStyle
			}), this.$filteredAtoms = this.$filteredAtoms.not(a), this._sort(), this.reLayout(d)) : d()
		},
		shuffle: function(a) {
			this.updateSortData(this.$allAtoms), this.options.sortBy = "random", this._sort(), this.reLayout(a)
		},
		destroy: function() {
			var a = this.usingTransforms,
				b = this.options;
			this.$allAtoms.removeClass(b.hiddenClass + " " + b.itemClass).each(function() {
				var b = this.style;
				b.position = "", b.top = "", b.left = "", b.opacity = "", a && (b[i] = "")
			});
			var c = this.element[0].style;
			for (var d in this.originalStyle) c[d] = this.originalStyle[d];
			this.element.unbind(".isotope").undelegate("." + b.hiddenClass, "click").removeClass(b.containerClass).removeData("isotope"), v.unbind(".isotope")
		},
		_getSegments: function(a) {
			var b = this.options.layoutMode,
				c = a ? "rowHeight" : "columnWidth",
				d = a ? "height" : "width",
				e = a ? "rows" : "cols",
				g = this.element[d](),
				h, i = this.options[b] && this.options[b][c] || this.$filteredAtoms["outer" + f(d)](!0) || g;
			h = Math.floor(g / i), h = Math.max(h, 1), this[b][e] = h, this[b][c] = i
		},
		_checkIfSegmentsChanged: function(a) {
			var b = this.options.layoutMode,
				c = a ? "rows" : "cols",
				d = this[b][c];
			return this._getSegments(a), this[b][c] !== d
		},
		_masonryReset: function() {
			this.masonry = {}, this._getSegments();
			var a = this.masonry.cols;
			this.masonry.colYs = [];
			while (a--) this.masonry.colYs.push(0)
		},
		_masonryLayout: function(a) {
			var c = this,
				d = c.masonry;
			a.each(function() {
				var a = b(this),
					e = Math.ceil(a.outerWidth(!0) / d.columnWidth);
				e = Math.min(e, d.cols);
				if (e === 1) c._masonryPlaceBrick(a, d.colYs);
				else {
					var f = d.cols + 1 - e,
						g = [],
						h, i;
					for (i = 0; i < f; i++) h = d.colYs.slice(i, i + e), g[i] = Math.max.apply(Math, h);
					c._masonryPlaceBrick(a, g)
				}
			})
		},
		_masonryPlaceBrick: function(a, b) {
			var c = Math.min.apply(Math, b),
				d = 0;
			for (var e = 0, f = b.length; e < f; e++)
				if (b[e] === c) {
					d = e;
					break
				}
			var g = this.masonry.columnWidth * d,
				h = c;
			this._pushPosition(a, g, h);
			var i = c + a.outerHeight(!0),
				j = this.masonry.cols + 1 - f;
			for (e = 0; e < j; e++) this.masonry.colYs[d + e] = i
		},
		_masonryGetContainerSize: function() {
			var a = Math.max.apply(Math, this.masonry.colYs);
			return {
				height: a
			}
		},
		_masonryResizeChanged: function() {
			return this._checkIfSegmentsChanged()
		},
		_fitRowsReset: function() {
			this.fitRows = {
				x: 0,
				y: 0,
				height: 0
			}
		},
		_fitRowsLayout: function(a) {
			var c = this,
				d = this.element.width(),
				e = this.fitRows;
			a.each(function() {
				var a = b(this),
					f = a.outerWidth(!0),
					g = a.outerHeight(!0);
				e.x !== 0 && f + e.x > d && (e.x = 0, e.y = e.height), c._pushPosition(a, e.x, e.y), e.height = Math.max(e.y + g, e.height), e.x += f
			})
		},
		_fitRowsGetContainerSize: function() {
			return {
				height: this.fitRows.height
			}
		},
		_fitRowsResizeChanged: function() {
			return !0
		},
		_cellsByRowReset: function() {
			this.cellsByRow = {
				index: 0
			}, this._getSegments(), this._getSegments(!0)
		},
		_cellsByRowLayout: function(a) {
			var c = this,
				d = this.cellsByRow;
			a.each(function() {
				var a = b(this),
					e = d.index % d.cols,
					f = Math.floor(d.index / d.cols),
					g = (e + .5) * d.columnWidth - a.outerWidth(!0) / 2,
					h = (f + .5) * d.rowHeight - a.outerHeight(!0) / 2;
				c._pushPosition(a, g, h), d.index++
			})
		},
		_cellsByRowGetContainerSize: function() {
			return {
				height: Math.ceil(this.$filteredAtoms.length / this.cellsByRow.cols) * this.cellsByRow.rowHeight + this.offset.top
			}
		},
		_cellsByRowResizeChanged: function() {
			return this._checkIfSegmentsChanged()
		},
		_straightDownReset: function() {
			this.straightDown = {
				y: 0
			}
		},
		_straightDownLayout: function(a) {
			var c = this;
			a.each(function(a) {
				var d = b(this);
				c._pushPosition(d, 0, c.straightDown.y), c.straightDown.y += d.outerHeight(!0)
			})
		},
		_straightDownGetContainerSize: function() {
			return {
				height: this.straightDown.y
			}
		},
		_straightDownResizeChanged: function() {
			return !0
		},
		_masonryHorizontalReset: function() {
			this.masonryHorizontal = {}, this._getSegments(!0);
			var a = this.masonryHorizontal.rows;
			this.masonryHorizontal.rowXs = [];
			while (a--) this.masonryHorizontal.rowXs.push(0)
		},
		_masonryHorizontalLayout: function(a) {
			var c = this,
				d = c.masonryHorizontal;
			a.each(function() {
				var a = b(this),
					e = Math.ceil(a.outerHeight(!0) / d.rowHeight);
				e = Math.min(e, d.rows);
				if (e === 1) c._masonryHorizontalPlaceBrick(a, d.rowXs);
				else {
					var f = d.rows + 1 - e,
						g = [],
						h, i;
					for (i = 0; i < f; i++) h = d.rowXs.slice(i, i + e), g[i] = Math.max.apply(Math, h);
					c._masonryHorizontalPlaceBrick(a, g)
				}
			})
		},
		_masonryHorizontalPlaceBrick: function(a, b) {
			var c = Math.min.apply(Math, b),
				d = 0;
			for (var e = 0, f = b.length; e < f; e++)
				if (b[e] === c) {
					d = e;
					break
				}
			var g = c,
				h = this.masonryHorizontal.rowHeight * d;
			this._pushPosition(a, g, h);
			var i = c + a.outerWidth(!0),
				j = this.masonryHorizontal.rows + 1 - f;
			for (e = 0; e < j; e++) this.masonryHorizontal.rowXs[d + e] = i
		},
		_masonryHorizontalGetContainerSize: function() {
			var a = Math.max.apply(Math, this.masonryHorizontal.rowXs);
			return {
				width: a
			}
		},
		_masonryHorizontalResizeChanged: function() {
			return this._checkIfSegmentsChanged(!0)
		},
		_fitColumnsReset: function() {
			this.fitColumns = {
				x: 0,
				y: 0,
				width: 0
			}
		},
		_fitColumnsLayout: function(a) {
			var c = this,
				d = this.element.height(),
				e = this.fitColumns;
			a.each(function() {
				var a = b(this),
					f = a.outerWidth(!0),
					g = a.outerHeight(!0);
				e.y !== 0 && g + e.y > d && (e.x = e.width, e.y = 0), c._pushPosition(a, e.x, e.y), e.width = Math.max(e.x + f, e.width), e.y += g
			})
		},
		_fitColumnsGetContainerSize: function() {
			return {
				width: this.fitColumns.width
			}
		},
		_fitColumnsResizeChanged: function() {
			return !0
		},
		_cellsByColumnReset: function() {
			this.cellsByColumn = {
				index: 0
			}, this._getSegments(), this._getSegments(!0)
		},
		_cellsByColumnLayout: function(a) {
			var c = this,
				d = this.cellsByColumn;
			a.each(function() {
				var a = b(this),
					e = Math.floor(d.index / d.rows),
					f = d.index % d.rows,
					g = (e + .5) * d.columnWidth - a.outerWidth(!0) / 2,
					h = (f + .5) * d.rowHeight - a.outerHeight(!0) / 2;
				c._pushPosition(a, g, h), d.index++
			})
		},
		_cellsByColumnGetContainerSize: function() {
			return {
				width: Math.ceil(this.$filteredAtoms.length / this.cellsByColumn.rows) * this.cellsByColumn.columnWidth
			}
		},
		_cellsByColumnResizeChanged: function() {
			return this._checkIfSegmentsChanged(!0)
		},
		_straightAcrossReset: function() {
			this.straightAcross = {
				x: 0
			}
		},
		_straightAcrossLayout: function(a) {
			var c = this;
			a.each(function(a) {
				var d = b(this);
				c._pushPosition(d, c.straightAcross.x, 0), c.straightAcross.x += d.outerWidth(!0)
			})
		},
		_straightAcrossGetContainerSize: function() {
			return {
				width: this.straightAcross.x
			}
		},
		_straightAcrossResizeChanged: function() {
			return !0
		}
	}, b.fn.imagesLoaded = function(a) {
		function h() {
			a.call(c, d)
		}

		function i(a) {
			var c = a.target;
			c.src !== f && b.inArray(c, g) === -1 && (g.push(c), --e <= 0 && (setTimeout(h), d.unbind(".imagesLoaded", i)))
		}
		var c = this,
			d = c.find("img").add(c.filter("img")),
			e = d.length,
			f = "data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==",
			g = [];
		return e || h(), d.bind("load.imagesLoaded error.imagesLoaded", i).each(function() {
			var a = this.src;
			this.src = f, this.src = a
		}), c
	};
	var w = function(b) {
		a.console && a.console.error(b)
	};
	b.fn.isotope = function(a, c) {
		if (typeof a == "string") {
			var d = Array.prototype.slice.call(arguments, 1);
			this.each(function() {
				var c = b.data(this, "isotope");
				if (!c) {
					w("cannot call methods on isotope prior to initialization; attempted to call method '" + a + "'");
					return
				}
				if (!b.isFunction(c[a]) || a.charAt(0) === "_") {
					w("no such method '" + a + "' for isotope instance");
					return
				}
				c[a].apply(c, d)
			})
		} else this.each(function() {
			var d = b.data(this, "isotope");
			d ? (d.option(a), d._init(c)) : b.data(this, "isotope", new b.Isotope(a, this, c))
		});
		return this
	}
})(window, jQuery);;
(function(e) {
	e.flexslider = function(t, n) {
		var r = e(t);
		r.vars = e.extend({}, e.flexslider.defaults, n);
		var i = r.vars.namespace,
			s = window.navigator && window.navigator.msPointerEnabled && window.MSGesture,
			o = ("ontouchstart" in window || s || window.DocumentTouch && document instanceof DocumentTouch) && r.vars.touch,
			u = "click touchend MSPointerUp",
			a = "",
			f, l = r.vars.direction === "vertical",
			c = r.vars.reverse,
			h = r.vars.itemWidth > 0,
			p = r.vars.animation === "fade",
			d = r.vars.asNavFor !== "",
			v = {},
			m = !0;
		e.data(t, "flexslider", r);
		v = {
			init: function() {
				r.animating = !1;
				r.currentSlide = parseInt(r.vars.startAt ? r.vars.startAt : 0);
				isNaN(r.currentSlide) && (r.currentSlide = 0);
				r.animatingTo = r.currentSlide;
				r.atEnd = r.currentSlide === 0 || r.currentSlide === r.last;
				r.containerSelector = r.vars.selector.substr(0, r.vars.selector.search(" "));
				r.slides = e(r.vars.selector, r);
				r.container = e(r.containerSelector, r);
				r.count = r.slides.length;
				r.syncExists = e(r.vars.sync).length > 0;
				r.vars.animation === "slide" && (r.vars.animation = "swing");
				r.prop = l ? "top" : "marginLeft";
				r.args = {};
				r.manualPause = !1;
				r.stopped = !1;
				r.started = !1;
				r.startTimeout = null;
				r.transitions = !r.vars.video && !p && r.vars.useCSS && function() {
					var e = document.createElement("div"),
						t = ["perspectiveProperty", "WebkitPerspective", "MozPerspective", "OPerspective", "msPerspective"];
					for (var n in t)
						if (e.style[t[n]] !== undefined) {
							r.pfx = t[n].replace("Perspective", "").toLowerCase();
							r.prop = "-" + r.pfx + "-transform";
							return !0
						}
					return !1
				}();
				r.vars.controlsContainer !== "" && (r.controlsContainer = e(r.vars.controlsContainer).length > 0 && e(r.vars.controlsContainer));
				r.vars.manualControls !== "" && (r.manualControls = e(r.vars.manualControls).length > 0 && e(r.vars.manualControls));
				if (r.vars.randomize) {
					r.slides.sort(function() {
						return Math.round(Math.random()) - .5
					});
					r.container.empty().append(r.slides)
				}
				r.doMath();
				r.setup("init");
				r.vars.controlNav && v.controlNav.setup();
				r.vars.directionNav && v.directionNav.setup();
				r.vars.keyboard && (e(r.containerSelector).length === 1 || r.vars.multipleKeyboard) && e(document).bind("keyup", function(e) {
					var t = e.keyCode;
					if (!r.animating && (t === 39 || t === 37)) {
						var n = t === 39 ? r.getTarget("next") : t === 37 ? r.getTarget("prev") : !1;
						r.flexAnimate(n, r.vars.pauseOnAction)
					}
				});
				r.vars.mousewheel && r.bind("mousewheel", function(e, t, n, i) {
					e.preventDefault();
					var s = t < 0 ? r.getTarget("next") : r.getTarget("prev");
					r.flexAnimate(s, r.vars.pauseOnAction)
				});
				r.vars.pausePlay && v.pausePlay.setup();
				r.vars.slideshow && r.vars.pauseInvisible && v.pauseInvisible.init();
				if (r.vars.slideshow) {
					r.vars.pauseOnHover && r.hover(function() {
						!r.manualPlay && !r.manualPause && r.pause()
					}, function() {
						!r.manualPause && !r.manualPlay && !r.stopped && r.play()
					});
					if (!r.vars.pauseInvisible || !v.pauseInvisible.isHidden()) r.vars.initDelay > 0 ? r.startTimeout = setTimeout(r.play, r.vars.initDelay) : r.play()
				}
				d && v.asNav.setup();
				o && r.vars.touch && v.touch();
				(!p || p && r.vars.smoothHeight) && e(window).bind("resize orientationchange focus", v.resize);
				r.find("img").attr("draggable", "false");
				setTimeout(function() {
					r.vars.start(r)
				}, 200)
			},
			asNav: {
				setup: function() {
					r.asNav = !0;
					r.animatingTo = Math.floor(r.currentSlide / r.move);
					r.currentItem = r.currentSlide;
					r.slides.removeClass(i + "active-slide").eq(r.currentItem).addClass(i + "active-slide");
					if (!s) r.slides.click(function(t) {
						t.preventDefault();
						var n = e(this),
							s = n.index(),
							o = n.offset().left - e(r).scrollLeft();
						if (o <= 0 && n.hasClass(i + "active-slide")) r.flexAnimate(r.getTarget("prev"), !0);
						else if (!e(r.vars.asNavFor).data("flexslider").animating && !n.hasClass(i + "active-slide")) {
							r.direction = r.currentItem < s ? "next" : "prev";
							r.flexAnimate(s, r.vars.pauseOnAction, !1, !0, !0)
						}
					});
					else {
						t._slider = r;
						r.slides.each(function() {
							var t = this;
							t._gesture = new MSGesture;
							t._gesture.target = t;
							t.addEventListener("MSPointerDown", function(e) {
								e.preventDefault();
								e.currentTarget._gesture && e.currentTarget._gesture.addPointer(e.pointerId)
							}, !1);
							t.addEventListener("MSGestureTap", function(t) {
								t.preventDefault();
								var n = e(this),
									i = n.index();
								if (!e(r.vars.asNavFor).data("flexslider").animating && !n.hasClass("active")) {
									r.direction = r.currentItem < i ? "next" : "prev";
									r.flexAnimate(i, r.vars.pauseOnAction, !1, !0, !0)
								}
							})
						})
					}
				}
			},
			controlNav: {
				setup: function() {
					r.manualControls ? v.controlNav.setupManual() : v.controlNav.setupPaging()
				},
				setupPaging: function() {
					var t = r.vars.controlNav === "thumbnails" ? "control-thumbs" : "control-paging",
						n = 1,
						s, o;
					r.controlNavScaffold = e('<ol class="' + i + "control-nav " + i + t + '"></ol>');
					if (r.pagingCount > 1)
						for (var f = 0; f < r.pagingCount; f++) {
							o = r.slides.eq(f);
							s = r.vars.controlNav === "thumbnails" ? '<img src="' + o.attr("data-thumb") + '"/>' : "<a>" + n + "</a>";
							if ("thumbnails" === r.vars.controlNav && !0 === r.vars.thumbCaptions) {
								var l = o.attr("data-thumbcaption");
								"" != l && undefined != l && (s += '<span class="' + i + 'caption">' + l + "</span>")
							}
							r.controlNavScaffold.append("<li>" + s + "</li>");
							n++
						}
					r.controlsContainer ? e(r.controlsContainer).append(r.controlNavScaffold) : r.append(r.controlNavScaffold);
					v.controlNav.set();
					v.controlNav.active();
					r.controlNavScaffold.delegate("a, img", u, function(t) {
						t.preventDefault();
						if (a === "" || a === t.type) {
							var n = e(this),
								s = r.controlNav.index(n);
							if (!n.hasClass(i + "active")) {
								r.direction = s > r.currentSlide ? "next" : "prev";
								r.flexAnimate(s, r.vars.pauseOnAction)
							}
						}
						a === "" && (a = t.type);
						v.setToClearWatchedEvent()
					})
				},
				setupManual: function() {
					r.controlNav = r.manualControls;
					v.controlNav.active();
					r.controlNav.bind(u, function(t) {
						t.preventDefault();
						if (a === "" || a === t.type) {
							var n = e(this),
								s = r.controlNav.index(n);
							if (!n.hasClass(i + "active")) {
								s > r.currentSlide ? r.direction = "next" : r.direction = "prev";
								r.flexAnimate(s, r.vars.pauseOnAction)
							}
						}
						a === "" && (a = t.type);
						v.setToClearWatchedEvent()
					})
				},
				set: function() {
					var t = r.vars.controlNav === "thumbnails" ? "img" : "a";
					r.controlNav = e("." + i + "control-nav li " + t, r.controlsContainer ? r.controlsContainer : r)
				},
				active: function() {
					r.controlNav.removeClass(i + "active").eq(r.animatingTo).addClass(i + "active")
				},
				update: function(t, n) {
					r.pagingCount > 1 && t === "add" ? r.controlNavScaffold.append(e("<li><a>" + r.count + "</a></li>")) : r.pagingCount === 1 ? r.controlNavScaffold.find("li").remove() : r.controlNav.eq(n).closest("li").remove();
					v.controlNav.set();
					r.pagingCount > 1 && r.pagingCount !== r.controlNav.length ? r.update(n, t) : v.controlNav.active()
				}
			},
			directionNav: {
				setup: function() {
					var t = e('<ul class="' + i + 'direction-nav"><li><a class="' + i + 'prev" href="#">' + r.vars.prevText + '</a></li><li><a class="' + i + 'next" href="#">' + r.vars.nextText + "</a></li></ul>");
					if (r.controlsContainer) {
						e(r.controlsContainer).append(t);
						r.directionNav = e("." + i + "direction-nav li a", r.controlsContainer)
					} else {
						r.append(t);
						r.directionNav = e("." + i + "direction-nav li a", r)
					}
					v.directionNav.update();
					r.directionNav.bind(u, function(t) {
						t.preventDefault();
						var n;
						if (a === "" || a === t.type) {
							n = e(this).hasClass(i + "next") ? r.getTarget("next") : r.getTarget("prev");
							r.flexAnimate(n, r.vars.pauseOnAction)
						}
						a === "" && (a = t.type);
						v.setToClearWatchedEvent()
					})
				},
				update: function() {
					var e = i + "disabled";
					r.pagingCount === 1 ? r.directionNav.addClass(e).attr("tabindex", "-1") : r.vars.animationLoop ? r.directionNav.removeClass(e).removeAttr("tabindex") : r.animatingTo === 0 ? r.directionNav.removeClass(e).filter("." + i + "prev").addClass(e).attr("tabindex", "-1") : r.animatingTo === r.last ? r.directionNav.removeClass(e).filter("." + i + "next").addClass(e).attr("tabindex", "-1") : r.directionNav.removeClass(e).removeAttr("tabindex")
				}
			},
			pausePlay: {
				setup: function() {
					var t = e('<div class="' + i + 'pauseplay"><a></a></div>');
					if (r.controlsContainer) {
						r.controlsContainer.append(t);
						r.pausePlay = e("." + i + "pauseplay a", r.controlsContainer)
					} else {
						r.append(t);
						r.pausePlay = e("." + i + "pauseplay a", r)
					}
					v.pausePlay.update(r.vars.slideshow ? i + "pause" : i + "play");
					r.pausePlay.bind(u, function(t) {
						t.preventDefault();
						if (a === "" || a === t.type)
							if (e(this).hasClass(i + "pause")) {
								r.manualPause = !0;
								r.manualPlay = !1;
								r.pause()
							} else {
								r.manualPause = !1;
								r.manualPlay = !0;
								r.play()
							}
						a === "" && (a = t.type);
						v.setToClearWatchedEvent()
					})
				},
				update: function(e) {
					e === "play" ? r.pausePlay.removeClass(i + "pause").addClass(i + "play").html(r.vars.playText) : r.pausePlay.removeClass(i + "play").addClass(i + "pause").html(r.vars.pauseText)
				}
			},
			touch: function() {
				var e, n, i, o, u, a, f = !1,
					d = 0,
					v = 0,
					m = 0;
				if (!s) {
					t.addEventListener("touchstart", g, !1);

					function g(s) {
						if (r.animating) s.preventDefault();
						else if (window.navigator.msPointerEnabled || s.touches.length === 1) {
							r.pause();
							o = l ? r.h : r.w;
							a = Number(new Date);
							d = s.touches[0].pageX;
							v = s.touches[0].pageY;
							i = h && c && r.animatingTo === r.last ? 0 : h && c ? r.limit - (r.itemW + r.vars.itemMargin) * r.move * r.animatingTo : h && r.currentSlide === r.last ? r.limit : h ? (r.itemW + r.vars.itemMargin) * r.move * r.currentSlide : c ? (r.last - r.currentSlide + r.cloneOffset) * o : (r.currentSlide + r.cloneOffset) * o;
							e = l ? v : d;
							n = l ? d : v;
							t.addEventListener("touchmove", y, !1);
							t.addEventListener("touchend", b, !1)
						}
					}

					function y(t) {
						d = t.touches[0].pageX;
						v = t.touches[0].pageY;
						u = l ? e - v : e - d;
						f = l ? Math.abs(u) < Math.abs(d - n) : Math.abs(u) < Math.abs(v - n);
						var s = 500;
						if (!f || Number(new Date) - a > s) {
							t.preventDefault();
							if (!p && r.transitions) {
								r.vars.animationLoop || (u /= r.currentSlide === 0 && u < 0 || r.currentSlide === r.last && u > 0 ? Math.abs(u) / o + 2 : 1);
								r.setProps(i + u, "setTouch")
							}
						}
					}

					function b(s) {
						t.removeEventListener("touchmove", y, !1);
						if (r.animatingTo === r.currentSlide && !f && u !== null) {
							var l = c ? -u : u,
								h = l > 0 ? r.getTarget("next") : r.getTarget("prev");
							r.canAdvance(h) && (Number(new Date) - a < 550 && Math.abs(l) > 50 || Math.abs(l) > o / 2) ? r.flexAnimate(h, r.vars.pauseOnAction) : p || r.flexAnimate(r.currentSlide, r.vars.pauseOnAction, !0)
						}
						t.removeEventListener("touchend", b, !1);
						e = null;
						n = null;
						u = null;
						i = null
					}
				} else {
					t.style.msTouchAction = "none";
					t._gesture = new MSGesture;
					t._gesture.target = t;
					t.addEventListener("MSPointerDown", w, !1);
					t._slider = r;
					t.addEventListener("MSGestureChange", E, !1);
					t.addEventListener("MSGestureEnd", S, !1);

					function w(e) {
						e.stopPropagation();
						if (r.animating) e.preventDefault();
						else {
							r.pause();
							t._gesture.addPointer(e.pointerId);
							m = 0;
							o = l ? r.h : r.w;
							a = Number(new Date);
							i = h && c && r.animatingTo === r.last ? 0 : h && c ? r.limit - (r.itemW + r.vars.itemMargin) * r.move * r.animatingTo : h && r.currentSlide === r.last ? r.limit : h ? (r.itemW + r.vars.itemMargin) * r.move * r.currentSlide : c ? (r.last - r.currentSlide + r.cloneOffset) * o : (r.currentSlide + r.cloneOffset) * o
						}
					}

					function E(e) {
						e.stopPropagation();
						var n = e.target._slider;
						if (!n) return;
						var r = -e.translationX,
							s = -e.translationY;
						m += l ? s : r;
						u = m;
						f = l ? Math.abs(m) < Math.abs(-r) : Math.abs(m) < Math.abs(-s);
						if (e.detail === e.MSGESTURE_FLAG_INERTIA) {
							setImmediate(function() {
								t._gesture.stop()
							});
							return
						}
						if (!f || Number(new Date) - a > 500) {
							e.preventDefault();
							if (!p && n.transitions) {
								n.vars.animationLoop || (u = m / (n.currentSlide === 0 && m < 0 || n.currentSlide === n.last && m > 0 ? Math.abs(m) / o + 2 : 1));
								n.setProps(i + u, "setTouch")
							}
						}
					}

					function S(t) {
						t.stopPropagation();
						var r = t.target._slider;
						if (!r) return;
						if (r.animatingTo === r.currentSlide && !f && u !== null) {
							var s = c ? -u : u,
								l = s > 0 ? r.getTarget("next") : r.getTarget("prev");
							r.canAdvance(l) && (Number(new Date) - a < 550 && Math.abs(s) > 50 || Math.abs(s) > o / 2) ? r.flexAnimate(l, r.vars.pauseOnAction) : p || r.flexAnimate(r.currentSlide, r.vars.pauseOnAction, !0)
						}
						e = null;
						n = null;
						u = null;
						i = null;
						m = 0
					}
				}
			},
			resize: function() {
				if (!r.animating && r.is(":visible")) {
					h || r.doMath();
					if (p) v.smoothHeight();
					else if (h) {
						r.slides.width(r.computedW);
						r.update(r.pagingCount);
						r.setProps()
					} else if (l) {
						r.viewport.height(r.h);
						r.setProps(r.h, "setTotal")
					} else {
						r.vars.smoothHeight && v.smoothHeight();
						r.newSlides.width(r.computedW);
						r.setProps(r.computedW, "setTotal")
					}
				}
			},
			smoothHeight: function(e) {
				if (!l || p) {
					var t = p ? r : r.viewport;
					e ? t.animate({
						height: r.slides.eq(r.animatingTo).height()
					}, e) : t.height(r.slides.eq(r.animatingTo).height())
				}
			},
			sync: function(t) {
				var n = e(r.vars.sync).data("flexslider"),
					i = r.animatingTo;
				switch (t) {
					case "animate":
						n.flexAnimate(i, r.vars.pauseOnAction, !1, !0);
						break;
					case "play":
						!n.playing && !n.asNav && n.play();
						break;
					case "pause":
						n.pause()
				}
			},
			pauseInvisible: {
				visProp: null,
				init: function() {
					var e = ["webkit", "moz", "ms", "o"];
					if ("hidden" in document) return "hidden";
					for (var t = 0; t < e.length; t++) e[t] + "Hidden" in document && (v.pauseInvisible.visProp = e[t] + "Hidden");
					if (v.pauseInvisible.visProp) {
						var n = v.pauseInvisible.visProp.replace(/[H|h]idden/, "") + "visibilitychange";
						document.addEventListener(n, function() {
							v.pauseInvisible.isHidden() ? r.startTimeout ? clearTimeout(r.startTimeout) : r.pause() : r.started ? r.play() : r.vars.initDelay > 0 ? setTimeout(r.play, r.vars.initDelay) : r.play()
						})
					}
				},
				isHidden: function() {
					return document[v.pauseInvisible.visProp] || !1
				}
			},
			setToClearWatchedEvent: function() {
				clearTimeout(f);
				f = setTimeout(function() {
					a = ""
				}, 3e3)
			}
		};
		r.flexAnimate = function(t, n, s, u, a) {
			!r.vars.animationLoop && t !== r.currentSlide && (r.direction = t > r.currentSlide ? "next" : "prev");
			d && r.pagingCount === 1 && (r.direction = r.currentItem < t ? "next" : "prev");
			if (!r.animating && (r.canAdvance(t, a) || s) && r.is(":visible")) {
				if (d && u) {
					var f = e(r.vars.asNavFor).data("flexslider");
					r.atEnd = t === 0 || t === r.count - 1;
					f.flexAnimate(t, !0, !1, !0, a);
					r.direction = r.currentItem < t ? "next" : "prev";
					f.direction = r.direction;
					if (Math.ceil((t + 1) / r.visible) - 1 === r.currentSlide || t === 0) {
						r.currentItem = t;
						r.slides.removeClass(i + "active-slide").eq(t).addClass(i + "active-slide");
						return !1
					}
					r.currentItem = t;
					r.slides.removeClass(i + "active-slide").eq(t).addClass(i + "active-slide");
					t = Math.floor(t / r.visible)
				}
				r.animating = !0;
				r.animatingTo = t;
				n && r.pause();
				r.vars.before(r);
				r.syncExists && !a && v.sync("animate");
				r.vars.controlNav && v.controlNav.active();
				h || r.slides.removeClass(i + "active-slide").eq(t).addClass(i + "active-slide");
				r.atEnd = t === 0 || t === r.last;
				r.vars.directionNav && v.directionNav.update();
				if (t === r.last) {
					r.vars.end(r);
					r.vars.animationLoop || r.pause()
				}
				if (!p) {
					var m = l ? r.slides.filter(":first").height() : r.computedW,
						g, y, b;
					if (h) {
						g = r.vars.itemMargin;
						b = (r.itemW + g) * r.move * r.animatingTo;
						y = b > r.limit && r.visible !== 1 ? r.limit : b
					} else r.currentSlide === 0 && t === r.count - 1 && r.vars.animationLoop && r.direction !== "next" ? y = c ? (r.count + r.cloneOffset) * m : 0 : r.currentSlide === r.last && t === 0 && r.vars.animationLoop && r.direction !== "prev" ? y = c ? 0 : (r.count + 1) * m : y = c ? (r.count - 1 - t + r.cloneOffset) * m : (t + r.cloneOffset) * m;
					r.setProps(y, "", r.vars.animationSpeed);
					if (r.transitions) {
						if (!r.vars.animationLoop || !r.atEnd) {
							r.animating = !1;
							r.currentSlide = r.animatingTo
						}
						r.container.unbind("webkitTransitionEnd transitionend");
						r.container.bind("webkitTransitionEnd transitionend", function() {
							r.wrapup(m)
						})
					} else r.container.animate(r.args, r.vars.animationSpeed, r.vars.easing, function() {
						r.wrapup(m)
					})
				} else if (!o) {
					r.slides.eq(r.currentSlide).css({
						zIndex: 1
					}).animate({
						opacity: 0
					}, r.vars.animationSpeed, r.vars.easing);
					r.slides.eq(t).css({
						zIndex: 2
					}).animate({
						opacity: 1
					}, r.vars.animationSpeed, r.vars.easing, r.wrapup)
				} else {
					r.slides.eq(r.currentSlide).css({
						opacity: 0,
						zIndex: 1
					});
					r.slides.eq(t).css({
						opacity: 1,
						zIndex: 2
					});
					r.wrapup(m)
				}
				r.vars.smoothHeight && v.smoothHeight(r.vars.animationSpeed)
			}
		};
		r.wrapup = function(e) {
			!p && !h && (r.currentSlide === 0 && r.animatingTo === r.last && r.vars.animationLoop ? r.setProps(e, "jumpEnd") : r.currentSlide === r.last && r.animatingTo === 0 && r.vars.animationLoop && r.setProps(e, "jumpStart"));
			r.animating = !1;
			r.currentSlide = r.animatingTo;
			r.vars.after(r)
		};
		r.animateSlides = function() {
			!r.animating && m && r.flexAnimate(r.getTarget("next"))
		};
		r.pause = function() {
			clearInterval(r.animatedSlides);
			r.animatedSlides = null;
			r.playing = !1;
			r.vars.pausePlay && v.pausePlay.update("play");
			r.syncExists && v.sync("pause")
		};
		r.play = function() {
			r.playing && clearInterval(r.animatedSlides);
			r.animatedSlides = r.animatedSlides || setInterval(r.animateSlides, r.vars.slideshowSpeed);
			r.started = r.playing = !0;
			r.vars.pausePlay && v.pausePlay.update("pause");
			r.syncExists && v.sync("play")
		};
		r.stop = function() {
			r.pause();
			r.stopped = !0
		};
		r.canAdvance = function(e, t) {
			var n = d ? r.pagingCount - 1 : r.last;
			return t ? !0 : d && r.currentItem === r.count - 1 && e === 0 && r.direction === "prev" ? !0 : d && r.currentItem === 0 && e === r.pagingCount - 1 && r.direction !== "next" ? !1 : e === r.currentSlide && !d ? !1 : r.vars.animationLoop ? !0 : r.atEnd && r.currentSlide === 0 && e === n && r.direction !== "next" ? !1 : r.atEnd && r.currentSlide === n && e === 0 && r.direction === "next" ? !1 : !0
		};
		r.getTarget = function(e) {
			r.direction = e;
			return e === "next" ? r.currentSlide === r.last ? 0 : r.currentSlide + 1 : r.currentSlide === 0 ? r.last : r.currentSlide - 1
		};
		r.setProps = function(e, t, n) {
			var i = function() {
				var n = e ? e : (r.itemW + r.vars.itemMargin) * r.move * r.animatingTo,
					i = function() {
						if (h) return t === "setTouch" ? e : c && r.animatingTo === r.last ? 0 : c ? r.limit - (r.itemW + r.vars.itemMargin) * r.move * r.animatingTo : r.animatingTo === r.last ? r.limit : n;
						switch (t) {
							case "setTotal":
								return c ? (r.count - 1 - r.currentSlide + r.cloneOffset) * e : (r.currentSlide + r.cloneOffset) * e;
							case "setTouch":
								return c ? e : e;
							case "jumpEnd":
								return c ? e : r.count * e;
							case "jumpStart":
								return c ? r.count * e : e;
							default:
								return e
						}
					}();
				return i * -1 + "px"
			}();
			if (r.transitions) {
				i = l ? "translate3d(0," + i + ",0)" : "translate3d(" + i + ",0,0)";
				n = n !== undefined ? n / 1e3 + "s" : "0s";
				r.container.css("-" + r.pfx + "-transition-duration", n)
			}
			r.args[r.prop] = i;
			(r.transitions || n === undefined) && r.container.css(r.args)
		};
		r.setup = function(t) {
			if (!p) {
				var n, s;
				if (t === "init") {
					r.viewport = e('<div class="' + i + 'viewport"></div>').css({
						overflow: "hidden",
						position: "relative"
					}).appendTo(r).append(r.container);
					r.cloneCount = 0;
					r.cloneOffset = 0;
					if (c) {
						s = e.makeArray(r.slides).reverse();
						r.slides = e(s);
						r.container.empty().append(r.slides)
					}
				}
				if (r.vars.animationLoop && !h) {
					r.cloneCount = 2;
					r.cloneOffset = 1;
					t !== "init" && r.container.find(".clone").remove();
					r.container.append(r.slides.first().clone().addClass("clone").attr("aria-hidden", "true")).prepend(r.slides.last().clone().addClass("clone").attr("aria-hidden", "true"))
				}
				r.newSlides = e(r.vars.selector, r);
				n = c ? r.count - 1 - r.currentSlide + r.cloneOffset : r.currentSlide + r.cloneOffset;
				if (l && !h) {
					r.container.height((r.count + r.cloneCount) * 200 + "%").css("position", "absolute").width("100%");
					setTimeout(function() {
						r.newSlides.css({
							display: "block"
						});
						r.doMath();
						r.viewport.height(r.h);
						r.setProps(n * r.h, "init")
					}, t === "init" ? 100 : 0)
				} else {
					r.container.width((r.count + r.cloneCount) * 200 + "%");
					r.setProps(n * r.computedW, "init");
					setTimeout(function() {
						r.doMath();
						r.newSlides.css({
							width: r.computedW,
							"float": "left",
							display: "block"
						});
						r.vars.smoothHeight && v.smoothHeight()
					}, t === "init" ? 100 : 0)
				}
			} else {
				r.slides.css({
					width: "100%",
					"float": "left",
					marginRight: "-100%",
					position: "relative"
				});
				t === "init" && (o ? r.slides.css({
					opacity: 0,
					display: "block",
					webkitTransition: "opacity " + r.vars.animationSpeed / 1e3 + "s ease",
					zIndex: 1
				}).eq(r.currentSlide).css({
					opacity: 1,
					zIndex: 2
				}) : r.slides.css({
					opacity: 0,
					display: "block",
					zIndex: 1
				}).eq(r.currentSlide).css({
					zIndex: 2
				}).animate({
					opacity: 1
				}, r.vars.animationSpeed, r.vars.easing));
				r.vars.smoothHeight && v.smoothHeight()
			}
			h || r.slides.removeClass(i + "active-slide").eq(r.currentSlide).addClass(i + "active-slide")
		};
		r.doMath = function() {
			var e = r.slides.first(),
				t = r.vars.itemMargin,
				n = r.vars.minItems,
				i = r.vars.maxItems;
			r.w = r.viewport === undefined ? r.width() : r.viewport.width();
			r.h = e.height();
			r.boxPadding = e.outerWidth() - e.width();
			if (h) {
				r.itemT = r.vars.itemWidth + t;
				r.minW = n ? n * r.itemT : r.w;
				r.maxW = i ? i * r.itemT - t : r.w;
				r.itemW = r.minW > r.w ? (r.w - t * (n - 1)) / n : r.maxW < r.w ? (r.w - t * (i - 1)) / i : r.vars.itemWidth > r.w ? r.w : r.vars.itemWidth;
				r.visible = Math.floor(r.w / r.itemW);
				r.move = r.vars.move > 0 && r.vars.move < r.visible ? r.vars.move : r.visible;
				r.pagingCount = Math.ceil((r.count - r.visible) / r.move + 1);
				r.last = r.pagingCount - 1;
				r.limit = r.pagingCount === 1 ? 0 : r.vars.itemWidth > r.w ? r.itemW * (r.count - 1) + t * (r.count - 1) : (r.itemW + t) * r.count - r.w - t
			} else {
				r.itemW = r.w;
				r.pagingCount = r.count;
				r.last = r.count - 1
			}
			r.computedW = r.itemW - r.boxPadding
		};
		r.update = function(e, t) {
			r.doMath();
			if (!h) {
				e < r.currentSlide ? r.currentSlide += 1 : e <= r.currentSlide && e !== 0 && (r.currentSlide -= 1);
				r.animatingTo = r.currentSlide
			}
			if (r.vars.controlNav && !r.manualControls)
				if (t === "add" && !h || r.pagingCount > r.controlNav.length) v.controlNav.update("add");
				else if (t === "remove" && !h || r.pagingCount < r.controlNav.length) {
				if (h && r.currentSlide > r.last) {
					r.currentSlide -= 1;
					r.animatingTo -= 1
				}
				v.controlNav.update("remove", r.last)
			}
			r.vars.directionNav && v.directionNav.update()
		};
		r.addSlide = function(t, n) {
			var i = e(t);
			r.count += 1;
			r.last = r.count - 1;
			l && c ? n !== undefined ? r.slides.eq(r.count - n).after(i) : r.container.prepend(i) : n !== undefined ? r.slides.eq(n).before(i) : r.container.append(i);
			r.update(n, "add");
			r.slides = e(r.vars.selector + ":not(.clone)", r);
			r.setup();
			r.vars.added(r)
		};
		r.removeSlide = function(t) {
			var n = isNaN(t) ? r.slides.index(e(t)) : t;
			r.count -= 1;
			r.last = r.count - 1;
			isNaN(t) ? e(t, r.slides).remove() : l && c ? r.slides.eq(r.last).remove() : r.slides.eq(t).remove();
			r.doMath();
			r.update(n, "remove");
			r.slides = e(r.vars.selector + ":not(.clone)", r);
			r.setup();
			r.vars.removed(r)
		};
		v.init()
	};
	e(window).blur(function(e) {
		focused = !1
	}).focus(function(e) {
		focused = !0
	});
	e.flexslider.defaults = {
		namespace: "flex-",
		selector: ".slides > li",
		animation: "fade",
		easing: "swing",
		direction: "horizontal",
		reverse: !1,
		animationLoop: !0,
		smoothHeight: !1,
		startAt: 0,
		slideshow: !0,
		slideshowSpeed: 7e3,
		animationSpeed: 600,
		initDelay: 0,
		randomize: !1,
		thumbCaptions: !1,
		pauseOnAction: !0,
		pauseOnHover: !1,
		pauseInvisible: !0,
		useCSS: !0,
		touch: !0,
		video: !1,
		controlNav: !0,
		directionNav: !0,
		prevText: "Previous",
		nextText: "Next",
		keyboard: !0,
		multipleKeyboard: !1,
		mousewheel: !1,
		pausePlay: !1,
		pauseText: "Pause",
		playText: "Play",
		controlsContainer: "",
		manualControls: "",
		sync: "",
		asNavFor: "",
		itemWidth: 0,
		itemMargin: 0,
		minItems: 1,
		maxItems: 0,
		move: 0,
		allowOneSlide: !0,
		start: function() {},
		before: function() {},
		after: function() {},
		end: function() {},
		added: function() {},
		removed: function() {}
	};
	e.fn.flexslider = function(t) {
		t === undefined && (t = {});
		if (typeof t == "object") return this.each(function() {
			var n = e(this),
				r = t.selector ? t.selector : ".slides > li",
				i = n.find(r);
			if (i.length === 1 && t.allowOneSlide === !0 || i.length === 0) {
				i.fadeIn(400);
				t.start && t.start(n)
			} else n.data("flexslider") === undefined && new e.flexslider(this, t)
		});
		var n = e(this).data("flexslider");
		switch (t) {
			case "play":
				n.play();
				break;
			case "pause":
				n.pause();
				break;
			case "stop":
				n.stop();
				break;
			case "next":
				n.flexAnimate(n.getTarget("next"), !0);
				break;
			case "prev":
			case "previous":
				n.flexAnimate(n.getTarget("prev"), !0);
				break;
			default:
				typeof t == "number" && n.flexAnimate(t, !0)
		}
	}
})(jQuery);;
(function() {
	var e = /\blang(?:uage)?-(?!\*)(\w+)\b/i,
		t = self.Prism = {
			util: {
				type: function(e) {
					return Object.prototype.toString.call(e).match(/\[object (\w+)\]/)[1]
				},
				clone: function(e) {
					var n = t.util.type(e);
					switch (n) {
						case "Object":
							var r = {};
							for (var i in e) e.hasOwnProperty(i) && (r[i] = t.util.clone(e[i]));
							return r;
						case "Array":
							return e.slice()
					}
					return e
				}
			},
			languages: {
				extend: function(e, n) {
					var r = t.util.clone(t.languages[e]);
					for (var i in n) r[i] = n[i];
					return r
				},
				insertBefore: function(e, n, r, i) {
					i = i || t.languages;
					var s = i[e],
						o = {};
					for (var u in s)
						if (s.hasOwnProperty(u)) {
							if (u == n)
								for (var a in r) r.hasOwnProperty(a) && (o[a] = r[a]);
							o[u] = s[u]
						}
					return i[e] = o
				},
				DFS: function(e, n) {
					for (var r in e) {
						n.call(e, r, e[r]);
						t.util.type(e) === "Object" && t.languages.DFS(e[r], n)
					}
				}
			},
			highlightAll: function(e, n) {
				var r = document.querySelectorAll('code[class*="language-"], [class*="language-"] code, code[class*="lang-"], [class*="lang-"] code');
				for (var i = 0, s; s = r[i++];) t.highlightElement(s, e === !0, n)
			},
			highlightElement: function(r, i, s) {
				var o, u, a = r;
				while (a && !e.test(a.className)) a = a.parentNode;
				if (a) {
					o = (a.className.match(e) || [, ""])[1];
					u = t.languages[o]
				}
				if (!u) return;
				r.className = r.className.replace(e, "").replace(/\s+/g, " ") + " language-" + o;
				a = r.parentNode;
				/pre/i.test(a.nodeName) && (a.className = a.className.replace(e, "").replace(/\s+/g, " ") + " language-" + o);
				var f = r.textContent;
				if (!f) return;
				f = f.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/\u00a0/g, " ");
				var l = {
					element: r,
					language: o,
					grammar: u,
					code: f
				};
				t.hooks.run("before-highlight", l);
				if (i && self.Worker) {
					var c = new Worker(t.filename);
					c.onmessage = function(e) {
						l.highlightedCode = n.stringify(JSON.parse(e.data), o);
						t.hooks.run("before-insert", l);
						l.element.innerHTML = l.highlightedCode;
						s && s.call(l.element);
						t.hooks.run("after-highlight", l)
					};
					c.postMessage(JSON.stringify({
						language: l.language,
						code: l.code
					}))
				} else {
					l.highlightedCode = t.highlight(l.code, l.grammar, l.language);
					t.hooks.run("before-insert", l);
					l.element.innerHTML = l.highlightedCode;
					s && s.call(r);
					t.hooks.run("after-highlight", l)
				}
			},
			highlight: function(e, r, i) {
				return n.stringify(t.tokenize(e, r), i)
			},
			tokenize: function(e, n, r) {
				var i = t.Token,
					s = [e],
					o = n.rest;
				if (o) {
					for (var u in o) n[u] = o[u];
					delete n.rest
				}
				e: for (var u in n) {
					if (!n.hasOwnProperty(u) || !n[u]) continue;
					var a = n[u],
						f = a.inside,
						l = !!a.lookbehind,
						c = 0;
					a = a.pattern || a;
					for (var h = 0; h < s.length; h++) {
						var p = s[h];
						if (s.length > e.length) break e;
						if (p instanceof i) continue;
						a.lastIndex = 0;
						var d = a.exec(p);
						if (d) {
							l && (c = d[1].length);
							var v = d.index - 1 + c,
								d = d[0].slice(c),
								m = d.length,
								g = v + m,
								y = p.slice(0, v + 1),
								b = p.slice(g + 1),
								w = [h, 1];
							y && w.push(y);
							var E = new i(u, f ? t.tokenize(d, f) : d);
							w.push(E);
							b && w.push(b);
							Array.prototype.splice.apply(s, w)
						}
					}
				}
				return s
			},
			hooks: {
				all: {},
				add: function(e, n) {
					var r = t.hooks.all;
					r[e] = r[e] || [];
					r[e].push(n)
				},
				run: function(e, n) {
					var r = t.hooks.all[e];
					if (!r || !r.length) return;
					for (var i = 0, s; s = r[i++];) s(n)
				}
			}
		},
		n = t.Token = function(e, t) {
			this.type = e;
			this.content = t
		};
	n.stringify = function(e, r, i) {
		if (typeof e == "string") return e;
		if (Object.prototype.toString.call(e) == "[object Array]") return e.map(function(t) {
			return n.stringify(t, r, e)
		}).join("");
		var s = {
			type: e.type,
			content: n.stringify(e.content, r, i),
			tag: "span",
			classes: ["token", e.type],
			attributes: {},
			language: r,
			parent: i
		};
		s.type == "comment" && (s.attributes.spellcheck = "true");
		t.hooks.run("wrap", s);
		var o = "";
		for (var u in s.attributes) o += u + '="' + (s.attributes[u] || "") + '"';
		return "<" + s.tag + ' class="' + s.classes.join(" ") + '" ' + o + ">" + s.content + "</" + s.tag + ">"
	};
	if (!self.document) {
		self.addEventListener("message", function(e) {
			var n = JSON.parse(e.data),
				r = n.language,
				i = n.code;
			self.postMessage(JSON.stringify(t.tokenize(i, t.languages[r])));
			self.close()
		}, !1);
		return
	}
	var r = document.getElementsByTagName("script");
	r = r[r.length - 1];
	if (r) {
		t.filename = r.src;
		document.addEventListener && !r.hasAttribute("data-manual") && document.addEventListener("DOMContentLoaded", t.highlightAll)
	}
})();;
Prism.languages.clike = {
	comment: {
		pattern: /(^|[^\\])(\/\*[\w\W]*?\*\/|(^|[^:])\/\/.*?(\r?\n|$))/g,
		lookbehind: !0
	},
	string: /("|')(\\?.)*?\1/g,
	"class-name": {
		pattern: /((?:(?:class|interface|extends|implements|trait|instanceof|new)\s+)|(?:catch\s+\())[a-z0-9_\.\\]+/ig,
		lookbehind: !0,
		inside: {
			punctuation: /(\.|\\)/
		}
	},
	keyword: /\b(if|else|while|do|for|return|in|instanceof|function|new|try|throw|catch|finally|null|break|continue)\b/g,
	"boolean": /\b(true|false)\b/g,
	"function": {
		pattern: /[a-z0-9_]+\(/ig,
		inside: {
			punctuation: /\(/
		}
	},
	number: /\b-?(0x[\dA-Fa-f]+|\d*\.?\d+([Ee]-?\d+)?)\b/g,
	operator: /[-+]{1,2}|!|&lt;=?|>=?|={1,3}|(&amp;){1,2}|\|?\||\?|\*|\/|\~|\^|\%/g,
	ignore: /&(lt|gt|amp);/gi,
	punctuation: /[{}[\];(),.:]/g
};;
Prism.languages.bash = Prism.languages.extend("clike", {
	comment: {
		pattern: /(^|[^"{\\])(#.*?(\r?\n|$))/g,
		lookbehind: !0
	},
	string: {
		pattern: /("|')(\\?[\s\S])*?\1/g,
		inside: {
			property: /\$([a-zA-Z0-9_#\?\-\*!@]+|\{[^\}]+\})/g
		}
	},
	keyword: /\b(if|then|else|elif|fi|for|break|continue|while|in|case|function|select|do|done|until|echo|exit|return|set|declare)\b/g
});
Prism.languages.insertBefore("bash", "keyword", {
	property: /\$([a-zA-Z0-9_#\?\-\*!@]+|\{[^}]+\})/g
});
Prism.languages.insertBefore("bash", "comment", {
	important: /(^#!\s*\/bin\/bash)|(^#!\s*\/bin\/sh)/g
});;
Prism.languages.c = Prism.languages.extend("clike", {
	keyword: /\b(asm|typeof|inline|auto|break|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|int|long|register|return|short|signed|sizeof|static|struct|switch|typedef|union|unsigned|void|volatile|while)\b/g,
	operator: /[-+]{1,2}|!=?|&lt;{1,2}=?|&gt;{1,2}=?|\-&gt;|={1,2}|\^|~|%|(&amp;){1,2}|\|?\||\?|\*|\//g
});
Prism.languages.insertBefore("c", "keyword", {
	property: /#\s*[a-zA-Z]+/g
});;
Prism.languages.javascript = Prism.languages.extend("clike", {
	keyword: /\b(var|let|if|else|while|do|for|return|in|instanceof|function|new|with|typeof|try|throw|catch|finally|null|break|continue)\b/g,
	number: /\b-?(0x[\dA-Fa-f]+|\d*\.?\d+([Ee]-?\d+)?|NaN|-?Infinity)\b/g
});
Prism.languages.insertBefore("javascript", "keyword", {
	regex: {
		pattern: /(^|[^/])\/(?!\/)(\[.+?]|\\.|[^/\r\n])+\/[gim]{0,3}(?=\s*($|[\r\n,.;})]))/g,
		lookbehind: !0
	}
});
Prism.languages.markup && Prism.languages.insertBefore("markup", "tag", {
	script: {
		pattern: /(&lt;|<)script[\w\W]*?(>|&gt;)[\w\W]*?(&lt;|<)\/script(>|&gt;)/ig,
		inside: {
			tag: {
				pattern: /(&lt;|<)script[\w\W]*?(>|&gt;)|(&lt;|<)\/script(>|&gt;)/ig,
				inside: Prism.languages.markup.tag.inside
			},
			rest: Prism.languages.javascript
		}
	}
});