function search(t) {	
	Navigator.isCategoryFold || Navigator.foldCategory({
		title: t,
		callback: function() {
			Navigator.loadItem({
				where: "title",
				query: t,
				pattern: "like"
			}, !0)
		}
	})
}! function(t) {
	var e, r, a = "hasOwnProperty",
		i = /[\.\/]/,
		n = function() {},
		o = function(t, e) {
			return t - e
		},
		s = {
			n: {}
		},
		l = function(t, a) {
			t = String(t);
			var i, n = r,
				s = Array.prototype.slice.call(arguments, 2),
				c = l.listeners(t),
				h = 0,
				d = [],
				u = {},
				p = [],
				f = e;
			e = t, r = 0;
			for (var g = 0, m = c.length; g < m; g++) "zIndex" in c[g] && (d.push(c[g].zIndex), c[g].zIndex < 0 && (u[c[g].zIndex] = c[g]));
			for (d.sort(o); d[h] < 0;)
				if (i = u[d[h++]], p.push(i.apply(a, s)), r) return r = n, p;
			for (g = 0; g < m; g++)
				if ("zIndex" in (i = c[g]))
					if (i.zIndex == d[h]) {
						if (p.push(i.apply(a, s)), r) break;
						do {
							if (h++, (i = u[d[h]]) && p.push(i.apply(a, s)), r) break
						} while (i)
					} else u[i.zIndex] = i;
			else if (p.push(i.apply(a, s)), r) break;
			return r = n, e = f, p.length ? p : null
		};
	l._events = s, l.listeners = function(t) {
		var e, r, a, n, o, l, c, h, d = t.split(i),
			u = s,
			p = [u],
			f = [];
		for (n = 0, o = d.length; n < o; n++) {
			for (h = [], l = 0, c = p.length; l < c; l++)
				for (r = [(u = p[l].n)[d[n]], u["*"]], a = 2; a--;)(e = r[a]) && (h.push(e), f = f.concat(e.f || []));
			p = h
		}
		return f
	}, l.on = function(t, e) {
		if (t = String(t), "function" != typeof e) return function() {};
		for (var r = t.split(i), a = s, o = 0, l = r.length; o < l; o++) a = (a = a.n).hasOwnProperty(r[o]) && a[r[o]] || (a[r[o]] = {
			n: {}
		});
		for (a.f = a.f || [], o = 0, l = a.f.length; o < l; o++)
			if (a.f[o] == e) return n;
		return a.f.push(e),
			function(t) {
				+t == +t && (e.zIndex = +t)
			}
	}, l.f = function(t) {
		var e = [].slice.call(arguments, 1);
		return function() {
			l.apply(null, [t, null].concat(e).concat([].slice.call(arguments, 0)))
		}
	}, l.stop = function() {
		r = 1
	}, l.nt = function(t) {
		return t ? new RegExp("(?:\\.|\\/|^)" + t + "(?:\\.|\\/|$)").test(e) : e
	}, l.nts = function() {
		return e.split(i)
	}, l.off = l.unbind = function(t, e) {
		if (t) {
			var r, n, o, c, h, d, u, p = t.split(i),
				f = [s];
			for (c = 0, h = p.length; c < h; c++)
				for (d = 0; d < f.length; d += o.length - 2) {
					if (o = [d, 1], r = f[d].n, "*" != p[c]) r[p[c]] && o.push(r[p[c]]);
					else
						for (n in r) r[a](n) && o.push(r[n]);
					f.splice.apply(f, o)
				}
			for (c = 0, h = f.length; c < h; c++)
				for (r = f[c]; r.n;) {
					if (e) {
						if (r.f) {
							for (d = 0, u = r.f.length; d < u; d++)
								if (r.f[d] == e) {
									r.f.splice(d, 1);
									break
								}!r.f.length && delete r.f
						}
						for (n in r.n)
							if (r.n[a](n) && r.n[n].f) {
								var g = r.n[n].f;
								for (d = 0, u = g.length; d < u; d++)
									if (g[d] == e) {
										g.splice(d, 1);
										break
									}!g.length && delete r.n[n].f
							}
					} else {
						delete r.f;
						for (n in r.n) r.n[a](n) && r.n[n].f && delete r.n[n].f
					}
					r = r.n
				}
		} else l._events = s = {
			n: {}
		}
	}, l.once = function(t, e) {
		var r = function() {
			return l.unbind(t, r), e.apply(this, arguments)
		};
		return l.on(t, r)
	}, l.version = "0.4.2", l.toString = function() {
		return "You are running Eve 0.4.2"
	}, "undefined" != typeof module && module.exports ? module.exports = l : "undefined" != typeof define ? define("eve", [], function() {
		return l
	}) : t.eve = l
}(this),
function(t, e) {
	"function" == typeof define && define.amd ? define(["eve"], function(r) {
		return e(t, r)
	}) : e(t, t.eve)
}(this, function(t, e) {
	function r(t) {
		if (r.is(t, "function")) return _ ? t() : e.on("raphael.DOMload", t);
		if (r.is(t, W)) return r._engine.create[M](r, t.splice(0, 3 + r.is(t[0], V))).add(t);
		var a = Array.prototype.slice.call(arguments, 0);
		if (r.is(a[a.length - 1], "function")) {
			var i = a.pop();
			return _ ? i.call(r._engine.create[M](r, a)) : e.on("raphael.DOMload", function() {
				i.call(r._engine.create[M](r, a))
			})
		}
		return r._engine.create[M](r, arguments)
	}

	function a(t) {
		if ("function" == typeof t || Object(t) !== t) return t;
		var e = new t.constructor;
		for (var r in t) t[B](r) && (e[r] = a(t[r]));
		return e
	}

	function i(t, e) {
		for (var r = 0, a = t.length; r < a; r++)
			if (t[r] === e) return t.push(t.splice(r, 1)[0])
	}

	function n(t, e, r) {
		function a() {
			var n = Array.prototype.slice.call(arguments, 0),
				o = n.join("␀"),
				s = a.cache = a.cache || {},
				l = a.count = a.count || [];
			return s[B](o) ? (i(l, o), r ? r(s[o]) : s[o]) : (l.length >= 1e3 && delete s[l.shift()], l.push(o), s[o] = t[M](e, n), r ? r(s[o]) : s[o])
		}
		return a
	}

	function o() {
		return this.hex
	}

	function s(t, e) {
		for (var r = [], a = 0, i = t.length; i - 2 * !e > a; a += 2) {
			var n = [{
				x: +t[a - 2],
				y: +t[a - 1]
			}, {
				x: +t[a],
				y: +t[a + 1]
			}, {
				x: +t[a + 2],
				y: +t[a + 3]
			}, {
				x: +t[a + 4],
				y: +t[a + 5]
			}];
			e ? a ? i - 4 == a ? n[3] = {
				x: +t[0],
				y: +t[1]
			} : i - 2 == a && (n[2] = {
				x: +t[0],
				y: +t[1]
			}, n[3] = {
				x: +t[2],
				y: +t[3]
			}) : n[0] = {
				x: +t[i - 2],
				y: +t[i - 1]
			} : i - 4 == a ? n[3] = n[2] : a || (n[0] = {
				x: +t[a],
				y: +t[a + 1]
			}), r.push(["C", (-n[0].x + 6 * n[1].x + n[2].x) / 6, (-n[0].y + 6 * n[1].y + n[2].y) / 6, (n[1].x + 6 * n[2].x - n[3].x) / 6, (n[1].y + 6 * n[2].y - n[3].y) / 6, n[2].x, n[2].y])
		}
		return r
	}

	function l(t, e, r, a, i) {
		return t * (t * (-3 * e + 9 * r - 9 * a + 3 * i) + 6 * e - 12 * r + 6 * a) - 3 * e + 3 * r
	}

	function c(t, e, r, a, i, n, o, s, c) {
		null == c && (c = 1);
		for (var h = (c = c > 1 ? 1 : c < 0 ? 0 : c) / 2, d = [-.1252, .1252, -.3678, .3678, -.5873, .5873, -.7699, .7699, -.9041, .9041, -.9816, .9816], u = [.2491, .2491, .2335, .2335, .2032, .2032, .1601, .1601, .1069, .1069, .0472, .0472], p = 0, f = 0; f < 12; f++) {
			var g = h * d[f] + h,
				m = l(g, t, r, i, o),
				x = l(g, e, a, n, s),
				v = m * m + x * x;
			p += u[f] * L.sqrt(v)
		}
		return h * p
	}

	function h(t, e, r, a, i, n, o, s, l) {
		if (!(l < 0 || c(t, e, r, a, i, n, o, s) < l)) {
			var h, d = .5,
				u = 1 - d;
			for (h = c(t, e, r, a, i, n, o, s, u); q(h - l) > .01;) d /= 2, h = c(t, e, r, a, i, n, o, s, u += (h < l ? 1 : -1) * d);
			return u
		}
	}

	function d(t, e, r, a, i, n, o, s) {
		if (!(H(t, r) < j(i, o) || j(t, r) > H(i, o) || H(e, a) < j(n, s) || j(e, a) > H(n, s))) {
			var l = (t * a - e * r) * (i - o) - (t - r) * (i * s - n * o),
				c = (t * a - e * r) * (n - s) - (e - a) * (i * s - n * o),
				h = (t - r) * (n - s) - (e - a) * (i - o);
			if (h) {
				var d = l / h,
					u = c / h,
					p = +d.toFixed(2),
					f = +u.toFixed(2);
				if (!(p < +j(t, r).toFixed(2) || p > +H(t, r).toFixed(2) || p < +j(i, o).toFixed(2) || p > +H(i, o).toFixed(2) || f < +j(e, a).toFixed(2) || f > +H(e, a).toFixed(2) || f < +j(n, s).toFixed(2) || f > +H(n, s).toFixed(2))) return {
					x: d,
					y: u
				}
			}
		}
	}

	function u(t, e, a) {
		var i = r.bezierBBox(t),
			n = r.bezierBBox(e);
		if (!r.isBBoxIntersect(i, n)) return a ? 0 : [];
		for (var o = c.apply(0, t), s = c.apply(0, e), l = H(~~(o / 5), 1), h = H(~~(s / 5), 1), u = [], p = [], f = {}, g = a ? 0 : [], m = 0; m < l + 1; m++) {
			var x = r.findDotsAtSegment.apply(r, t.concat(m / l));
			u.push({
				x: x.x,
				y: x.y,
				t: m / l
			})
		}
		for (m = 0; m < h + 1; m++) x = r.findDotsAtSegment.apply(r, e.concat(m / h)), p.push({
			x: x.x,
			y: x.y,
			t: m / h
		});
		for (m = 0; m < l; m++)
			for (var v = 0; v < h; v++) {
				var y = u[m],
					_ = u[m + 1],
					b = p[v],
					w = p[v + 1],
					k = q(_.x - y.x) < .001 ? "y" : "x",
					C = q(w.x - b.x) < .001 ? "y" : "x",
					B = d(y.x, y.y, _.x, _.y, b.x, b.y, w.x, w.y);
				if (B) {
					if (f[B.x.toFixed(4)] == B.y.toFixed(4)) continue;
					f[B.x.toFixed(4)] = B.y.toFixed(4);
					var S = y.t + q((B[k] - y[k]) / (_[k] - y[k])) * (_.t - y.t),
						I = b.t + q((B[C] - b[C]) / (w[C] - b[C])) * (w.t - b.t);
					S >= 0 && S <= 1.001 && I >= 0 && I <= 1.001 && (a ? g++ : g.push({
						x: B.x,
						y: B.y,
						t1: j(S, 1),
						t2: j(I, 1)
					}))
				}
			}
		return g
	}

	function p(t, e, a) {
		t = r._path2curve(t), e = r._path2curve(e);
		for (var i, n, o, s, l, c, h, d, p, f, g = a ? 0 : [], m = 0, x = t.length; m < x; m++) {
			var v = t[m];
			if ("M" == v[0]) i = l = v[1], n = c = v[2];
			else {
				"C" == v[0] ? (i = (p = [i, n].concat(v.slice(1)))[6], n = p[7]) : (p = [i, n, i, n, l, c, l, c], i = l, n = c);
				for (var y = 0, _ = e.length; y < _; y++) {
					var b = e[y];
					if ("M" == b[0]) o = h = b[1], s = d = b[2];
					else {
						"C" == b[0] ? (o = (f = [o, s].concat(b.slice(1)))[6], s = f[7]) : (f = [o, s, o, s, h, d, h, d], o = h, s = d);
						var w = u(p, f, a);
						if (a) g += w;
						else {
							for (var k = 0, C = w.length; k < C; k++) w[k].segment1 = m, w[k].segment2 = y, w[k].bez1 = p, w[k].bez2 = f;
							g = g.concat(w)
						}
					}
				}
			}
		}
		return g
	}

	function f(t, e, r, a, i, n) {
		null != t ? (this.a = +t, this.b = +e, this.c = +r, this.d = +a, this.e = +i, this.f = +n) : (this.a = 1, this.b = 0, this.c = 0, this.d = 1, this.e = 0, this.f = 0)
	}

	function g() {
		return this.x + F + this.y + F + this.width + " × " + this.height
	}

	function m(t, e, r, a, i, n) {
		function o(t) {
			return ((h * t + c) * t + l) * t
		}

		function s(t, e) {
			var r, a, i, n, s, d;
			for (i = t, d = 0; d < 8; d++) {
				if (n = o(i) - t, q(n) < e) return i;
				if (s = (3 * h * i + 2 * c) * i + l, q(s) < 1e-6) break;
				i -= n / s
			}
			if (r = 0, a = 1, (i = t) < r) return r;
			if (i > a) return a;
			for (; r < a;) {
				if (n = o(i), q(n - t) < e) return i;
				t > n ? r = i : a = i, i = (a - r) / 2 + r
			}
			return i
		}
		var l = 3 * e,
			c = 3 * (a - e) - l,
			h = 1 - l - c,
			d = 3 * r,
			u = 3 * (i - r) - d,
			p = 1 - d - u;
		return function(t, e) {
			var r = s(t, e);
			return ((p * r + u) * r + d) * r
		}(t, 1 / (200 * n))
	}

	function x(t, e) {
		var r = [],
			a = {};
		if (this.ms = e, this.times = 1, t) {
			for (var i in t) t[B](i) && (a[J(i)] = t[i], r.push(J(i)));
			r.sort(ht)
		}
		this.anim = a, this.top = r[r.length - 1], this.percents = r
	}

	function v(t, a, i, n, o, s) {
		i = J(i);
		var l, c, h, d, u, p, g = t.ms,
			x = {},
			v = {},
			y = {};
		if (n)
			for (b = 0, k = oe.length; b < k; b++) {
				var _ = oe[b];
				if (_.el.id == a.id && _.anim == t) {
					_.percent != i ? (oe.splice(b, 1), h = 1) : c = _, a.attr(_.totalOrigin);
					break
				}
			} else n = +v;
		for (var b = 0, k = t.percents.length; b < k; b++) {
			if (t.percents[b] == i || t.percents[b] > n * t.top) {
				i = t.percents[b], u = t.percents[b - 1] || 0, g = g / t.top * (i - u), d = t.percents[b + 1], l = t.anim[i];
				break
			}
			n && a.attr(t.anim[t.percents[b]])
		}
		if (l) {
			if (c) c.initstatus = n, c.start = new Date - c.ms * n;
			else {
				for (var C in l)
					if (l[B](C) && (rt[B](C) || a.paper.customAttributes[B](C))) switch (x[C] = a.attr(C), null == x[C] && (x[C] = et[C]), v[C] = l[C], rt[C]) {
						case V:
							y[C] = (v[C] - x[C]) / g;
							break;
						case "colour":
							x[C] = r.getRGB(x[C]);
							var S = r.getRGB(v[C]);
							y[C] = {
								r: (S.r - x[C].r) / g,
								g: (S.g - x[C].g) / g,
								b: (S.b - x[C].b) / g
							};
							break;
						case "path":
							var I = Ot(x[C], v[C]),
								T = I[1];
							for (x[C] = I[0], y[C] = [], b = 0, k = x[C].length; b < k; b++) {
								y[C][b] = [0];
								for (var M = 1, A = x[C][b].length; M < A; M++) y[C][b][M] = (T[b][M] - x[C][b][M]) / g
							}
							break;
						case "transform":
							var z = a._,
								F = Lt(z[C], v[C]);
							if (F)
								for (x[C] = F.from, v[C] = F.to, y[C] = [], y[C].real = !0, b = 0, k = x[C].length; b < k; b++)
									for (y[C][b] = [x[C][b][0]], M = 1, A = x[C][b].length; M < A; M++) y[C][b][M] = (v[C][b][M] - x[C][b][M]) / g;
							else {
								var E = a.matrix || new f,
									R = {
										_: {
											transform: z.transform
										},
										getBBox: function() {
											return a.getBBox(1)
										}
									};
								x[C] = [E.a, E.b, E.c, E.d, E.e, E.f], Rt(R, v[C]), v[C] = R._.transform, y[C] = [(R.matrix.a - E.a) / g, (R.matrix.b - E.b) / g, (R.matrix.c - E.c) / g, (R.matrix.d - E.d) / g, (R.matrix.e - E.e) / g, (R.matrix.f - E.f) / g]
							}
							break;
						case "csv":
							var P = O(l[C])[D](w),
								L = O(x[C])[D](w);
							if ("clip-rect" == C)
								for (x[C] = L, y[C] = [], b = L.length; b--;) y[C][b] = (P[b] - x[C][b]) / g;
							v[C] = P;
							break;
						default:
							for (P = [][N](l[C]), L = [][N](x[C]), y[C] = [], b = a.paper.customAttributes[C].length; b--;) y[C][b] = ((P[b] || 0) - (L[b] || 0)) / g
					}
				var H = l.easing,
					j = r.easing_formulas[H];
				if (!j)
					if ((j = O(H).match(Z)) && 5 == j.length) {
						var q = j;
						j = function(t) {
							return m(t, +q[1], +q[2], +q[3], +q[4], g)
						}
					} else j = dt;
				if (p = l.start || t.start || +new Date, _ = {
						anim: t,
						percent: i,
						timestamp: p,
						start: p + (t.del || 0),
						status: 0,
						initstatus: n || 0,
						stop: !1,
						ms: g,
						easing: j,
						from: x,
						diff: y,
						to: v,
						el: a,
						callback: l.callback,
						prev: u,
						next: d,
						repeat: s || t.times,
						origin: a.attr(),
						totalOrigin: o
					}, oe.push(_), n && !c && !h && (_.stop = !0, _.start = new Date - g * n, 1 == oe.length)) return le();
				h && (_.start = new Date - _.ms * n), 1 == oe.length && se(le)
			}
			e("raphael.anim.start." + a.id, a, t)
		}
	}

	function y(t) {
		for (var e = 0; e < oe.length; e++) oe[e].el.paper == t && oe.splice(e--, 1)
	}
	r.version = "2.1.0", r.eve = e;
	var _, b, w = /[, ]+/,
		k = {
			circle: 1,
			rect: 1,
			path: 1,
			ellipse: 1,
			text: 1,
			image: 1
		},
		C = /\{(\d+)\}/g,
		B = "hasOwnProperty",
		S = {
			doc: document,
			win: t
		},
		I = {
			was: Object.prototype[B].call(S.win, "Raphael"),
			is: S.win.Raphael
		},
		T = function() {
			this.ca = this.customAttributes = {}
		},
		M = "apply",
		N = "concat",
		A = "ontouchstart" in S.win || S.win.DocumentTouch && S.doc instanceof DocumentTouch,
		z = "",
		F = " ",
		O = String,
		D = "split",
		E = "click dblclick mousedown mousemove mouseout mouseover mouseup touchstart touchmove touchend touchcancel" [D](F),
		R = {
			mousedown: "touchstart",
			mousemove: "touchmove",
			mouseup: "touchend"
		},
		P = O.prototype.toLowerCase,
		L = Math,
		H = L.max,
		j = L.min,
		q = L.abs,
		$ = L.pow,
		Y = L.PI,
		V = "number",
		W = "array",
		U = Object.prototype.toString,
		X = (r._ISURL = /^url\(['"]?([^\)]+?)['"]?\)$/i, /^\s*((#[a-f\d]{6})|(#[a-f\d]{3})|rgba?\(\s*([\d\.]+%?\s*,\s*[\d\.]+%?\s*,\s*[\d\.]+%?(?:\s*,\s*[\d\.]+%?)?)\s*\)|hsba?\(\s*([\d\.]+(?:deg|\xb0|%)?\s*,\s*[\d\.]+%?\s*,\s*[\d\.]+(?:%?\s*,\s*[\d\.]+)?)%?\s*\)|hsla?\(\s*([\d\.]+(?:deg|\xb0|%)?\s*,\s*[\d\.]+%?\s*,\s*[\d\.]+(?:%?\s*,\s*[\d\.]+)?)%?\s*\))\s*$/i),
		G = {
			NaN: 1,
			Infinity: 1,
			"-Infinity": 1
		},
		Z = /^(?:cubic-)?bezier\(([^,]+),([^,]+),([^,]+),([^\)]+)\)/,
		K = L.round,
		J = parseFloat,
		Q = parseInt,
		tt = O.prototype.toUpperCase,
		et = r._availableAttrs = {
			"arrow-end": "none",
			"arrow-start": "none",
			blur: 0,
			"clip-rect": "0 0 1e9 1e9",
			cursor: "default",
			cx: 0,
			cy: 0,
			fill: "#fff",
			"fill-opacity": 1,
			font: '10px "Arial"',
			"font-family": '"Arial"',
			"font-size": "10",
			"font-style": "normal",
			"font-weight": 400,
			gradient: 0,
			height: 0,
			href: "http://raphaeljs.com/",
			"letter-spacing": 0,
			opacity: 1,
			path: "M0,0",
			r: 0,
			rx: 0,
			ry: 0,
			src: "",
			stroke: "#000",
			"stroke-dasharray": "",
			"stroke-linecap": "butt",
			"stroke-linejoin": "butt",
			"stroke-miterlimit": 0,
			"stroke-opacity": 1,
			"stroke-width": 1,
			target: "_blank",
			"text-anchor": "middle",
			title: "Raphael",
			transform: "",
			width: 0,
			x: 0,
			y: 0
		},
		rt = r._availableAnimAttrs = {
			blur: V,
			"clip-rect": "csv",
			cx: V,
			cy: V,
			fill: "colour",
			"fill-opacity": V,
			"font-size": V,
			height: V,
			opacity: V,
			path: "path",
			r: V,
			rx: V,
			ry: V,
			stroke: "colour",
			"stroke-opacity": V,
			"stroke-width": V,
			transform: "transform",
			width: V,
			x: V,
			y: V
		},
		at = /[\x09\x0a\x0b\x0c\x0d\x20\xa0\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000\u2028\u2029]*,[\x09\x0a\x0b\x0c\x0d\x20\xa0\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000\u2028\u2029]*/,
		it = {
			hs: 1,
			rg: 1
		},
		nt = /,?([achlmqrstvxz]),?/gi,
		ot = /([achlmrqstvz])[\x09\x0a\x0b\x0c\x0d\x20\xa0\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000\u2028\u2029,]*((-?\d*\.?\d*(?:e[\-+]?\d+)?[\x09\x0a\x0b\x0c\x0d\x20\xa0\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000\u2028\u2029]*,?[\x09\x0a\x0b\x0c\x0d\x20\xa0\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000\u2028\u2029]*)+)/gi,
		st = /([rstm])[\x09\x0a\x0b\x0c\x0d\x20\xa0\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000\u2028\u2029,]*((-?\d*\.?\d*(?:e[\-+]?\d+)?[\x09\x0a\x0b\x0c\x0d\x20\xa0\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000\u2028\u2029]*,?[\x09\x0a\x0b\x0c\x0d\x20\xa0\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000\u2028\u2029]*)+)/gi,
		lt = /(-?\d*\.?\d*(?:e[\-+]?\d+)?)[\x09\x0a\x0b\x0c\x0d\x20\xa0\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000\u2028\u2029]*,?[\x09\x0a\x0b\x0c\x0d\x20\xa0\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000\u2028\u2029]*/gi,
		ct = (r._radial_gradient = /^r(?:\(([^,]+?)[\x09\x0a\x0b\x0c\x0d\x20\xa0\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000\u2028\u2029]*,[\x09\x0a\x0b\x0c\x0d\x20\xa0\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000\u2028\u2029]*([^\)]+?)\))?/, {}),
		ht = function(t, e) {
			return J(t) - J(e)
		},
		dt = function(t) {
			return t
		},
		ut = r._rectPath = function(t, e, r, a, i) {
			return i ? [
				["M", t + i, e],
				["l", r - 2 * i, 0],
				["a", i, i, 0, 0, 1, i, i],
				["l", 0, a - 2 * i],
				["a", i, i, 0, 0, 1, -i, i],
				["l", 2 * i - r, 0],
				["a", i, i, 0, 0, 1, -i, -i],
				["l", 0, 2 * i - a],
				["a", i, i, 0, 0, 1, i, -i],
				["z"]
			] : [
				["M", t, e],
				["l", r, 0],
				["l", 0, a],
				["l", -r, 0],
				["z"]
			]
		},
		pt = function(t, e, r, a) {
			return null == a && (a = r), [
				["M", t, e],
				["m", 0, -a],
				["a", r, a, 0, 1, 1, 0, 2 * a],
				["a", r, a, 0, 1, 1, 0, -2 * a],
				["z"]
			]
		},
		ft = r._getPath = {
			path: function(t) {
				return t.attr("path")
			},
			circle: function(t) {
				var e = t.attrs;
				return pt(e.cx, e.cy, e.r)
			},
			ellipse: function(t) {
				var e = t.attrs;
				return pt(e.cx, e.cy, e.rx, e.ry)
			},
			rect: function(t) {
				var e = t.attrs;
				return ut(e.x, e.y, e.width, e.height, e.r)
			},
			image: function(t) {
				var e = t.attrs;
				return ut(e.x, e.y, e.width, e.height)
			},
			text: function(t) {
				var e = t._getBBox();
				return ut(e.x, e.y, e.width, e.height)
			},
			set: function(t) {
				var e = t._getBBox();
				return ut(e.x, e.y, e.width, e.height)
			}
		},
		gt = r.mapPath = function(t, e) {
			if (!e) return t;
			var r, a, i, n, o, s, l;
			for (i = 0, o = (t = Ot(t)).length; i < o; i++)
				for (n = 1, s = (l = t[i]).length; n < s; n += 2) r = e.x(l[n], l[n + 1]), a = e.y(l[n], l[n + 1]), l[n] = r, l[n + 1] = a;
			return t
		};
	if (r._g = S, r.type = S.win.SVGAngle || S.doc.implementation.hasFeature("http://www.w3.org/TR/SVG11/feature#BasicStructure", "1.1") ? "SVG" : "VML", "VML" == r.type) {
		var mt, xt = S.doc.createElement("div");
		if (xt.innerHTML = '<v:shape adj="1"/>', mt = xt.firstChild, mt.style.behavior = "url(#default#VML)", !mt || "object" != typeof mt.adj) return r.type = z;
		xt = null
	}
	r.svg = !(r.vml = "VML" == r.type), r._Paper = T, r.fn = b = T.prototype = r.prototype, r._id = 0, r._oid = 0, r.is = function(t, e) {
		return "finite" == (e = P.call(e)) ? !G[B](+t) : "array" == e ? t instanceof Array : "null" == e && null === t || e == typeof t && null !== t || "object" == e && t === Object(t) || "array" == e && Array.isArray && Array.isArray(t) || U.call(t).slice(8, -1).toLowerCase() == e
	}, r.angle = function(t, e, a, i, n, o) {
		if (null == n) {
			var s = t - a,
				l = e - i;
			return s || l ? (180 + 180 * L.atan2(-l, -s) / Y + 360) % 360 : 0
		}
		return r.angle(t, e, n, o) - r.angle(a, i, n, o)
	}, r.rad = function(t) {
		return t % 360 * Y / 180
	}, r.deg = function(t) {
		return 180 * t / Y % 360
	}, r.snapTo = function(t, e, a) {
		if (a = r.is(a, "finite") ? a : 10, r.is(t, W)) {
			for (var i = t.length; i--;)
				if (q(t[i] - e) <= a) return t[i]
		} else {
			var n = e % (t = +t);
			if (n < a) return e - n;
			if (n > t - a) return e - n + t
		}
		return e
	};
	r.createUUID = function(t, e) {
		return function() {
			return "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx".replace(t, e).toUpperCase()
		}
	}(/[xy]/g, function(t) {
		var e = 16 * L.random() | 0;
		return ("x" == t ? e : 3 & e | 8).toString(16)
	});
	r.setWindow = function(t) {
		e("raphael.setWindow", r, S.win, t), S.win = t, S.doc = S.win.document, r._engine.initWin && r._engine.initWin(S.win)
	};
	var vt = function(t) {
			if (r.vml) {
				var e, a = /^\s+|\s+$/g;
				try {
					var i = new ActiveXObject("htmlfile");
					i.write("<body>"), i.close(), e = i.body
				} catch (t) {
					e = createPopup().document.body
				}
				var o = e.createTextRange();
				vt = n(function(t) {
					try {
						e.style.color = O(t).replace(a, z);
						var r = o.queryCommandValue("ForeColor");
						return "#" + ("000000" + (r = (255 & r) << 16 | 65280 & r | (16711680 & r) >>> 16).toString(16)).slice(-6)
					} catch (t) {
						return "none"
					}
				})
			} else {
				var s = S.doc.createElement("i");
				s.title = "Raphaël Colour Picker", s.style.display = "none", S.doc.body.appendChild(s), vt = n(function(t) {
					return s.style.color = t, S.doc.defaultView.getComputedStyle(s, z).getPropertyValue("color")
				})
			}
			return vt(t)
		},
		yt = function() {
			return "hsb(" + [this.h, this.s, this.b] + ")"
		},
		_t = function() {
			return "hsl(" + [this.h, this.s, this.l] + ")"
		},
		bt = function() {
			return this.hex
		},
		wt = function(t, e, a) {
			if (null == e && r.is(t, "object") && "r" in t && "g" in t && "b" in t && (a = t.b, e = t.g, t = t.r), null == e && r.is(t, "string")) {
				var i = r.getRGB(t);
				t = i.r, e = i.g, a = i.b
			}
			return (t > 1 || e > 1 || a > 1) && (t /= 255, e /= 255, a /= 255), [t, e, a]
		},
		kt = function(t, e, a, i) {
			var n = {
				r: t *= 255,
				g: e *= 255,
				b: a *= 255,
				hex: r.rgb(t, e, a),
				toString: bt
			};
			return r.is(i, "finite") && (n.opacity = i), n
		};
	r.color = function(t) {
		var e;
		return r.is(t, "object") && "h" in t && "s" in t && "b" in t ? (e = r.hsb2rgb(t), t.r = e.r, t.g = e.g, t.b = e.b, t.hex = e.hex) : r.is(t, "object") && "h" in t && "s" in t && "l" in t ? (e = r.hsl2rgb(t), t.r = e.r, t.g = e.g, t.b = e.b, t.hex = e.hex) : (r.is(t, "string") && (t = r.getRGB(t)), r.is(t, "object") && "r" in t && "g" in t && "b" in t ? (e = r.rgb2hsl(t), t.h = e.h, t.s = e.s, t.l = e.l, e = r.rgb2hsb(t), t.v = e.b) : (t = {
			hex: "none"
		}).r = t.g = t.b = t.h = t.s = t.v = t.l = -1), t.toString = bt, t
	}, r.hsb2rgb = function(t, e, r, a) {
		this.is(t, "object") && "h" in t && "s" in t && "b" in t && (r = t.b, e = t.s, a = (t = t.h).o);
		var i, n, o, s, l;
		return t = (t *= 360) % 360 / 60, l = r * e, s = l * (1 - q(t % 2 - 1)), i = n = o = r - l, t = ~~t, i += [l, s, 0, 0, s, l][t], n += [s, l, l, s, 0, 0][t], o += [0, 0, s, l, l, s][t], kt(i, n, o, a)
	}, r.hsl2rgb = function(t, e, r, a) {
		this.is(t, "object") && "h" in t && "s" in t && "l" in t && (r = t.l, e = t.s, t = t.h), (t > 1 || e > 1 || r > 1) && (t /= 360, e /= 100, r /= 100);
		var i, n, o, s, l;
		return t = (t *= 360) % 360 / 60, l = 2 * e * (r < .5 ? r : 1 - r), s = l * (1 - q(t % 2 - 1)), i = n = o = r - l / 2, t = ~~t, i += [l, s, 0, 0, s, l][t], n += [s, l, l, s, 0, 0][t], o += [0, 0, s, l, l, s][t], kt(i, n, o, a)
	}, r.rgb2hsb = function(t, e, r) {
		t = (r = wt(t, e, r))[0], e = r[1], r = r[2];
		var a, i, n, o;
		return n = H(t, e, r), o = n - j(t, e, r), a = 0 == o ? null : n == t ? (e - r) / o : n == e ? (r - t) / o + 2 : (t - e) / o + 4, a = (a + 360) % 6 * 60 / 360, i = 0 == o ? 0 : o / n, {
			h: a,
			s: i,
			b: n,
			toString: yt
		}
	}, r.rgb2hsl = function(t, e, r) {
		t = (r = wt(t, e, r))[0], e = r[1], r = r[2];
		var a, i, n, o, s, l;
		return o = H(t, e, r), s = j(t, e, r), l = o - s, a = 0 == l ? null : o == t ? (e - r) / l : o == e ? (r - t) / l + 2 : (t - e) / l + 4, a = (a + 360) % 6 * 60 / 360, n = (o + s) / 2, i = 0 == l ? 0 : n < .5 ? l / (2 * n) : l / (2 - 2 * n), {
			h: a,
			s: i,
			l: n,
			toString: _t
		}
	}, r._path2string = function() {
		return this.join(",").replace(nt, "$1")
	};
	r._preload = function(t, e) {
		var r = S.doc.createElement("img");
		r.style.cssText = "position:absolute;left:-9999em;top:-9999em", r.onload = function() {
			e.call(this), this.onload = null, S.doc.body.removeChild(this)
		}, r.onerror = function() {
			S.doc.body.removeChild(this)
		}, S.doc.body.appendChild(r), r.src = t
	};
	r.getRGB = n(function(t) {
		if (!t || (t = O(t)).indexOf("-") + 1) return {
			r: -1,
			g: -1,
			b: -1,
			hex: "none",
			error: 1,
			toString: o
		};
		if ("none" == t) return {
			r: -1,
			g: -1,
			b: -1,
			hex: "none",
			toString: o
		};
		!(it[B](t.toLowerCase().substring(0, 2)) || "#" == t.charAt()) && (t = vt(t));
		var e, a, i, n, s, l, c = t.match(X);
		return c ? (c[2] && (i = Q(c[2].substring(5), 16), a = Q(c[2].substring(3, 5), 16), e = Q(c[2].substring(1, 3), 16)), c[3] && (i = Q((s = c[3].charAt(3)) + s, 16), a = Q((s = c[3].charAt(2)) + s, 16), e = Q((s = c[3].charAt(1)) + s, 16)), c[4] && (l = c[4][D](at), e = J(l[0]), "%" == l[0].slice(-1) && (e *= 2.55), a = J(l[1]), "%" == l[1].slice(-1) && (a *= 2.55), i = J(l[2]), "%" == l[2].slice(-1) && (i *= 2.55), "rgba" == c[1].toLowerCase().slice(0, 4) && (n = J(l[3])), l[3] && "%" == l[3].slice(-1) && (n /= 100)), c[5] ? (l = c[5][D](at), e = J(l[0]), "%" == l[0].slice(-1) && (e *= 2.55), a = J(l[1]), "%" == l[1].slice(-1) && (a *= 2.55), i = J(l[2]), "%" == l[2].slice(-1) && (i *= 2.55), ("deg" == l[0].slice(-3) || "°" == l[0].slice(-1)) && (e /= 360), "hsba" == c[1].toLowerCase().slice(0, 4) && (n = J(l[3])), l[3] && "%" == l[3].slice(-1) && (n /= 100), r.hsb2rgb(e, a, i, n)) : c[6] ? (l = c[6][D](at), e = J(l[0]), "%" == l[0].slice(-1) && (e *= 2.55), a = J(l[1]), "%" == l[1].slice(-1) && (a *= 2.55), i = J(l[2]), "%" == l[2].slice(-1) && (i *= 2.55), ("deg" == l[0].slice(-3) || "°" == l[0].slice(-1)) && (e /= 360), "hsla" == c[1].toLowerCase().slice(0, 4) && (n = J(l[3])), l[3] && "%" == l[3].slice(-1) && (n /= 100), r.hsl2rgb(e, a, i, n)) : (c = {
			r: e,
			g: a,
			b: i,
			toString: o
		}, c.hex = "#" + (16777216 | i | a << 8 | e << 16).toString(16).slice(1), r.is(n, "finite") && (c.opacity = n), c)) : {
			r: -1,
			g: -1,
			b: -1,
			hex: "none",
			error: 1,
			toString: o
		}
	}, r), r.hsb = n(function(t, e, a) {
		return r.hsb2rgb(t, e, a).hex
	}), r.hsl = n(function(t, e, a) {
		return r.hsl2rgb(t, e, a).hex
	}), r.rgb = n(function(t, e, r) {
		return "#" + (16777216 | r | e << 8 | t << 16).toString(16).slice(1)
	}), r.getColor = function(t) {
		var e = this.getColor.start = this.getColor.start || {
				h: 0,
				s: 1,
				b: t || .75
			},
			r = this.hsb2rgb(e.h, e.s, e.b);
		return e.h += .075, e.h > 1 && (e.h = 0, e.s -= .2, e.s <= 0 && (this.getColor.start = {
			h: 0,
			s: 1,
			b: e.b
		})), r.hex
	}, r.getColor.reset = function() {
		delete this.start
	}, r.parsePathString = function(t) {
		if (!t) return null;
		var e = Ct(t);
		if (e.arr) return St(e.arr);
		var a = {
				a: 7,
				c: 6,
				h: 1,
				l: 2,
				m: 2,
				r: 4,
				q: 4,
				s: 4,
				t: 2,
				v: 1,
				z: 0
			},
			i = [];
		return r.is(t, W) && r.is(t[0], W) && (i = St(t)), i.length || O(t).replace(ot, function(t, e, r) {
			var n = [],
				o = e.toLowerCase();
			if (r.replace(lt, function(t, e) {
					e && n.push(+e)
				}), "m" == o && n.length > 2 && (i.push([e][N](n.splice(0, 2))), o = "l", e = "m" == e ? "l" : "L"), "r" == o) i.push([e][N](n));
			else
				for (; n.length >= a[o] && (i.push([e][N](n.splice(0, a[o]))), a[o]););
		}), i.toString = r._path2string, e.arr = St(i), i
	}, r.parseTransformString = n(function(t) {
		if (!t) return null;
		var e = [];
		return r.is(t, W) && r.is(t[0], W) && (e = St(t)), e.length || O(t).replace(st, function(t, r, a) {
			var i = [];
			P.call(r);
			a.replace(lt, function(t, e) {
				e && i.push(+e)
			}), e.push([r][N](i))
		}), e.toString = r._path2string, e
	});
	var Ct = function(t) {
		var e = Ct.ps = Ct.ps || {};
		return e[t] ? e[t].sleep = 100 : e[t] = {
			sleep: 100
		}, setTimeout(function() {
			for (var r in e) e[B](r) && r != t && (e[r].sleep--, !e[r].sleep && delete e[r])
		}), e[t]
	};
	r.findDotsAtSegment = function(t, e, r, a, i, n, o, s, l) {
		var c = 1 - l,
			h = $(c, 3),
			d = $(c, 2),
			u = l * l,
			p = u * l,
			f = h * t + 3 * d * l * r + 3 * c * l * l * i + p * o,
			g = h * e + 3 * d * l * a + 3 * c * l * l * n + p * s,
			m = t + 2 * l * (r - t) + u * (i - 2 * r + t),
			x = e + 2 * l * (a - e) + u * (n - 2 * a + e),
			v = r + 2 * l * (i - r) + u * (o - 2 * i + r),
			y = a + 2 * l * (n - a) + u * (s - 2 * n + a),
			_ = c * t + l * r,
			b = c * e + l * a,
			w = c * i + l * o,
			k = c * n + l * s,
			C = 90 - 180 * L.atan2(m - v, x - y) / Y;
		return (m > v || x < y) && (C += 180), {
			x: f,
			y: g,
			m: {
				x: m,
				y: x
			},
			n: {
				x: v,
				y: y
			},
			start: {
				x: _,
				y: b
			},
			end: {
				x: w,
				y: k
			},
			alpha: C
		}
	}, r.bezierBBox = function(t, e, a, i, n, o, s, l) {
		r.is(t, "array") || (t = [t, e, a, i, n, o, s, l]);
		var c = Ft.apply(null, t);
		return {
			x: c.min.x,
			y: c.min.y,
			x2: c.max.x,
			y2: c.max.y,
			width: c.max.x - c.min.x,
			height: c.max.y - c.min.y
		}
	}, r.isPointInsideBBox = function(t, e, r) {
		return e >= t.x && e <= t.x2 && r >= t.y && r <= t.y2
	}, r.isBBoxIntersect = function(t, e) {
		var a = r.isPointInsideBBox;
		return a(e, t.x, t.y) || a(e, t.x2, t.y) || a(e, t.x, t.y2) || a(e, t.x2, t.y2) || a(t, e.x, e.y) || a(t, e.x2, e.y) || a(t, e.x, e.y2) || a(t, e.x2, e.y2) || (t.x < e.x2 && t.x > e.x || e.x < t.x2 && e.x > t.x) && (t.y < e.y2 && t.y > e.y || e.y < t.y2 && e.y > t.y)
	}, r.pathIntersection = function(t, e) {
		return p(t, e)
	}, r.pathIntersectionNumber = function(t, e) {
		return p(t, e, 1)
	}, r.isPointInsidePath = function(t, e, a) {
		var i = r.pathBBox(t);
		return r.isPointInsideBBox(i, e, a) && p(t, [
			["M", e, a],
			["H", i.x2 + 10]
		], 1) % 2 == 1
	}, r._removedFactory = function(t) {
		return function() {
			e("raphael.log", null, "Raphaël: you are calling to method “" + t + "” of removed object", t)
		}
	};
	var Bt = r.pathBBox = function(t) {
			var e = Ct(t);
			if (e.bbox) return a(e.bbox);
			if (!t) return {
				x: 0,
				y: 0,
				width: 0,
				height: 0,
				x2: 0,
				y2: 0
			};
			for (var r, i = 0, n = 0, o = [], s = [], l = 0, c = (t = Ot(t)).length; l < c; l++)
				if ("M" == (r = t[l])[0]) i = r[1], n = r[2], o.push(i), s.push(n);
				else {
					var h = Ft(i, n, r[1], r[2], r[3], r[4], r[5], r[6]);
					o = o[N](h.min.x, h.max.x), s = s[N](h.min.y, h.max.y), i = r[5], n = r[6]
				}
			var d = j[M](0, o),
				u = j[M](0, s),
				p = H[M](0, o),
				f = H[M](0, s),
				g = p - d,
				m = f - u,
				x = {
					x: d,
					y: u,
					x2: p,
					y2: f,
					width: g,
					height: m,
					cx: d + g / 2,
					cy: u + m / 2
				};
			return e.bbox = a(x), x
		},
		St = function(t) {
			var e = a(t);
			return e.toString = r._path2string, e
		},
		It = r._pathToRelative = function(t) {
			var e = Ct(t);
			if (e.rel) return St(e.rel);
			r.is(t, W) && r.is(t && t[0], W) || (t = r.parsePathString(t));
			var a = [],
				i = 0,
				n = 0,
				o = 0,
				s = 0,
				l = 0;
			"M" == t[0][0] && (o = i = t[0][1], s = n = t[0][2], l++, a.push(["M", i, n]));
			for (var c = l, h = t.length; c < h; c++) {
				var d = a[c] = [],
					u = t[c];
				if (u[0] != P.call(u[0])) switch (d[0] = P.call(u[0]), d[0]) {
					case "a":
						d[1] = u[1], d[2] = u[2], d[3] = u[3], d[4] = u[4], d[5] = u[5], d[6] = +(u[6] - i).toFixed(3), d[7] = +(u[7] - n).toFixed(3);
						break;
					case "v":
						d[1] = +(u[1] - n).toFixed(3);
						break;
					case "m":
						o = u[1], s = u[2];
					default:
						for (var p = 1, f = u.length; p < f; p++) d[p] = +(u[p] - (p % 2 ? i : n)).toFixed(3)
				} else {
					d = a[c] = [], "m" == u[0] && (o = u[1] + i, s = u[2] + n);
					for (var g = 0, m = u.length; g < m; g++) a[c][g] = u[g]
				}
				var x = a[c].length;
				switch (a[c][0]) {
					case "z":
						i = o, n = s;
						break;
					case "h":
						i += +a[c][x - 1];
						break;
					case "v":
						n += +a[c][x - 1];
						break;
					default:
						i += +a[c][x - 2], n += +a[c][x - 1]
				}
			}
			return a.toString = r._path2string, e.rel = St(a), a
		},
		Tt = r._pathToAbsolute = function(t) {
			var e = Ct(t);
			if (e.abs) return St(e.abs);
			if (r.is(t, W) && r.is(t && t[0], W) || (t = r.parsePathString(t)), !t || !t.length) return [
				["M", 0, 0]
			];
			var a = [],
				i = 0,
				n = 0,
				o = 0,
				l = 0,
				c = 0;
			"M" == t[0][0] && (o = i = +t[0][1], l = n = +t[0][2], c++, a[0] = ["M", i, n]);
			for (var h, d, u = 3 == t.length && "M" == t[0][0] && "R" == t[1][0].toUpperCase() && "Z" == t[2][0].toUpperCase(), p = c, f = t.length; p < f; p++) {
				if (a.push(h = []), (d = t[p])[0] != tt.call(d[0])) switch (h[0] = tt.call(d[0]), h[0]) {
						case "A":
							h[1] = d[1], h[2] = d[2], h[3] = d[3], h[4] = d[4], h[5] = d[5], h[6] = +(d[6] + i), h[7] = +(d[7] + n);
							break;
						case "V":
							h[1] = +d[1] + n;
							break;
						case "H":
							h[1] = +d[1] + i;
							break;
						case "R":
							for (var g = [i, n][N](d.slice(1)), m = 2, x = g.length; m < x; m++) g[m] = +g[m] + i, g[++m] = +g[m] + n;
							a.pop(), a = a[N](s(g, u));
							break;
						case "M":
							o = +d[1] + i, l = +d[2] + n;
						default:
							for (m = 1, x = d.length; m < x; m++) h[m] = +d[m] + (m % 2 ? i : n)
					} else if ("R" == d[0]) g = [i, n][N](d.slice(1)), a.pop(), a = a[N](s(g, u)), h = ["R"][N](d.slice(-2));
					else
						for (var v = 0, y = d.length; v < y; v++) h[v] = d[v];
				switch (h[0]) {
					case "Z":
						i = o, n = l;
						break;
					case "H":
						i = h[1];
						break;
					case "V":
						n = h[1];
						break;
					case "M":
						o = h[h.length - 2], l = h[h.length - 1];
					default:
						i = h[h.length - 2], n = h[h.length - 1]
				}
			}
			return a.toString = r._path2string, e.abs = St(a), a
		},
		Mt = function(t, e, r, a) {
			return [t, e, r, a, r, a]
		},
		Nt = function(t, e, r, a, i, n) {
			return [1 / 3 * t + 2 / 3 * r, 1 / 3 * e + 2 / 3 * a, 1 / 3 * i + 2 / 3 * r, 1 / 3 * n + 2 / 3 * a, i, n]
		},
		At = function(t, e, r, a, i, o, s, l, c, h) {
			var d, u = 120 * Y / 180,
				p = Y / 180 * (+i || 0),
				f = [],
				g = n(function(t, e, r) {
					return {
						x: t * L.cos(r) - e * L.sin(r),
						y: t * L.sin(r) + e * L.cos(r)
					}
				});
			if (h) C = h[0], B = h[1], w = h[2], k = h[3];
			else {
				t = (d = g(t, e, -p)).x, e = d.y, l = (d = g(l, c, -p)).x, c = d.y;
				L.cos(Y / 180 * i), L.sin(Y / 180 * i);
				var m = (t - l) / 2,
					x = (e - c) / 2,
					v = m * m / (r * r) + x * x / (a * a);
				v > 1 && (r *= v = L.sqrt(v), a *= v);
				var y = r * r,
					_ = a * a,
					b = (o == s ? -1 : 1) * L.sqrt(q((y * _ - y * x * x - _ * m * m) / (y * x * x + _ * m * m))),
					w = b * r * x / a + (t + l) / 2,
					k = b * -a * m / r + (e + c) / 2,
					C = L.asin(((e - k) / a).toFixed(9)),
					B = L.asin(((c - k) / a).toFixed(9));
				C = t < w ? Y - C : C, B = l < w ? Y - B : B, C < 0 && (C = 2 * Y + C), B < 0 && (B = 2 * Y + B), s && C > B && (C -= 2 * Y), !s && B > C && (B -= 2 * Y)
			}
			var S = B - C;
			if (q(S) > u) {
				var I = B,
					T = l,
					M = c;
				B = C + u * (s && B > C ? 1 : -1), l = w + r * L.cos(B), c = k + a * L.sin(B), f = At(l, c, r, a, i, 0, s, T, M, [B, I, w, k])
			}
			S = B - C;
			var A = L.cos(C),
				z = L.sin(C),
				F = L.cos(B),
				O = L.sin(B),
				E = L.tan(S / 4),
				R = 4 / 3 * r * E,
				P = 4 / 3 * a * E,
				H = [t, e],
				j = [t + R * z, e - P * A],
				$ = [l + R * O, c - P * F],
				V = [l, c];
			if (j[0] = 2 * H[0] - j[0], j[1] = 2 * H[1] - j[1], h) return [j, $, V][N](f);
			for (var W = [], U = 0, X = (f = [j, $, V][N](f).join()[D](",")).length; U < X; U++) W[U] = U % 2 ? g(f[U - 1], f[U], p).y : g(f[U], f[U + 1], p).x;
			return W
		},
		zt = function(t, e, r, a, i, n, o, s, l) {
			var c = 1 - l;
			return {
				x: $(c, 3) * t + 3 * $(c, 2) * l * r + 3 * c * l * l * i + $(l, 3) * o,
				y: $(c, 3) * e + 3 * $(c, 2) * l * a + 3 * c * l * l * n + $(l, 3) * s
			}
		},
		Ft = n(function(t, e, r, a, i, n, o, s) {
			var l, c = i - 2 * r + t - (o - 2 * i + r),
				h = 2 * (r - t) - 2 * (i - r),
				d = t - r,
				u = (-h + L.sqrt(h * h - 4 * c * d)) / 2 / c,
				p = (-h - L.sqrt(h * h - 4 * c * d)) / 2 / c,
				f = [e, s],
				g = [t, o];
			return q(u) > "1e12" && (u = .5), q(p) > "1e12" && (p = .5), u > 0 && u < 1 && (l = zt(t, e, r, a, i, n, o, s, u), g.push(l.x), f.push(l.y)), p > 0 && p < 1 && (l = zt(t, e, r, a, i, n, o, s, p), g.push(l.x), f.push(l.y)), c = n - 2 * a + e - (s - 2 * n + a), h = 2 * (a - e) - 2 * (n - a), d = e - a, u = (-h + L.sqrt(h * h - 4 * c * d)) / 2 / c, p = (-h - L.sqrt(h * h - 4 * c * d)) / 2 / c, q(u) > "1e12" && (u = .5), q(p) > "1e12" && (p = .5), u > 0 && u < 1 && (l = zt(t, e, r, a, i, n, o, s, u), g.push(l.x), f.push(l.y)), p > 0 && p < 1 && (l = zt(t, e, r, a, i, n, o, s, p), g.push(l.x), f.push(l.y)), {
				min: {
					x: j[M](0, g),
					y: j[M](0, f)
				},
				max: {
					x: H[M](0, g),
					y: H[M](0, f)
				}
			}
		}),
		Ot = r._path2curve = n(function(t, e) {
			var r = !e && Ct(t);
			if (!e && r.curve) return St(r.curve);
			for (var a = Tt(t), i = e && Tt(e), n = {
					x: 0,
					y: 0,
					bx: 0,
					by: 0,
					X: 0,
					Y: 0,
					qx: null,
					qy: null
				}, o = {
					x: 0,
					y: 0,
					bx: 0,
					by: 0,
					X: 0,
					Y: 0,
					qx: null,
					qy: null
				}, s = function(t, e, r) {
					var a, i;
					if (!t) return ["C", e.x, e.y, e.x, e.y, e.x, e.y];
					switch (!(t[0] in {
						T: 1,
						Q: 1
					}) && (e.qx = e.qy = null), t[0]) {
						case "M":
							e.X = t[1], e.Y = t[2];
							break;
						case "A":
							t = ["C"][N](At[M](0, [e.x, e.y][N](t.slice(1))));
							break;
						case "S":
							"C" == r || "S" == r ? (a = 2 * e.x - e.bx, i = 2 * e.y - e.by) : (a = e.x, i = e.y), t = ["C", a, i][N](t.slice(1));
							break;
						case "T":
							"Q" == r || "T" == r ? (e.qx = 2 * e.x - e.qx, e.qy = 2 * e.y - e.qy) : (e.qx = e.x, e.qy = e.y), t = ["C"][N](Nt(e.x, e.y, e.qx, e.qy, t[1], t[2]));
							break;
						case "Q":
							e.qx = t[1], e.qy = t[2], t = ["C"][N](Nt(e.x, e.y, t[1], t[2], t[3], t[4]));
							break;
						case "L":
							t = ["C"][N](Mt(e.x, e.y, t[1], t[2]));
							break;
						case "H":
							t = ["C"][N](Mt(e.x, e.y, t[1], e.y));
							break;
						case "V":
							t = ["C"][N](Mt(e.x, e.y, e.x, t[1]));
							break;
						case "Z":
							t = ["C"][N](Mt(e.x, e.y, e.X, e.Y))
					}
					return t
				}, l = function(t, e) {
					if (t[e].length > 7) {
						t[e].shift();
						for (var r = t[e]; r.length;) t.splice(e++, 0, ["C"][N](r.splice(0, 6)));
						t.splice(e, 1), d = H(a.length, i && i.length || 0)
					}
				}, c = function(t, e, r, n, o) {
					t && e && "M" == t[o][0] && "M" != e[o][0] && (e.splice(o, 0, ["M", n.x, n.y]), r.bx = 0, r.by = 0, r.x = t[o][1], r.y = t[o][2], d = H(a.length, i && i.length || 0))
				}, h = 0, d = H(a.length, i && i.length || 0); h < d; h++) {
				a[h] = s(a[h], n), l(a, h), i && (i[h] = s(i[h], o)), i && l(i, h), c(a, i, n, o, h), c(i, a, o, n, h);
				var u = a[h],
					p = i && i[h],
					f = u.length,
					g = i && p.length;
				n.x = u[f - 2], n.y = u[f - 1], n.bx = J(u[f - 4]) || n.x, n.by = J(u[f - 3]) || n.y, o.bx = i && (J(p[g - 4]) || o.x), o.by = i && (J(p[g - 3]) || o.y), o.x = i && p[g - 2], o.y = i && p[g - 1]
			}
			return i || (r.curve = St(a)), i ? [a, i] : a
		}, null, St),
		Dt = (r._parseDots = n(function(t) {
			for (var e = [], a = 0, i = t.length; a < i; a++) {
				var n = {},
					o = t[a].match(/^([^:]*):?([\d\.]*)/);
				if (n.color = r.getRGB(o[1]), n.color.error) return null;
				n.color = n.color.hex, o[2] && (n.offset = o[2] + "%"), e.push(n)
			}
			for (a = 1, i = e.length - 1; a < i; a++)
				if (!e[a].offset) {
					for (var s = J(e[a - 1].offset || 0), l = 0, c = a + 1; c < i; c++)
						if (e[c].offset) {
							l = e[c].offset;
							break
						}
					l || (l = 100, c = i);
					for (var h = ((l = J(l)) - s) / (c - a + 1); a < c; a++) s += h, e[a].offset = s + "%"
				}
			return e
		}), r._tear = function(t, e) {
			t == e.top && (e.top = t.prev), t == e.bottom && (e.bottom = t.next), t.next && (t.next.prev = t.prev), t.prev && (t.prev.next = t.next)
		}),
		Et = (r._tofront = function(t, e) {
			e.top !== t && (Dt(t, e), t.next = null, t.prev = e.top, e.top.next = t, e.top = t)
		}, r._toback = function(t, e) {
			e.bottom !== t && (Dt(t, e), t.next = e.bottom, t.prev = null, e.bottom.prev = t, e.bottom = t)
		}, r._insertafter = function(t, e, r) {
			Dt(t, r), e == r.top && (r.top = t), e.next && (e.next.prev = t), t.next = e.next, t.prev = e, e.next = t
		}, r._insertbefore = function(t, e, r) {
			Dt(t, r), e == r.bottom && (r.bottom = t), e.prev && (e.prev.next = t), t.prev = e.prev, e.prev = t, t.next = e
		}, r.toMatrix = function(t, e) {
			var r = Bt(t),
				a = {
					_: {
						transform: z
					},
					getBBox: function() {
						return r
					}
				};
			return Rt(a, e), a.matrix
		}),
		Rt = (r.transformPath = function(t, e) {
			return gt(t, Et(t, e))
		}, r._extractTransform = function(t, e) {
			if (null == e) return t._.transform;
			e = O(e).replace(/\.{3}|\u2026/g, t._.transform || z);
			var a = r.parseTransformString(e),
				i = 0,
				n = 0,
				o = 0,
				s = 1,
				l = 1,
				c = t._,
				h = new f;
			if (c.transform = a || [], a)
				for (var d = 0, u = a.length; d < u; d++) {
					var p, g, m, x, v, y = a[d],
						_ = y.length,
						b = O(y[0]).toLowerCase(),
						w = y[0] != b,
						k = w ? h.invert() : 0;
					"t" == b && 3 == _ ? w ? (p = k.x(0, 0), g = k.y(0, 0), m = k.x(y[1], y[2]), x = k.y(y[1], y[2]), h.translate(m - p, x - g)) : h.translate(y[1], y[2]) : "r" == b ? 2 == _ ? (v = v || t.getBBox(1), h.rotate(y[1], v.x + v.width / 2, v.y + v.height / 2), i += y[1]) : 4 == _ && (w ? (m = k.x(y[2], y[3]), x = k.y(y[2], y[3]), h.rotate(y[1], m, x)) : h.rotate(y[1], y[2], y[3]), i += y[1]) : "s" == b ? 2 == _ || 3 == _ ? (v = v || t.getBBox(1), h.scale(y[1], y[_ - 1], v.x + v.width / 2, v.y + v.height / 2), s *= y[1], l *= y[_ - 1]) : 5 == _ && (w ? (m = k.x(y[3], y[4]), x = k.y(y[3], y[4]), h.scale(y[1], y[2], m, x)) : h.scale(y[1], y[2], y[3], y[4]), s *= y[1], l *= y[2]) : "m" == b && 7 == _ && h.add(y[1], y[2], y[3], y[4], y[5], y[6]), c.dirtyT = 1, t.matrix = h
				}
			t.matrix = h, c.sx = s, c.sy = l, c.deg = i, c.dx = n = h.e, c.dy = o = h.f, 1 == s && 1 == l && !i && c.bbox ? (c.bbox.x += +n, c.bbox.y += +o) : c.dirtyT = 1
		}),
		Pt = function(t) {
			var e = t[0];
			switch (e.toLowerCase()) {
				case "t":
					return [e, 0, 0];
				case "m":
					return [e, 1, 0, 0, 1, 0, 0];
				case "r":
					return 4 == t.length ? [e, 0, t[2], t[3]] : [e, 0];
				case "s":
					return 5 == t.length ? [e, 1, 1, t[3], t[4]] : 3 == t.length ? [e, 1, 1] : [e, 1]
			}
		},
		Lt = r._equaliseTransform = function(t, e) {
			e = O(e).replace(/\.{3}|\u2026/g, t), t = r.parseTransformString(t) || [], e = r.parseTransformString(e) || [];
			for (var a, i, n, o, s = H(t.length, e.length), l = [], c = [], h = 0; h < s; h++) {
				if (n = t[h] || Pt(e[h]), o = e[h] || Pt(n), n[0] != o[0] || "r" == n[0].toLowerCase() && (n[2] != o[2] || n[3] != o[3]) || "s" == n[0].toLowerCase() && (n[3] != o[3] || n[4] != o[4])) return;
				for (l[h] = [], c[h] = [], a = 0, i = H(n.length, o.length); a < i; a++) a in n && (l[h][a] = n[a]), a in o && (c[h][a] = o[a])
			}
			return {
				from: l,
				to: c
			}
		};
	r._getContainer = function(t, e, a, i) {
			var n;
			if (null != (n = null != i || r.is(t, "object") ? t : S.doc.getElementById(t))) return n.tagName ? null == e ? {
				container: n,
				width: n.style.pixelWidth || n.offsetWidth,
				height: n.style.pixelHeight || n.offsetHeight
			} : {
				container: n,
				width: e,
				height: a
			} : {
				container: 1,
				x: t,
				y: e,
				width: a,
				height: i
			}
		}, r.pathToRelative = It, r._engine = {}, r.path2curve = Ot, r.matrix = function(t, e, r, a, i, n) {
			return new f(t, e, r, a, i, n)
		},
		function(t) {
			function e(t) {
				return t[0] * t[0] + t[1] * t[1]
			}

			function a(t) {
				var r = L.sqrt(e(t));
				t[0] && (t[0] /= r), t[1] && (t[1] /= r)
			}
			t.add = function(t, e, r, a, i, n) {
				var o, s, l, c, h = [
						[],
						[],
						[]
					],
					d = [
						[this.a, this.c, this.e],
						[this.b, this.d, this.f],
						[0, 0, 1]
					],
					u = [
						[t, r, i],
						[e, a, n],
						[0, 0, 1]
					];
				for (t && t instanceof f && (u = [
						[t.a, t.c, t.e],
						[t.b, t.d, t.f],
						[0, 0, 1]
					]), o = 0; o < 3; o++)
					for (s = 0; s < 3; s++) {
						for (c = 0, l = 0; l < 3; l++) c += d[o][l] * u[l][s];
						h[o][s] = c
					}
				this.a = h[0][0], this.b = h[1][0], this.c = h[0][1], this.d = h[1][1], this.e = h[0][2], this.f = h[1][2]
			}, t.invert = function() {
				var t = this,
					e = t.a * t.d - t.b * t.c;
				return new f(t.d / e, -t.b / e, -t.c / e, t.a / e, (t.c * t.f - t.d * t.e) / e, (t.b * t.e - t.a * t.f) / e)
			}, t.clone = function() {
				return new f(this.a, this.b, this.c, this.d, this.e, this.f)
			}, t.translate = function(t, e) {
				this.add(1, 0, 0, 1, t, e)
			}, t.scale = function(t, e, r, a) {
				null == e && (e = t), (r || a) && this.add(1, 0, 0, 1, r, a), this.add(t, 0, 0, e, 0, 0), (r || a) && this.add(1, 0, 0, 1, -r, -a)
			}, t.rotate = function(t, e, a) {
				t = r.rad(t), e = e || 0, a = a || 0;
				var i = +L.cos(t).toFixed(9),
					n = +L.sin(t).toFixed(9);
				this.add(i, n, -n, i, e, a), this.add(1, 0, 0, 1, -e, -a)
			}, t.x = function(t, e) {
				return t * this.a + e * this.c + this.e
			}, t.y = function(t, e) {
				return t * this.b + e * this.d + this.f
			}, t.get = function(t) {
				return +this[O.fromCharCode(97 + t)].toFixed(4)
			}, t.toString = function() {
				return r.svg ? "matrix(" + [this.get(0), this.get(1), this.get(2), this.get(3), this.get(4), this.get(5)].join() + ")" : [this.get(0), this.get(2), this.get(1), this.get(3), 0, 0].join()
			}, t.toFilter = function() {
				return "progid:DXImageTransform.Microsoft.Matrix(M11=" + this.get(0) + ", M12=" + this.get(2) + ", M21=" + this.get(1) + ", M22=" + this.get(3) + ", Dx=" + this.get(4) + ", Dy=" + this.get(5) + ", sizingmethod='auto expand')"
			}, t.offset = function() {
				return [this.e.toFixed(4), this.f.toFixed(4)]
			}, t.split = function() {
				var t = {};
				t.dx = this.e, t.dy = this.f;
				var i = [
					[this.a, this.c],
					[this.b, this.d]
				];
				t.scalex = L.sqrt(e(i[0])), a(i[0]), t.shear = i[0][0] * i[1][0] + i[0][1] * i[1][1], i[1] = [i[1][0] - i[0][0] * t.shear, i[1][1] - i[0][1] * t.shear], t.scaley = L.sqrt(e(i[1])), a(i[1]), t.shear /= t.scaley;
				var n = -i[0][1],
					o = i[1][1];
				return o < 0 ? (t.rotate = r.deg(L.acos(o)), n < 0 && (t.rotate = 360 - t.rotate)) : t.rotate = r.deg(L.asin(n)), t.isSimple = !(+t.shear.toFixed(9) || t.scalex.toFixed(9) != t.scaley.toFixed(9) && t.rotate), t.isSuperSimple = !+t.shear.toFixed(9) && t.scalex.toFixed(9) == t.scaley.toFixed(9) && !t.rotate, t.noRotation = !+t.shear.toFixed(9) && !t.rotate, t
			}, t.toTransformString = function(t) {
				var e = t || this[D]();
				return e.isSimple ? (e.scalex = +e.scalex.toFixed(4), e.scaley = +e.scaley.toFixed(4), e.rotate = +e.rotate.toFixed(4), (e.dx || e.dy ? "t" + [e.dx, e.dy] : z) + (1 != e.scalex || 1 != e.scaley ? "s" + [e.scalex, e.scaley, 0, 0] : z) + (e.rotate ? "r" + [e.rotate, 0, 0] : z)) : "m" + [this.get(0), this.get(1), this.get(2), this.get(3), this.get(4), this.get(5)]
			}
		}(f.prototype);
	var Ht = navigator.userAgent.match(/Version\/(.*?)\s/) || navigator.userAgent.match(/Chrome\/(\d+)/);
	"Apple Computer, Inc." == navigator.vendor && (Ht && Ht[1] < 4 || "iP" == navigator.platform.slice(0, 2)) || "Google Inc." == navigator.vendor && Ht && Ht[1] < 8 ? b.safari = function() {
		var t = this.rect(-99, -99, this.width + 99, this.height + 99).attr({
			stroke: "none"
		});
		setTimeout(function() {
			t.remove()
		})
	} : b.safari = function() {};
	for (var jt = function() {
			this.returnValue = !1
		}, qt = function() {
			return this.originalEvent.preventDefault()
		}, $t = function() {
			this.cancelBubble = !0
		}, Yt = function() {
			return this.originalEvent.stopPropagation()
		}, Vt = function(t) {
			var e = S.doc.documentElement.scrollTop || S.doc.body.scrollTop,
				r = S.doc.documentElement.scrollLeft || S.doc.body.scrollLeft;
			return {
				x: t.clientX + r,
				y: t.clientY + e
			}
		}, Wt = S.doc.addEventListener ? function(t, e, r, a) {
			var i = function(t) {
				var e = Vt(t);
				return r.call(a, t, e.x, e.y)
			};
			if (t.addEventListener(e, i, !1), A && R[e]) {
				t.addEventListener(R[e], function(e) {
					for (var i = Vt(e), n = e, o = 0, s = e.targetTouches && e.targetTouches.length; o < s; o++)
						if (e.targetTouches[o].target == t) {
							(e = e.targetTouches[o]).originalEvent = n, e.preventDefault = qt, e.stopPropagation = Yt;
							break
						}
					return r.call(a, e, i.x, i.y)
				}, !1)
			}
			return function() {
				return t.removeEventListener(e, i, !1), A && R[e] && t.removeEventListener(R[e], i, !1), !0
			}
		} : S.doc.attachEvent ? function(t, e, r, a) {
			var i = function(t) {
				t = t || S.win.event;
				var e = S.doc.documentElement.scrollTop || S.doc.body.scrollTop,
					i = S.doc.documentElement.scrollLeft || S.doc.body.scrollLeft,
					n = t.clientX + i,
					o = t.clientY + e;
				return t.preventDefault = t.preventDefault || jt, t.stopPropagation = t.stopPropagation || $t, r.call(a, t, n, o)
			};
			t.attachEvent("on" + e, i);
			return function() {
				return t.detachEvent("on" + e, i), !0
			}
		} : void 0, Ut = [], Xt = function(t) {
			for (var r, a = t.clientX, i = t.clientY, n = S.doc.documentElement.scrollTop || S.doc.body.scrollTop, o = S.doc.documentElement.scrollLeft || S.doc.body.scrollLeft, s = Ut.length; s--;) {
				if (r = Ut[s], A && t.touches) {
					for (var l, c = t.touches.length; c--;)
						if ((l = t.touches[c]).identifier == r.el._drag.id) {
							a = l.clientX, i = l.clientY, (t.originalEvent ? t.originalEvent : t).preventDefault();
							break
						}
				} else t.preventDefault();
				var h, d = r.el.node,
					u = d.nextSibling,
					p = d.parentNode,
					f = d.style.display;
				S.win.opera && p.removeChild(d), d.style.display = "none", h = r.el.paper.getElementByPoint(a, i), d.style.display = f, S.win.opera && (u ? p.insertBefore(d, u) : p.appendChild(d)), h && e("raphael.drag.over." + r.el.id, r.el, h), a += o, i += n, e("raphael.drag.move." + r.el.id, r.move_scope || r.el, a - r.el._drag.x, i - r.el._drag.y, a, i, t)
			}
		}, Gt = function(t) {
			r.unmousemove(Xt).unmouseup(Gt);
			for (var a, i = Ut.length; i--;)(a = Ut[i]).el._drag = {}, e("raphael.drag.end." + a.el.id, a.end_scope || a.start_scope || a.move_scope || a.el, t);
			Ut = []
		}, Zt = r.el = {}, Kt = E.length; Kt--;) ! function(t) {
		r[t] = Zt[t] = function(e, a) {
			return r.is(e, "function") && (this.events = this.events || [], this.events.push({
				name: t,
				f: e,
				unbind: Wt(this.shape || this.node || S.doc, t, e, a || this)
			})), this
		}, r["un" + t] = Zt["un" + t] = function(e) {
			for (var a = this.events || [], i = a.length; i--;) a[i].name != t || !r.is(e, "undefined") && a[i].f != e || (a[i].unbind(), a.splice(i, 1), !a.length && delete this.events);
			return this
		}
	}(E[Kt]);
	Zt.data = function(t, a) {
		var i = ct[this.id] = ct[this.id] || {};
		if (0 == arguments.length) return i;
		if (1 == arguments.length) {
			if (r.is(t, "object")) {
				for (var n in t) t[B](n) && this.data(n, t[n]);
				return this
			}
			return e("raphael.data.get." + this.id, this, i[t], t), i[t]
		}
		return i[t] = a, e("raphael.data.set." + this.id, this, a, t), this
	}, Zt.removeData = function(t) {
		return null == t ? ct[this.id] = {} : ct[this.id] && delete ct[this.id][t], this
	}, Zt.getData = function() {
		return a(ct[this.id] || {})
	}, Zt.hover = function(t, e, r, a) {
		return this.mouseover(t, r).mouseout(e, a || r)
	}, Zt.unhover = function(t, e) {
		return this.unmouseover(t).unmouseout(e)
	};
	var Jt = [];
	Zt.drag = function(t, a, i, n, o, s) {
		function l(l) {
			(l.originalEvent || l).preventDefault();
			var c = l.clientX,
				h = l.clientY,
				d = S.doc.documentElement.scrollTop || S.doc.body.scrollTop,
				u = S.doc.documentElement.scrollLeft || S.doc.body.scrollLeft;
			if (this._drag.id = l.identifier, A && l.touches)
				for (var p, f = l.touches.length; f--;)
					if (p = l.touches[f], this._drag.id = p.identifier, p.identifier == this._drag.id) {
						c = p.clientX, h = p.clientY;
						break
					}
			this._drag.x = c + u, this._drag.y = h + d, !Ut.length && r.mousemove(Xt).mouseup(Gt), Ut.push({
				el: this,
				move_scope: n,
				start_scope: o,
				end_scope: s
			}), a && e.on("raphael.drag.start." + this.id, a), t && e.on("raphael.drag.move." + this.id, t), i && e.on("raphael.drag.end." + this.id, i), e("raphael.drag.start." + this.id, o || n || this, l.clientX + u, l.clientY + d, l)
		}
		return this._drag = {}, Jt.push({
			el: this,
			start: l
		}), this.mousedown(l), this
	}, Zt.onDragOver = function(t) {
		t ? e.on("raphael.drag.over." + this.id, t) : e.unbind("raphael.drag.over." + this.id)
	}, Zt.undrag = function() {
		for (var t = Jt.length; t--;) Jt[t].el == this && (this.unmousedown(Jt[t].start), Jt.splice(t, 1), e.unbind("raphael.drag.*." + this.id));
		!Jt.length && r.unmousemove(Xt).unmouseup(Gt), Ut = []
	}, b.circle = function(t, e, a) {
		var i = r._engine.circle(this, t || 0, e || 0, a || 0);
		return this.__set__ && this.__set__.push(i), i
	}, b.rect = function(t, e, a, i, n) {
		var o = r._engine.rect(this, t || 0, e || 0, a || 0, i || 0, n || 0);
		return this.__set__ && this.__set__.push(o), o
	}, b.ellipse = function(t, e, a, i) {
		var n = r._engine.ellipse(this, t || 0, e || 0, a || 0, i || 0);
		return this.__set__ && this.__set__.push(n), n
	}, b.path = function(t) {
		t && !r.is(t, "string") && !r.is(t[0], W) && (t += z);
		var e = r._engine.path(r.format[M](r, arguments), this);
		return this.__set__ && this.__set__.push(e), e
	}, b.image = function(t, e, a, i, n) {
		var o = r._engine.image(this, t || "about:blank", e || 0, a || 0, i || 0, n || 0);
		return this.__set__ && this.__set__.push(o), o
	}, b.text = function(t, e, a) {
		var i = r._engine.text(this, t || 0, e || 0, O(a));
		return this.__set__ && this.__set__.push(i), i
	}, b.set = function(t) {
		!r.is(t, "array") && (t = Array.prototype.splice.call(arguments, 0, arguments.length));
		var e = new he(t);
		return this.__set__ && this.__set__.push(e), e.paper = this, e.type = "set", e
	}, b.setStart = function(t) {
		this.__set__ = t || this.set()
	}, b.setFinish = function(t) {
		var e = this.__set__;
		return delete this.__set__, e
	}, b.setSize = function(t, e) {
		return r._engine.setSize.call(this, t, e)
	}, b.setViewBox = function(t, e, a, i, n) {
		return r._engine.setViewBox.call(this, t, e, a, i, n)
	}, b.top = b.bottom = null, b.raphael = r;
	var Qt = function(t) {
		var e = t.getBoundingClientRect(),
			r = t.ownerDocument,
			a = r.body,
			i = r.documentElement,
			n = i.clientTop || a.clientTop || 0,
			o = i.clientLeft || a.clientLeft || 0;
		return {
			y: e.top + (S.win.pageYOffset || i.scrollTop || a.scrollTop) - n,
			x: e.left + (S.win.pageXOffset || i.scrollLeft || a.scrollLeft) - o
		}
	};
	b.getElementByPoint = function(t, e) {
		var r = this,
			a = r.canvas,
			i = S.doc.elementFromPoint(t, e);
		if (S.win.opera && "svg" == i.tagName) {
			var n = Qt(a),
				o = a.createSVGRect();
			o.x = t - n.x, o.y = e - n.y, o.width = o.height = 1;
			var s = a.getIntersectionList(o, null);
			s.length && (i = s[s.length - 1])
		}
		if (!i) return null;
		for (; i.parentNode && i != a.parentNode && !i.raphael;) i = i.parentNode;
		return i == r.canvas.parentNode && (i = a), i = i && i.raphael ? r.getById(i.raphaelid) : null
	}, b.getElementsByBBox = function(t) {
		var e = this.set();
		return this.forEach(function(a) {
			r.isBBoxIntersect(a.getBBox(), t) && e.push(a)
		}), e
	}, b.getById = function(t) {
		for (var e = this.bottom; e;) {
			if (e.id == t) return e;
			e = e.next
		}
		return null
	}, b.forEach = function(t, e) {
		for (var r = this.bottom; r;) {
			if (!1 === t.call(e, r)) return this;
			r = r.next
		}
		return this
	}, b.getElementsByPoint = function(t, e) {
		var r = this.set();
		return this.forEach(function(a) {
			a.isPointInside(t, e) && r.push(a)
		}), r
	}, Zt.isPointInside = function(t, e) {
		var a = this.realPath = ft[this.type](this);
		return this.attr("transform") && this.attr("transform").length && (a = r.transformPath(a, this.attr("transform"))), r.isPointInsidePath(a, t, e)
	}, Zt.getBBox = function(t) {
		if (this.removed) return {};
		var e = this._;
		return t ? (!e.dirty && e.bboxwt || (this.realPath = ft[this.type](this), e.bboxwt = Bt(this.realPath), e.bboxwt.toString = g, e.dirty = 0), e.bboxwt) : ((e.dirty || e.dirtyT || !e.bbox) && (!e.dirty && this.realPath || (e.bboxwt = 0, this.realPath = ft[this.type](this)), e.bbox = Bt(gt(this.realPath, this.matrix)), e.bbox.toString = g, e.dirty = e.dirtyT = 0), e.bbox)
	}, Zt.clone = function() {
		if (this.removed) return null;
		var t = this.paper[this.type]().attr(this.attr());
		return this.__set__ && this.__set__.push(t), t
	}, Zt.glow = function(t) {
		if ("text" == this.type) return null;
		var e = {
				width: ((t = t || {}).width || 10) + (+this.attr("stroke-width") || 1),
				fill: t.fill || !1,
				opacity: t.opacity || .5,
				offsetx: t.offsetx || 0,
				offsety: t.offsety || 0,
				color: t.color || "#000"
			},
			r = e.width / 2,
			a = this.paper,
			i = a.set(),
			n = this.realPath || ft[this.type](this);
		n = this.matrix ? gt(n, this.matrix) : n;
		for (var o = 1; o < r + 1; o++) i.push(a.path(n).attr({
			stroke: e.color,
			fill: e.fill ? e.color : "none",
			"stroke-linejoin": "round",
			"stroke-linecap": "round",
			"stroke-width": +(e.width / r * o).toFixed(3),
			opacity: +(e.opacity / r).toFixed(3)
		}));
		return i.insertBefore(this).translate(e.offsetx, e.offsety)
	};
	var te = function(t, e, a, i, n, o, s, l, d) {
			return null == d ? c(t, e, a, i, n, o, s, l) : r.findDotsAtSegment(t, e, a, i, n, o, s, l, h(t, e, a, i, n, o, s, l, d))
		},
		ee = function(t, e) {
			return function(a, i, n) {
				for (var o, s, l, c, h, d = "", u = {}, p = 0, f = 0, g = (a = Ot(a)).length; f < g; f++) {
					if ("M" == (l = a[f])[0]) o = +l[1], s = +l[2];
					else {
						if (c = te(o, s, l[1], l[2], l[3], l[4], l[5], l[6]), p + c > i) {
							if (e && !u.start) {
								if (h = te(o, s, l[1], l[2], l[3], l[4], l[5], l[6], i - p), d += ["C" + h.start.x, h.start.y, h.m.x, h.m.y, h.x, h.y], n) return d;
								u.start = d, d = ["M" + h.x, h.y + "C" + h.n.x, h.n.y, h.end.x, h.end.y, l[5], l[6]].join(), p += c, o = +l[5], s = +l[6];
								continue
							}
							if (!t && !e) return h = te(o, s, l[1], l[2], l[3], l[4], l[5], l[6], i - p), {
								x: h.x,
								y: h.y,
								alpha: h.alpha
							}
						}
						p += c, o = +l[5], s = +l[6]
					}
					d += l.shift() + l
				}
				return u.end = d, (h = t ? p : e ? u : r.findDotsAtSegment(o, s, l[0], l[1], l[2], l[3], l[4], l[5], 1)).alpha && (h = {
					x: h.x,
					y: h.y,
					alpha: h.alpha
				}), h
			}
		},
		re = ee(1),
		ae = ee(),
		ie = ee(0, 1);
	r.getTotalLength = re, r.getPointAtLength = ae, r.getSubpath = function(t, e, r) {
		if (this.getTotalLength(t) - r < 1e-6) return ie(t, e).end;
		var a = ie(t, r, 1);
		return e ? ie(a, e).end : a
	}, Zt.getTotalLength = function() {
		var t = this.getPath();
		if (t) return this.node.getTotalLength ? this.node.getTotalLength() : re(t)
	}, Zt.getPointAtLength = function(t) {
		var e = this.getPath();
		if (e) return ae(e, t)
	}, Zt.getPath = function() {
		var t, e = r._getPath[this.type];
		if ("text" != this.type && "set" != this.type) return e && (t = e(this)), t
	}, Zt.getSubpath = function(t, e) {
		var a = this.getPath();
		if (a) return r.getSubpath(a, t, e)
	};
	var ne = r.easing_formulas = {
		linear: function(t) {
			return t
		},
		"<": function(t) {
			return $(t, 1.7)
		},
		">": function(t) {
			return $(t, .48)
		},
		"<>": function(t) {
			var e = .48 - t / 1.04,
				r = L.sqrt(.1734 + e * e),
				a = r - e,
				i = -r - e,
				n = $(q(a), 1 / 3) * (a < 0 ? -1 : 1) + $(q(i), 1 / 3) * (i < 0 ? -1 : 1) + .5;
			return 3 * (1 - n) * n * n + n * n * n
		},
		backIn: function(t) {
			var e = 1.70158;
			return t * t * ((e + 1) * t - e)
		},
		backOut: function(t) {
			var e = 1.70158;
			return (t -= 1) * t * ((e + 1) * t + e) + 1
		},
		elastic: function(t) {
			return t == !!t ? t : $(2, -10 * t) * L.sin(2 * Y * (t - .075) / .3) + 1
		},
		bounce: function(t) {
			var e = 7.5625,
				r = 2.75;
			return t < 1 / r ? e * t * t : t < 2 / r ? e * (t -= 1.5 / r) * t + .75 : t < 2.5 / r ? e * (t -= 2.25 / r) * t + .9375 : e * (t -= 2.625 / r) * t + .984375
		}
	};
	ne.easeIn = ne["ease-in"] = ne["<"], ne.easeOut = ne["ease-out"] = ne[">"], ne.easeInOut = ne["ease-in-out"] = ne["<>"], ne["back-in"] = ne.backIn, ne["back-out"] = ne.backOut;
	var oe = [],
		se = t.requestAnimationFrame || t.webkitRequestAnimationFrame || t.mozRequestAnimationFrame || t.oRequestAnimationFrame || t.msRequestAnimationFrame || function(t) {
			setTimeout(t, 16)
		},
		le = function() {
			for (var t = +new Date, a = 0; a < oe.length; a++) {
				var i = oe[a];
				if (!i.el.removed && !i.paused) {
					var n, o, s = t - i.start,
						l = i.ms,
						c = i.easing,
						h = i.from,
						d = i.diff,
						u = i.to,
						p = (i.t, i.el),
						f = {},
						g = {};
					if (i.initstatus ? (s = (i.initstatus * i.anim.top - i.prev) / (i.percent - i.prev) * l, i.status = i.initstatus, delete i.initstatus, i.stop && oe.splice(a--, 1)) : i.status = (i.prev + (i.percent - i.prev) * (s / l)) / i.anim.top, !(s < 0))
						if (s < l) {
							var m = c(s / l);
							for (var x in h)
								if (h[B](x)) {
									switch (rt[x]) {
										case V:
											n = +h[x] + m * l * d[x];
											break;
										case "colour":
											n = "rgb(" + [ce(K(h[x].r + m * l * d[x].r)), ce(K(h[x].g + m * l * d[x].g)), ce(K(h[x].b + m * l * d[x].b))].join(",") + ")";
											break;
										case "path":
											n = [];
											for (var y = 0, _ = h[x].length; y < _; y++) {
												n[y] = [h[x][y][0]];
												for (var b = 1, w = h[x][y].length; b < w; b++) n[y][b] = +h[x][y][b] + m * l * d[x][y][b];
												n[y] = n[y].join(F)
											}
											n = n.join(F);
											break;
										case "transform":
											if (d[x].real)
												for (n = [], y = 0, _ = h[x].length; y < _; y++)
													for (n[y] = [h[x][y][0]], b = 1, w = h[x][y].length; b < w; b++) n[y][b] = h[x][y][b] + m * l * d[x][y][b];
											else {
												var k = function(t) {
													return +h[x][t] + m * l * d[x][t]
												};
												n = [
													["m", k(0), k(1), k(2), k(3), k(4), k(5)]
												]
											}
											break;
										case "csv":
											if ("clip-rect" == x)
												for (n = [], y = 4; y--;) n[y] = +h[x][y] + m * l * d[x][y];
											break;
										default:
											var C = [][N](h[x]);
											for (n = [], y = p.paper.customAttributes[x].length; y--;) n[y] = +C[y] + m * l * d[x][y]
									}
									f[x] = n
								}
							p.attr(f),
								function(t, r, a) {
									setTimeout(function() {
										e("raphael.anim.frame." + t, r, a)
									})
								}(p.id, p, i.anim)
						} else {
							if (function(t, a, i) {
									setTimeout(function() {
										e("raphael.anim.frame." + a.id, a, i), e("raphael.anim.finish." + a.id, a, i), r.is(t, "function") && t.call(a)
									})
								}(i.callback, p, i.anim), p.attr(u), oe.splice(a--, 1), i.repeat > 1 && !i.next) {
								for (o in u) u[B](o) && (g[o] = i.totalOrigin[o]);
								i.el.attr(g), v(i.anim, i.el, i.anim.percents[0], null, i.totalOrigin, i.repeat - 1)
							}
							i.next && !i.stop && v(i.anim, i.el, i.next, null, i.totalOrigin, i.repeat)
						}
				}
			}
			r.svg && p && p.paper && p.paper.safari(), oe.length && se(le)
		},
		ce = function(t) {
			return t > 255 ? 255 : t < 0 ? 0 : t
		};
	Zt.animateWith = function(t, e, a, i, n, o) {
		var s = this;
		if (s.removed) return o && o.call(s), s;
		var l = a instanceof x ? a : r.animation(a, i, n, o);
		v(l, s, l.percents[0], null, s.attr());
		for (var c = 0, h = oe.length; c < h; c++)
			if (oe[c].anim == e && oe[c].el == t) {
				oe[h - 1].start = oe[c].start;
				break
			}
		return s
	}, Zt.onAnimation = function(t) {
		return t ? e.on("raphael.anim.frame." + this.id, t) : e.unbind("raphael.anim.frame." + this.id), this
	}, x.prototype.delay = function(t) {
		var e = new x(this.anim, this.ms);
		return e.times = this.times, e.del = +t || 0, e
	}, x.prototype.repeat = function(t) {
		var e = new x(this.anim, this.ms);
		return e.del = this.del, e.times = L.floor(H(t, 0)) || 1, e
	}, r.animation = function(t, e, a, i) {
		if (t instanceof x) return t;
		!r.is(a, "function") && a || (i = i || a || null, a = null), t = Object(t), e = +e || 0;
		var n, o, s = {};
		for (o in t) t[B](o) && J(o) != o && J(o) + "%" != o && (n = !0, s[o] = t[o]);
		return n ? (a && (s.easing = a), i && (s.callback = i), new x({
			100: s
		}, e)) : new x(t, e)
	}, Zt.animate = function(t, e, a, i) {
		var n = this;
		if (n.removed) return i && i.call(n), n;
		var o = t instanceof x ? t : r.animation(t, e, a, i);
		return v(o, n, o.percents[0], null, n.attr()), n
	}, Zt.setTime = function(t, e) {
		return t && null != e && this.status(t, j(e, t.ms) / t.ms), this
	}, Zt.status = function(t, e) {
		var r, a, i = [],
			n = 0;
		if (null != e) return v(t, this, -1, j(e, 1)), this;
		for (r = oe.length; n < r; n++)
			if ((a = oe[n]).el.id == this.id && (!t || a.anim == t)) {
				if (t) return a.status;
				i.push({
					anim: a.anim,
					status: a.status
				})
			}
		return t ? 0 : i
	}, Zt.pause = function(t) {
		for (var r = 0; r < oe.length; r++) oe[r].el.id != this.id || t && oe[r].anim != t || !1 !== e("raphael.anim.pause." + this.id, this, oe[r].anim) && (oe[r].paused = !0);
		return this
	}, Zt.resume = function(t) {
		for (var r = 0; r < oe.length; r++)
			if (oe[r].el.id == this.id && (!t || oe[r].anim == t)) {
				var a = oe[r];
				!1 !== e("raphael.anim.resume." + this.id, this, a.anim) && (delete a.paused, this.status(a.anim, a.status))
			}
		return this
	}, Zt.stop = function(t) {
		for (var r = 0; r < oe.length; r++) oe[r].el.id != this.id || t && oe[r].anim != t || !1 !== e("raphael.anim.stop." + this.id, this, oe[r].anim) && oe.splice(r--, 1);
		return this
	}, e.on("raphael.remove", y), e.on("raphael.clear", y), Zt.toString = function() {
		return "Raphaël’s object"
	};
	var he = function(t) {
			if (this.items = [], this.length = 0, this.type = "set", t)
				for (var e = 0, r = t.length; e < r; e++) !t[e] || t[e].constructor != Zt.constructor && t[e].constructor != he || (this[this.items.length] = this.items[this.items.length] = t[e], this.length++)
		},
		de = he.prototype;
	de.push = function() {
		for (var t, e, r = 0, a = arguments.length; r < a; r++) !(t = arguments[r]) || t.constructor != Zt.constructor && t.constructor != he || (this[e = this.items.length] = this.items[e] = t, this.length++);
		return this
	}, de.pop = function() {
		return this.length && delete this[this.length--], this.items.pop()
	}, de.forEach = function(t, e) {
		for (var r = 0, a = this.items.length; r < a; r++)
			if (!1 === t.call(e, this.items[r], r)) return this;
		return this
	};
	for (var ue in Zt) Zt[B](ue) && (de[ue] = function(t) {
		return function() {
			var e = arguments;
			return this.forEach(function(r) {
				r[t][M](r, e)
			})
		}
	}(ue));
	return de.attr = function(t, e) {
			if (t && r.is(t, W) && r.is(t[0], "object"))
				for (var a = 0, i = t.length; a < i; a++) this.items[a].attr(t[a]);
			else
				for (var n = 0, o = this.items.length; n < o; n++) this.items[n].attr(t, e);
			return this
		}, de.clear = function() {
			for (; this.length;) this.pop()
		}, de.splice = function(t, e, r) {
			t = t < 0 ? H(this.length + t, 0) : t, e = H(0, j(this.length - t, e));
			var a, i = [],
				n = [],
				o = [];
			for (a = 2; a < arguments.length; a++) o.push(arguments[a]);
			for (a = 0; a < e; a++) n.push(this[t + a]);
			for (; a < this.length - t; a++) i.push(this[t + a]);
			var s = o.length;
			for (a = 0; a < s + i.length; a++) this.items[t + a] = this[t + a] = a < s ? o[a] : i[a - s];
			for (a = this.items.length = this.length -= e - s; this[a];) delete this[a++];
			return new he(n)
		}, de.exclude = function(t) {
			for (var e = 0, r = this.length; e < r; e++)
				if (this[e] == t) return this.splice(e, 1), !0
		}, de.animate = function(t, e, a, i) {
			(r.is(a, "function") || !a) && (i = a || null);
			var n, o, s = this.items.length,
				l = s,
				c = this;
			if (!s) return this;
			i && (o = function() {
				!--s && i.call(c)
			}), a = r.is(a, "string") ? a : o;
			var h = r.animation(t, e, a, o);
			for (n = this.items[--l].animate(h); l--;) this.items[l] && !this.items[l].removed && this.items[l].animateWith(n, h, h), this.items[l] && !this.items[l].removed || s--;
			return this
		}, de.insertAfter = function(t) {
			for (var e = this.items.length; e--;) this.items[e].insertAfter(t);
			return this
		}, de.getBBox = function() {
			for (var t = [], e = [], r = [], a = [], i = this.items.length; i--;)
				if (!this.items[i].removed) {
					var n = this.items[i].getBBox();
					t.push(n.x), e.push(n.y), r.push(n.x + n.width), a.push(n.y + n.height)
				}
			return t = j[M](0, t), e = j[M](0, e), r = H[M](0, r), a = H[M](0, a), {
				x: t,
				y: e,
				x2: r,
				y2: a,
				width: r - t,
				height: a - e
			}
		}, de.clone = function(t) {
			t = this.paper.set();
			for (var e = 0, r = this.items.length; e < r; e++) t.push(this.items[e].clone());
			return t
		}, de.toString = function() {
			return "Raphaël‘s set"
		}, de.glow = function(t) {
			var e = this.paper.set();
			return this.forEach(function(r, a) {
				var i = r.glow(t);
				null != i && i.forEach(function(t, r) {
					e.push(t)
				})
			}), e
		}, de.isPointInside = function(t, e) {
			var r = !1;
			return this.forEach(function(a) {
				if (a.isPointInside(t, e)) return console.log("runned"), r = !0, !1
			}), r
		}, r.registerFont = function(t) {
			if (!t.face) return t;
			this.fonts = this.fonts || {};
			var e = {
					w: t.w,
					face: {},
					glyphs: {}
				},
				r = t.face["font-family"];
			for (var a in t.face) t.face[B](a) && (e.face[a] = t.face[a]);
			if (this.fonts[r] ? this.fonts[r].push(e) : this.fonts[r] = [e], !t.svg) {
				e.face["units-per-em"] = Q(t.face["units-per-em"], 10);
				for (var i in t.glyphs)
					if (t.glyphs[B](i)) {
						var n = t.glyphs[i];
						if (e.glyphs[i] = {
								w: n.w,
								k: {},
								d: n.d && "M" + n.d.replace(/[mlcxtrv]/g, function(t) {
									return {
										l: "L",
										c: "C",
										x: "z",
										t: "m",
										r: "l",
										v: "c"
									}[t] || "M"
								}) + "z"
							}, n.k)
							for (var o in n.k) n[B](o) && (e.glyphs[i].k[o] = n.k[o])
					}
			}
			return t
		}, b.getFont = function(t, e, a, i) {
			if (i = i || "normal", a = a || "normal", e = +e || {
					normal: 400,
					bold: 700,
					lighter: 300,
					bolder: 800
				}[e] || 400, r.fonts) {
				var n = r.fonts[t];
				if (!n) {
					var o = new RegExp("(^|\\s)" + t.replace(/[^\w\d\s+!~.:_-]/g, z) + "(\\s|$)", "i");
					for (var s in r.fonts)
						if (r.fonts[B](s) && o.test(s)) {
							n = r.fonts[s];
							break
						}
				}
				var l;
				if (n)
					for (var c = 0, h = n.length; c < h && ((l = n[c]).face["font-weight"] != e || l.face["font-style"] != a && l.face["font-style"] || l.face["font-stretch"] != i); c++);
				return l
			}
		}, b.print = function(t, e, a, i, n, o, s, l) {
			o = o || "middle", s = H(j(s || 0, 1), -1), l = H(j(l || 1, 3), 1);
			var c, h = O(a)[D](z),
				d = 0,
				u = 0,
				p = z;
			if (r.is(i, "string") && (i = this.getFont(i)), i) {
				c = (n || 16) / i.face["units-per-em"];
				for (var f = i.face.bbox[D](w), g = +f[0], m = f[3] - f[1], x = 0, v = +f[1] + ("baseline" == o ? m + +i.face.descent : m / 2), y = 0, _ = h.length; y < _; y++) {
					if ("\n" == h[y]) d = 0, k = 0, u = 0, x += m * l;
					else {
						var b = u && i.glyphs[h[y - 1]] || {},
							k = i.glyphs[h[y]];
						d += u ? (b.w || i.w) + (b.k && b.k[h[y]] || 0) + i.w * s : 0, u = 1
					}
					k && k.d && (p += r.transformPath(k.d, ["t", d * c, x * c, "s", c, c, g, v, "t", (t - g) / c, (e - v) / c]))
				}
			}
			return this.path(p).attr({
				fill: "#000",
				stroke: "none"
			})
		}, b.add = function(t) {
			if (r.is(t, "array"))
				for (var e, a = this.set(), i = 0, n = t.length; i < n; i++) e = t[i] || {}, k[B](e.type) && a.push(this[e.type]().attr(e));
			return a
		}, r.format = function(t, e) {
			var a = r.is(e, W) ? [0][N](e) : arguments;
			return t && r.is(t, "string") && a.length - 1 && (t = t.replace(C, function(t, e) {
				return null == a[++e] ? z : a[e]
			})), t || z
		}, r.fullfill = function() {
			var t = /\{([^\}]+)\}/g,
				e = /(?:(?:^|\.)(.+?)(?=\[|\.|$|\()|\[('|")(.+?)\2\])(\(\))?/g,
				r = function(t, r, a) {
					var i = a;
					return r.replace(e, function(t, e, r, a, n) {
						e = e || a, i && (e in i && (i = i[e]), "function" == typeof i && n && (i = i()))
					}), i = (null == i || i == a ? t : i) + ""
				};
			return function(e, a) {
				return String(e).replace(t, function(t, e) {
					return r(t, e, a)
				})
			}
		}(), r.ninja = function() {
			return I.was ? S.win.Raphael = I.is : delete Raphael, r
		}, r.st = de,
		function(t, e, a) {
			function i() {
				/in/.test(t.readyState) ? setTimeout(i, 9) : r.eve("raphael.DOMload")
			}
			null == t.readyState && t.addEventListener && (t.addEventListener("DOMContentLoaded", a = function() {
				t.removeEventListener("DOMContentLoaded", a, !1), t.readyState = "complete"
			}, !1), t.readyState = "loading"), i()
		}(document), e.on("raphael.DOMload", function() {
			_ = !0
		}),
		function() {
			if (r.svg) {
				var t = "hasOwnProperty",
					e = String,
					a = parseFloat,
					i = parseInt,
					n = Math,
					o = n.max,
					s = n.abs,
					l = n.pow,
					c = /[, ]+/,
					h = r.eve,
					d = "",
					u = " ",
					p = "http://www.w3.org/1999/xlink",
					f = {
						block: "M5,0 0,2.5 5,5z",
						classic: "M5,0 0,2.5 5,5 3.5,3 3.5,2z",
						diamond: "M2.5,0 5,2.5 2.5,5 0,2.5z",
						open: "M6,1 1,3.5 6,6",
						oval: "M2.5,0A2.5,2.5,0,0,1,2.5,5 2.5,2.5,0,0,1,2.5,0z"
					},
					g = {};
				r.toString = function() {
					return "Your browser supports SVG.\nYou are running Raphaël " + this.version
				};
				var m = function(a, i) {
						if (i) {
							"string" == typeof a && (a = m(a));
							for (var n in i) i[t](n) && ("xlink:" == n.substring(0, 6) ? a.setAttributeNS(p, n.substring(6), e(i[n])) : a.setAttribute(n, e(i[n])))
						} else(a = r._g.doc.createElementNS("http://www.w3.org/2000/svg", a)).style && (a.style.webkitTapHighlightColor = "rgba(0,0,0,0)");
						return a
					},
					x = function(t, i) {
						var c = "linear",
							h = t.id + i,
							u = .5,
							p = .5,
							f = t.node,
							g = t.paper,
							x = f.style,
							v = r._g.doc.getElementById(h);
						if (!v) {
							if (i = e(i).replace(r._radial_gradient, function(t, e, r) {
									if (c = "radial", e && r) {
										u = a(e);
										var i = 2 * ((p = a(r)) > .5) - 1;
										l(u - .5, 2) + l(p - .5, 2) > .25 && (p = n.sqrt(.25 - l(u - .5, 2)) * i + .5) && .5 != p && (p = p.toFixed(5) - 1e-5 * i)
									}
									return d
								}), i = i.split(/\s*\-\s*/), "linear" == c) {
								var y = i.shift();
								if (y = -a(y), isNaN(y)) return null;
								var _ = [0, 0, n.cos(r.rad(y)), n.sin(r.rad(y))],
									b = 1 / (o(s(_[2]), s(_[3])) || 1);
								_[2] *= b, _[3] *= b, _[2] < 0 && (_[0] = -_[2], _[2] = 0), _[3] < 0 && (_[1] = -_[3], _[3] = 0)
							}
							var w = r._parseDots(i);
							if (!w) return null;
							if (h = h.replace(/[\(\)\s,\xb0#]/g, "_"), t.gradient && h != t.gradient.id && (g.defs.removeChild(t.gradient), delete t.gradient), !t.gradient) {
								v = m(c + "Gradient", {
									id: h
								}), t.gradient = v, m(v, "radial" == c ? {
									fx: u,
									fy: p
								} : {
									x1: _[0],
									y1: _[1],
									x2: _[2],
									y2: _[3],
									gradientTransform: t.matrix.invert()
								}), g.defs.appendChild(v);
								for (var k = 0, C = w.length; k < C; k++) v.appendChild(m("stop", {
									offset: w[k].offset ? w[k].offset : k ? "100%" : "0%",
									"stop-color": w[k].color || "#fff"
								}))
							}
						}
						return m(f, {
							fill: "url(#" + h + ")",
							opacity: 1,
							"fill-opacity": 1
						}), x.fill = d, x.opacity = 1, x.fillOpacity = 1, 1
					},
					v = function(t) {
						var e = t.getBBox(1);
						m(t.pattern, {
							patternTransform: t.matrix.invert() + " translate(" + e.x + "," + e.y + ")"
						})
					},
					y = function(a, i, n) {
						if ("path" == a.type) {
							for (var o, s, l, c, h, u = e(i).toLowerCase().split("-"), p = a.paper, x = n ? "end" : "start", v = a.node, y = a.attrs, _ = y["stroke-width"], b = u.length, w = "classic", k = 3, C = 3, B = 5; b--;) switch (u[b]) {
								case "block":
								case "classic":
								case "oval":
								case "diamond":
								case "open":
								case "none":
									w = u[b];
									break;
								case "wide":
									C = 5;
									break;
								case "narrow":
									C = 2;
									break;
								case "long":
									k = 5;
									break;
								case "short":
									k = 2
							}
							if ("open" == w ? (k += 2, C += 2, B += 2, l = 1, c = n ? 4 : 1, h = {
									fill: "none",
									stroke: y.stroke
								}) : (c = l = k / 2, h = {
									fill: y.stroke,
									stroke: "none"
								}), a._.arrows ? n ? (a._.arrows.endPath && g[a._.arrows.endPath]--, a._.arrows.endMarker && g[a._.arrows.endMarker]--) : (a._.arrows.startPath && g[a._.arrows.startPath]--, a._.arrows.startMarker && g[a._.arrows.startMarker]--) : a._.arrows = {}, "none" != w) {
								var S = "raphael-marker-" + w,
									I = "raphael-marker-" + x + w + k + C;
								r._g.doc.getElementById(S) ? g[S]++ : (p.defs.appendChild(m(m("path"), {
									"stroke-linecap": "round",
									d: f[w],
									id: S
								})), g[S] = 1);
								var T, M = r._g.doc.getElementById(I);
								M ? (g[I]++, T = M.getElementsByTagName("use")[0]) : (M = m(m("marker"), {
									id: I,
									markerHeight: C,
									markerWidth: k,
									orient: "auto",
									refX: c,
									refY: C / 2
								}), T = m(m("use"), {
									"xlink:href": "#" + S,
									transform: (n ? "rotate(180 " + k / 2 + " " + C / 2 + ") " : d) + "scale(" + k / B + "," + C / B + ")",
									"stroke-width": (1 / ((k / B + C / B) / 2)).toFixed(4)
								}), M.appendChild(T), p.defs.appendChild(M), g[I] = 1), m(T, h);
								var N = l * ("diamond" != w && "oval" != w);
								n ? (o = a._.arrows.startdx * _ || 0, s = r.getTotalLength(y.path) - N * _) : (o = N * _, s = r.getTotalLength(y.path) - (a._.arrows.enddx * _ || 0)), (h = {})["marker-" + x] = "url(#" + I + ")", (s || o) && (h.d = r.getSubpath(y.path, o, s)), m(v, h), a._.arrows[x + "Path"] = S, a._.arrows[x + "Marker"] = I, a._.arrows[x + "dx"] = N, a._.arrows[x + "Type"] = w, a._.arrows[x + "String"] = i
							} else n ? (o = a._.arrows.startdx * _ || 0, s = r.getTotalLength(y.path) - o) : (o = 0, s = r.getTotalLength(y.path) - (a._.arrows.enddx * _ || 0)), a._.arrows[x + "Path"] && m(v, {
								d: r.getSubpath(y.path, o, s)
							}), delete a._.arrows[x + "Path"], delete a._.arrows[x + "Marker"], delete a._.arrows[x + "dx"], delete a._.arrows[x + "Type"], delete a._.arrows[x + "String"];
							for (h in g)
								if (g[t](h) && !g[h]) {
									var A = r._g.doc.getElementById(h);
									A && A.parentNode.removeChild(A)
								}
						}
					},
					_ = {
						"": [0],
						none: [0],
						"-": [3, 1],
						".": [1, 1],
						"-.": [3, 1, 1, 1],
						"-..": [3, 1, 1, 1, 1, 1],
						". ": [1, 3],
						"- ": [4, 3],
						"--": [8, 3],
						"- .": [4, 3, 1, 3],
						"--.": [8, 3, 1, 3],
						"--..": [8, 3, 1, 3, 1, 3]
					},
					b = function(t, r, a) {
						if (r = _[e(r).toLowerCase()]) {
							for (var i = t.attrs["stroke-width"] || "1", n = {
									round: i,
									square: i,
									butt: 0
								}[t.attrs["stroke-linecap"] || a["stroke-linecap"]] || 0, o = [], s = r.length; s--;) o[s] = r[s] * i + (s % 2 ? 1 : -1) * n;
							m(t.node, {
								"stroke-dasharray": o.join(",")
							})
						}
					},
					w = function(a, n) {
						var l = a.node,
							h = a.attrs,
							u = l.style.visibility;
						l.style.visibility = "hidden";
						for (var f in n)
							if (n[t](f)) {
								if (!r._availableAttrs[t](f)) continue;
								var g = n[f];
								switch (h[f] = g, f) {
									case "blur":
										a.blur(g);
										break;
									case "href":
									case "title":
										var _ = m("title"),
											w = r._g.doc.createTextNode(g);
										_.appendChild(w), l.appendChild(_);
										break;
									case "target":
										var C = l.parentNode;
										if ("a" != C.tagName.toLowerCase()) {
											_ = m("a");
											C.insertBefore(_, l), _.appendChild(l), C = _
										}
										"target" == f ? C.setAttributeNS(p, "show", "blank" == g ? "new" : g) : C.setAttributeNS(p, f, g);
										break;
									case "cursor":
										l.style.cursor = g;
										break;
									case "transform":
										a.transform(g);
										break;
									case "arrow-start":
										y(a, g);
										break;
									case "arrow-end":
										y(a, g, 1);
										break;
									case "clip-rect":
										var B = e(g).split(c);
										if (4 == B.length) {
											a.clip && a.clip.parentNode.parentNode.removeChild(a.clip.parentNode);
											var S = m("clipPath"),
												I = m("rect");
											S.id = r.createUUID(), m(I, {
												x: B[0],
												y: B[1],
												width: B[2],
												height: B[3]
											}), S.appendChild(I), a.paper.defs.appendChild(S), m(l, {
												"clip-path": "url(#" + S.id + ")"
											}), a.clip = I
										}
										if (!g) {
											var T = l.getAttribute("clip-path");
											if (T) {
												var M = r._g.doc.getElementById(T.replace(/(^url\(#|\)$)/g, d));
												M && M.parentNode.removeChild(M), m(l, {
													"clip-path": d
												}), delete a.clip
											}
										}
										break;
									case "path":
										"path" == a.type && (m(l, {
											d: g ? h.path = r._pathToAbsolute(g) : "M0,0"
										}), a._.dirty = 1, a._.arrows && ("startString" in a._.arrows && y(a, a._.arrows.startString), "endString" in a._.arrows && y(a, a._.arrows.endString, 1)));
										break;
									case "width":
										if (l.setAttribute(f, g), a._.dirty = 1, !h.fx) break;
										f = "x", g = h.x;
									case "x":
										h.fx && (g = -h.x - (h.width || 0));
									case "rx":
										if ("rx" == f && "rect" == a.type) break;
									case "cx":
										l.setAttribute(f, g), a.pattern && v(a), a._.dirty = 1;
										break;
									case "height":
										if (l.setAttribute(f, g), a._.dirty = 1, !h.fy) break;
										f = "y", g = h.y;
									case "y":
										h.fy && (g = -h.y - (h.height || 0));
									case "ry":
										if ("ry" == f && "rect" == a.type) break;
									case "cy":
										l.setAttribute(f, g), a.pattern && v(a), a._.dirty = 1;
										break;
									case "r":
										"rect" == a.type ? m(l, {
											rx: g,
											ry: g
										}) : l.setAttribute(f, g), a._.dirty = 1;
										break;
									case "src":
										"image" == a.type && l.setAttributeNS(p, "href", g);
										break;
									case "stroke-width":
										1 == a._.sx && 1 == a._.sy || (g /= o(s(a._.sx), s(a._.sy)) || 1), a.paper._vbSize && (g *= a.paper._vbSize), l.setAttribute(f, g), h["stroke-dasharray"] && b(a, h["stroke-dasharray"], n), a._.arrows && ("startString" in a._.arrows && y(a, a._.arrows.startString), "endString" in a._.arrows && y(a, a._.arrows.endString, 1));
										break;
									case "stroke-dasharray":
										b(a, g, n);
										break;
									case "fill":
										var N = e(g).match(r._ISURL);
										if (N) {
											S = m("pattern");
											var A = m("image");
											S.id = r.createUUID(), m(S, {
													x: 0,
													y: 0,
													patternUnits: "userSpaceOnUse",
													height: 1,
													width: 1
												}), m(A, {
													x: 0,
													y: 0,
													"xlink:href": N[1]
												}), S.appendChild(A),
												function(t) {
													r._preload(N[1], function() {
														var e = this.offsetWidth,
															r = this.offsetHeight;
														m(t, {
															width: e,
															height: r
														}), m(A, {
															width: e,
															height: r
														}), a.paper.safari()
													})
												}(S), a.paper.defs.appendChild(S), m(l, {
													fill: "url(#" + S.id + ")"
												}), a.pattern = S, a.pattern && v(a);
											break
										}
										var z = r.getRGB(g);
										if (z.error) {
											if (("circle" == a.type || "ellipse" == a.type || "r" != e(g).charAt()) && x(a, g)) {
												if ("opacity" in h || "fill-opacity" in h) {
													var F = r._g.doc.getElementById(l.getAttribute("fill").replace(/^url\(#|\)$/g, d));
													if (F) {
														var O = F.getElementsByTagName("stop");
														m(O[O.length - 1], {
															"stop-opacity": ("opacity" in h ? h.opacity : 1) * ("fill-opacity" in h ? h["fill-opacity"] : 1)
														})
													}
												}
												h.gradient = g, h.fill = "none";
												break
											}
										} else delete n.gradient, delete h.gradient, !r.is(h.opacity, "undefined") && r.is(n.opacity, "undefined") && m(l, {
											opacity: h.opacity
										}), !r.is(h["fill-opacity"], "undefined") && r.is(n["fill-opacity"], "undefined") && m(l, {
											"fill-opacity": h["fill-opacity"]
										});
										z[t]("opacity") && m(l, {
											"fill-opacity": z.opacity > 1 ? z.opacity / 100 : z.opacity
										});
									case "stroke":
										z = r.getRGB(g), l.setAttribute(f, z.hex), "stroke" == f && z[t]("opacity") && m(l, {
											"stroke-opacity": z.opacity > 1 ? z.opacity / 100 : z.opacity
										}), "stroke" == f && a._.arrows && ("startString" in a._.arrows && y(a, a._.arrows.startString), "endString" in a._.arrows && y(a, a._.arrows.endString, 1));
										break;
									case "gradient":
										("circle" == a.type || "ellipse" == a.type || "r" != e(g).charAt()) && x(a, g);
										break;
									case "opacity":
										h.gradient && !h[t]("stroke-opacity") && m(l, {
											"stroke-opacity": g > 1 ? g / 100 : g
										});
									case "fill-opacity":
										if (h.gradient) {
											(F = r._g.doc.getElementById(l.getAttribute("fill").replace(/^url\(#|\)$/g, d))) && (O = F.getElementsByTagName("stop"), m(O[O.length - 1], {
												"stop-opacity": g
											}));
											break
										}
									default:
										"font-size" == f && (g = i(g, 10) + "px");
										var D = f.replace(/(\-.)/g, function(t) {
											return t.substring(1).toUpperCase()
										});
										l.style[D] = g, a._.dirty = 1, l.setAttribute(f, g)
								}
							}
						k(a, n), l.style.visibility = u
					},
					k = function(a, n) {
						if ("text" == a.type && (n[t]("text") || n[t]("font") || n[t]("font-size") || n[t]("x") || n[t]("y"))) {
							var o = a.attrs,
								s = a.node,
								l = s.firstChild ? i(r._g.doc.defaultView.getComputedStyle(s.firstChild, d).getPropertyValue("font-size"), 10) : 10;
							if (n[t]("text")) {
								for (o.text = n.text; s.firstChild;) s.removeChild(s.firstChild);
								for (var c, h = e(n.text).split("\n"), u = [], p = 0, f = h.length; p < f; p++) c = m("tspan"), p && m(c, {
									dy: 1.2 * l,
									x: o.x
								}), c.appendChild(r._g.doc.createTextNode(h[p])), s.appendChild(c), u[p] = c
							} else
								for (p = 0, f = (u = s.getElementsByTagName("tspan")).length; p < f; p++) p ? m(u[p], {
									dy: 1.2 * l,
									x: o.x
								}) : m(u[0], {
									dy: 0
								});
							m(s, {
								x: o.x,
								y: o.y
							}), a._.dirty = 1;
							var g = a._getBBox(),
								x = o.y - (g.y + g.height / 2);
							x && r.is(x, "finite") && m(u[0], {
								dy: x
							})
						}
					},
					C = function(t, e) {
						this[0] = this.node = t, t.raphael = !0, this.id = r._oid++, t.raphaelid = this.id, this.matrix = r.matrix(), this.realPath = null, this.paper = e, this.attrs = this.attrs || {}, this._ = {
							transform: [],
							sx: 1,
							sy: 1,
							deg: 0,
							dx: 0,
							dy: 0,
							dirty: 1
						}, !e.bottom && (e.bottom = this), this.prev = e.top, e.top && (e.top.next = this), e.top = this, this.next = null
					},
					B = r.el;
				C.prototype = B, B.constructor = C, r._engine.path = function(t, e) {
					var r = m("path");
					e.canvas && e.canvas.appendChild(r);
					var a = new C(r, e);
					return a.type = "path", w(a, {
						fill: "none",
						stroke: "#000",
						path: t
					}), a
				}, B.rotate = function(t, r, i) {
					if (this.removed) return this;
					if ((t = e(t).split(c)).length - 1 && (r = a(t[1]), i = a(t[2])), t = a(t[0]), null == i && (r = i), null == r || null == i) {
						var n = this.getBBox(1);
						r = n.x + n.width / 2, i = n.y + n.height / 2
					}
					return this.transform(this._.transform.concat([
						["r", t, r, i]
					])), this
				}, B.scale = function(t, r, i, n) {
					if (this.removed) return this;
					if ((t = e(t).split(c)).length - 1 && (r = a(t[1]), i = a(t[2]), n = a(t[3])), t = a(t[0]), null == r && (r = t), null == n && (i = n), null == i || null == n) var o = this.getBBox(1);
					return i = null == i ? o.x + o.width / 2 : i, n = null == n ? o.y + o.height / 2 : n, this.transform(this._.transform.concat([
						["s", t, r, i, n]
					])), this
				}, B.translate = function(t, r) {
					return this.removed ? this : ((t = e(t).split(c)).length - 1 && (r = a(t[1])), t = a(t[0]) || 0, r = +r || 0, this.transform(this._.transform.concat([
						["t", t, r]
					])), this)
				}, B.transform = function(e) {
					var a = this._;
					if (null == e) return a.transform;
					if (r._extractTransform(this, e), this.clip && m(this.clip, {
							transform: this.matrix.invert()
						}), this.pattern && v(this), this.node && m(this.node, {
							transform: this.matrix
						}), 1 != a.sx || 1 != a.sy) {
						var i = this.attrs[t]("stroke-width") ? this.attrs["stroke-width"] : 1;
						this.attr({
							"stroke-width": i
						})
					}
					return this
				}, B.hide = function() {
					return !this.removed && this.paper.safari(this.node.style.display = "none"), this
				}, B.show = function() {
					return !this.removed && this.paper.safari(this.node.style.display = ""), this
				}, B.remove = function() {
					if (!this.removed && this.node.parentNode) {
						var t = this.paper;
						t.__set__ && t.__set__.exclude(this), h.unbind("raphael.*.*." + this.id), this.gradient && t.defs.removeChild(this.gradient), r._tear(this, t), "a" == this.node.parentNode.tagName.toLowerCase() ? this.node.parentNode.parentNode.removeChild(this.node.parentNode) : this.node.parentNode.removeChild(this.node);
						for (var e in this) this[e] = "function" == typeof this[e] ? r._removedFactory(e) : null;
						this.removed = !0
					}
				}, B._getBBox = function() {
					if ("none" == this.node.style.display) {
						this.show();
						var t = !0
					}
					var e = {};
					try {
						e = this.node.getBBox()
					} catch (t) {} finally {
						e = e || {}
					}
					return t && this.hide(), e
				}, B.attr = function(e, a) {
					if (this.removed) return this;
					if (null == e) {
						var i = {};
						for (var n in this.attrs) this.attrs[t](n) && (i[n] = this.attrs[n]);
						return i.gradient && "none" == i.fill && (i.fill = i.gradient) && delete i.gradient, i.transform = this._.transform, i
					}
					if (null == a && r.is(e, "string")) {
						if ("fill" == e && "none" == this.attrs.fill && this.attrs.gradient) return this.attrs.gradient;
						if ("transform" == e) return this._.transform;
						for (var o = e.split(c), s = {}, l = 0, d = o.length; l < d; l++)(e = o[l]) in this.attrs ? s[e] = this.attrs[e] : r.is(this.paper.customAttributes[e], "function") ? s[e] = this.paper.customAttributes[e].def : s[e] = r._availableAttrs[e];
						return d - 1 ? s : s[o[0]]
					}
					if (null == a && r.is(e, "array")) {
						for (s = {}, l = 0, d = e.length; l < d; l++) s[e[l]] = this.attr(e[l]);
						return s
					}
					if (null != a) {
						var u = {};
						u[e] = a
					} else null != e && r.is(e, "object") && (u = e);
					for (var p in u) h("raphael.attr." + p + "." + this.id, this, u[p]);
					for (p in this.paper.customAttributes)
						if (this.paper.customAttributes[t](p) && u[t](p) && r.is(this.paper.customAttributes[p], "function")) {
							var f = this.paper.customAttributes[p].apply(this, [].concat(u[p]));
							this.attrs[p] = u[p];
							for (var g in f) f[t](g) && (u[g] = f[g])
						}
					return w(this, u), this
				}, B.toFront = function() {
					if (this.removed) return this;
					"a" == this.node.parentNode.tagName.toLowerCase() ? this.node.parentNode.parentNode.appendChild(this.node.parentNode) : this.node.parentNode.appendChild(this.node);
					var t = this.paper;
					return t.top != this && r._tofront(this, t), this
				}, B.toBack = function() {
					if (this.removed) return this;
					var t = this.node.parentNode;
					"a" == t.tagName.toLowerCase() ? t.parentNode.insertBefore(this.node.parentNode, this.node.parentNode.parentNode.firstChild) : t.firstChild != this.node && t.insertBefore(this.node, this.node.parentNode.firstChild), r._toback(this, this.paper);
					this.paper;
					return this
				}, B.insertAfter = function(t) {
					if (this.removed) return this;
					var e = t.node || t[t.length - 1].node;
					return e.nextSibling ? e.parentNode.insertBefore(this.node, e.nextSibling) : e.parentNode.appendChild(this.node), r._insertafter(this, t, this.paper), this
				}, B.insertBefore = function(t) {
					if (this.removed) return this;
					var e = t.node || t[0].node;
					return e.parentNode.insertBefore(this.node, e), r._insertbefore(this, t, this.paper), this
				}, B.blur = function(t) {
					var e = this;
					if (0 != +t) {
						var a = m("filter"),
							i = m("feGaussianBlur");
						e.attrs.blur = t, a.id = r.createUUID(), m(i, {
							stdDeviation: +t || 1.5
						}), a.appendChild(i), e.paper.defs.appendChild(a), e._blur = a, m(e.node, {
							filter: "url(#" + a.id + ")"
						})
					} else e._blur && (e._blur.parentNode.removeChild(e._blur), delete e._blur, delete e.attrs.blur), e.node.removeAttribute("filter");
					return e
				}, r._engine.circle = function(t, e, r, a) {
					var i = m("circle");
					t.canvas && t.canvas.appendChild(i);
					var n = new C(i, t);
					return n.attrs = {
						cx: e,
						cy: r,
						r: a,
						fill: "none",
						stroke: "#000"
					}, n.type = "circle", m(i, n.attrs), n
				}, r._engine.rect = function(t, e, r, a, i, n) {
					var o = m("rect");
					t.canvas && t.canvas.appendChild(o);
					var s = new C(o, t);
					return s.attrs = {
						x: e,
						y: r,
						width: a,
						height: i,
						r: n || 0,
						rx: n || 0,
						ry: n || 0,
						fill: "none",
						stroke: "#000"
					}, s.type = "rect", m(o, s.attrs), s
				}, r._engine.ellipse = function(t, e, r, a, i) {
					var n = m("ellipse");
					t.canvas && t.canvas.appendChild(n);
					var o = new C(n, t);
					return o.attrs = {
						cx: e,
						cy: r,
						rx: a,
						ry: i,
						fill: "none",
						stroke: "#000"
					}, o.type = "ellipse", m(n, o.attrs), o
				}, r._engine.image = function(t, e, r, a, i, n) {
					var o = m("image");
					m(o, {
						x: r,
						y: a,
						width: i,
						height: n,
						preserveAspectRatio: "none"
					}), o.setAttributeNS(p, "href", e), t.canvas && t.canvas.appendChild(o);
					var s = new C(o, t);
					return s.attrs = {
						x: r,
						y: a,
						width: i,
						height: n,
						src: e
					}, s.type = "image", s
				}, r._engine.text = function(t, e, a, i) {
					var n = m("text");
					t.canvas && t.canvas.appendChild(n);
					var o = new C(n, t);
					return o.attrs = {
						x: e,
						y: a,
						"text-anchor": "middle",
						text: i,
						font: r._availableAttrs.font,
						stroke: "none",
						fill: "#000"
					}, o.type = "text", w(o, o.attrs), o
				}, r._engine.setSize = function(t, e) {
					return this.width = t || this.width, this.height = e || this.height, this.canvas.setAttribute("width", this.width), this.canvas.setAttribute("height", this.height), this._viewBox && this.setViewBox.apply(this, this._viewBox), this
				}, r._engine.create = function() {
					var t = r._getContainer.apply(0, arguments),
						e = t && t.container,
						a = t.x,
						i = t.y,
						n = t.width,
						o = t.height;
					if (!e) throw new Error("SVG container not found.");
					var s, l = m("svg"),
						c = "overflow:hidden;";
					return a = a || 0, i = i || 0, n = n || 512, o = o || 342, m(l, {
						height: o,
						version: 1.1,
						width: n,
						xmlns: "http://www.w3.org/2000/svg"
					}), 1 == e ? (l.style.cssText = c + "position:absolute;left:" + a + "px;top:" + i + "px", r._g.doc.body.appendChild(l), s = 1) : (l.style.cssText = c + "position:relative", e.firstChild ? e.insertBefore(l, e.firstChild) : e.appendChild(l)), e = new r._Paper, e.width = n, e.height = o, e.canvas = l, e.clear(), e._left = e._top = 0, s && (e.renderfix = function() {}), e.renderfix(), e
				}, r._engine.setViewBox = function(t, e, r, a, i) {
					h("raphael.setViewBox", this, this._viewBox, [t, e, r, a, i]);
					var n, s, l = o(r / this.width, a / this.height),
						c = this.top,
						d = i ? "meet" : "xMinYMin";
					for (null == t ? (this._vbSize && (l = 1), delete this._vbSize, n = "0 0 " + this.width + u + this.height) : (this._vbSize = l, n = t + u + e + u + r + u + a), m(this.canvas, {
							viewBox: n,
							preserveAspectRatio: d
						}); l && c;) s = "stroke-width" in c.attrs ? c.attrs["stroke-width"] : 1, c.attr({
						"stroke-width": s
					}), c._.dirty = 1, c._.dirtyT = 1, c = c.prev;
					return this._viewBox = [t, e, r, a, !!i], this
				}, r.prototype.renderfix = function() {
					var t, e = this.canvas,
						r = e.style;
					try {
						t = e.getScreenCTM() || e.createSVGMatrix()
					} catch (r) {
						t = e.createSVGMatrix()
					}
					var a = -t.e % 1,
						i = -t.f % 1;
					(a || i) && (a && (this._left = (this._left + a) % 1, r.left = this._left + "px"), i && (this._top = (this._top + i) % 1, r.top = this._top + "px"))
				}, r.prototype.clear = function() {
					r.eve("raphael.clear", this);
					for (var t = this.canvas; t.firstChild;) t.removeChild(t.firstChild);
					this.bottom = this.top = null, (this.desc = m("desc")).appendChild(r._g.doc.createTextNode("Created with Raphaël " + r.version)), t.appendChild(this.desc), t.appendChild(this.defs = m("defs"))
				}, r.prototype.remove = function() {
					h("raphael.remove", this), this.canvas.parentNode && this.canvas.parentNode.removeChild(this.canvas);
					for (var t in this) this[t] = "function" == typeof this[t] ? r._removedFactory(t) : null
				};
				var S = r.st;
				for (var I in B) B[t](I) && !S[t](I) && (S[I] = function(t) {
					return function() {
						var e = arguments;
						return this.forEach(function(r) {
							r[t].apply(r, e)
						})
					}
				}(I))
			}
		}(),
		function() {
			if (r.vml) {
				var t = "hasOwnProperty",
					e = String,
					a = parseFloat,
					i = Math,
					n = i.round,
					o = i.max,
					s = i.min,
					l = i.abs,
					c = /[, ]+/,
					h = r.eve,
					d = " ",
					u = "",
					p = {
						M: "m",
						L: "l",
						C: "c",
						Z: "x",
						m: "t",
						l: "r",
						c: "v",
						z: "x"
					},
					f = /([clmz]),?([^clmz]*)/gi,
					g = / progid:\S+Blur\([^\)]+\)/g,
					m = /-?[^,\s-]+/g,
					x = "position:absolute;left:0;top:0;width:1px;height:1px",
					v = 21600,
					y = {
						path: 1,
						rect: 1,
						image: 1
					},
					_ = {
						circle: 1,
						ellipse: 1
					},
					b = function(t) {
						var a = /[ahqstv]/gi,
							i = r._pathToAbsolute;
						if (e(t).match(a) && (i = r._path2curve), a = /[clmz]/g, i == r._pathToAbsolute && !e(t).match(a)) {
							var o = e(t).replace(f, function(t, e, r) {
								var a = [],
									i = "m" == e.toLowerCase(),
									o = p[e];
								return r.replace(m, function(t) {
									i && 2 == a.length && (o += a + p["m" == e ? "l" : "L"], a = []), a.push(n(t * v))
								}), o + a
							});
							return o
						}
						var s, l, c = i(t);
						o = [];
						for (var h = 0, g = c.length; h < g; h++) {
							s = c[h], "z" == (l = c[h][0].toLowerCase()) && (l = "x");
							for (var x = 1, y = s.length; x < y; x++) l += n(s[x] * v) + (x != y - 1 ? "," : u);
							o.push(l)
						}
						return o.join(d)
					},
					w = function(t, e, a) {
						var i = r.matrix();
						return i.rotate(-t, .5, .5), {
							dx: i.x(e, a),
							dy: i.y(e, a)
						}
					},
					k = function(t, e, r, a, i, n) {
						var o = t._,
							s = t.matrix,
							c = o.fillpos,
							h = t.node,
							u = h.style,
							p = 1,
							f = "",
							g = v / e,
							m = v / r;
						if (u.visibility = "hidden", e && r) {
							if (h.coordsize = l(g) + d + l(m), u.rotation = n * (e * r < 0 ? -1 : 1), n) {
								var x = w(n, a, i);
								a = x.dx, i = x.dy
							}
							if (e < 0 && (f += "x"), r < 0 && (f += " y") && (p = -1), u.flip = f, h.coordorigin = a * -g + d + i * -m, c || o.fillsize) {
								var y = h.getElementsByTagName("fill");
								y = y && y[0], h.removeChild(y), c && (x = w(n, s.x(c[0], c[1]), s.y(c[0], c[1])), y.position = x.dx * p + d + x.dy * p), o.fillsize && (y.size = o.fillsize[0] * l(e) + d + o.fillsize[1] * l(r)), h.appendChild(y)
							}
							u.visibility = "visible"
						}
					};
				r.toString = function() {
					return "Your browser doesn’t support SVG. Falling down to VML.\nYou are running Raphaël " + this.version
				};
				var C = function(t, r, a) {
						for (var i = e(r).toLowerCase().split("-"), n = a ? "end" : "start", o = i.length, s = "classic", l = "medium", c = "medium"; o--;) switch (i[o]) {
							case "block":
							case "classic":
							case "oval":
							case "diamond":
							case "open":
							case "none":
								s = i[o];
								break;
							case "wide":
							case "narrow":
								c = i[o];
								break;
							case "long":
							case "short":
								l = i[o]
						}
						var h = t.node.getElementsByTagName("stroke")[0];
						h[n + "arrow"] = s, h[n + "arrowlength"] = l, h[n + "arrowwidth"] = c
					},
					B = function(i, l) {
						i.attrs = i.attrs || {};
						var h = i.node,
							p = i.attrs,
							f = h.style,
							g = y[i.type] && (l.x != p.x || l.y != p.y || l.width != p.width || l.height != p.height || l.cx != p.cx || l.cy != p.cy || l.rx != p.rx || l.ry != p.ry || l.r != p.r),
							m = _[i.type] && (p.cx != l.cx || p.cy != l.cy || p.r != l.r || p.rx != l.rx || p.ry != l.ry),
							x = i;
						for (var w in l) l[t](w) && (p[w] = l[w]);
						if (g && (p.path = r._getPath[i.type](i), i._.dirty = 1), l.href && (h.href = l.href), l.title && (h.title = l.title), l.target && (h.target = l.target), l.cursor && (f.cursor = l.cursor), "blur" in l && i.blur(l.blur), (l.path && "path" == i.type || g) && (h.path = b(~e(p.path).toLowerCase().indexOf("r") ? r._pathToAbsolute(p.path) : p.path), "image" == i.type && (i._.fillpos = [p.x, p.y], i._.fillsize = [p.width, p.height], k(i, 1, 1, 0, 0, 0))), "transform" in l && i.transform(l.transform), m) {
							var B = +p.cx,
								I = +p.cy,
								T = +p.rx || +p.r || 0,
								N = +p.ry || +p.r || 0;
							h.path = r.format("ar{0},{1},{2},{3},{4},{1},{4},{1}x", n((B - T) * v), n((I - N) * v), n((B + T) * v), n((I + N) * v), n(B * v)), i._.dirty = 1
						}
						if ("clip-rect" in l) {
							var A = e(l["clip-rect"]).split(c);
							if (4 == A.length) {
								A[2] = +A[2] + +A[0], A[3] = +A[3] + +A[1];
								var z = h.clipRect || r._g.doc.createElement("div"),
									F = z.style;
								F.clip = r.format("rect({1}px {2}px {3}px {0}px)", A), h.clipRect || (F.position = "absolute", F.top = 0, F.left = 0, F.width = i.paper.width + "px", F.height = i.paper.height + "px", h.parentNode.insertBefore(z, h), z.appendChild(h), h.clipRect = z)
							}
							l["clip-rect"] || h.clipRect && (h.clipRect.style.clip = "auto")
						}
						if (i.textpath) {
							var O = i.textpath.style;
							l.font && (O.font = l.font), l["font-family"] && (O.fontFamily = '"' + l["font-family"].split(",")[0].replace(/^['"]+|['"]+$/g, u) + '"'), l["font-size"] && (O.fontSize = l["font-size"]), l["font-weight"] && (O.fontWeight = l["font-weight"]), l["font-style"] && (O.fontStyle = l["font-style"])
						}
						if ("arrow-start" in l && C(x, l["arrow-start"]), "arrow-end" in l && C(x, l["arrow-end"], 1), null != l.opacity || null != l["stroke-width"] || null != l.fill || null != l.src || null != l.stroke || null != l["stroke-width"] || null != l["stroke-opacity"] || null != l["fill-opacity"] || null != l["stroke-dasharray"] || null != l["stroke-miterlimit"] || null != l["stroke-linejoin"] || null != l["stroke-linecap"]) {
							var D = h.getElementsByTagName("fill");
							if (!(D = D && D[0]) && (D = M("fill")), "image" == i.type && l.src && (D.src = l.src), l.fill && (D.on = !0), null != D.on && "none" != l.fill && null !== l.fill || (D.on = !1), D.on && l.fill) {
								var E = e(l.fill).match(r._ISURL);
								if (E) {
									D.parentNode == h && h.removeChild(D), D.rotate = !0, D.src = E[1], D.type = "tile";
									var R = i.getBBox(1);
									D.position = R.x + d + R.y, i._.fillpos = [R.x, R.y], r._preload(E[1], function() {
										i._.fillsize = [this.offsetWidth, this.offsetHeight]
									})
								} else D.color = r.getRGB(l.fill).hex, D.src = u, D.type = "solid", r.getRGB(l.fill).error && (x.type in {
									circle: 1,
									ellipse: 1
								} || "r" != e(l.fill).charAt()) && S(x, l.fill, D) && (p.fill = "none", p.gradient = l.fill, D.rotate = !1)
							}
							if ("fill-opacity" in l || "opacity" in l) {
								var P = ((+p["fill-opacity"] + 1 || 2) - 1) * ((+p.opacity + 1 || 2) - 1) * ((+r.getRGB(l.fill).o + 1 || 2) - 1);
								P = s(o(P, 0), 1), D.opacity = P, D.src && (D.color = "none")
							}
							h.appendChild(D);
							var L = h.getElementsByTagName("stroke") && h.getElementsByTagName("stroke")[0],
								H = !1;
							!L && (H = L = M("stroke")), (l.stroke && "none" != l.stroke || l["stroke-width"] || null != l["stroke-opacity"] || l["stroke-dasharray"] || l["stroke-miterlimit"] || l["stroke-linejoin"] || l["stroke-linecap"]) && (L.on = !0), ("none" == l.stroke || null === l.stroke || null == L.on || 0 == l.stroke || 0 == l["stroke-width"]) && (L.on = !1);
							var j = r.getRGB(l.stroke);
							L.on && l.stroke && (L.color = j.hex), P = ((+p["stroke-opacity"] + 1 || 2) - 1) * ((+p.opacity + 1 || 2) - 1) * ((+j.o + 1 || 2) - 1);
							var q = .75 * (a(l["stroke-width"]) || 1);
							if (P = s(o(P, 0), 1), null == l["stroke-width"] && (q = p["stroke-width"]), l["stroke-width"] && (L.weight = q), q && q < 1 && (P *= q) && (L.weight = 1), L.opacity = P, l["stroke-linejoin"] && (L.joinstyle = l["stroke-linejoin"] || "miter"), L.miterlimit = l["stroke-miterlimit"] || 8, l["stroke-linecap"] && (L.endcap = "butt" == l["stroke-linecap"] ? "flat" : "square" == l["stroke-linecap"] ? "square" : "round"), l["stroke-dasharray"]) {
								var $ = {
									"-": "shortdash",
									".": "shortdot",
									"-.": "shortdashdot",
									"-..": "shortdashdotdot",
									". ": "dot",
									"- ": "dash",
									"--": "longdash",
									"- .": "dashdot",
									"--.": "longdashdot",
									"--..": "longdashdotdot"
								};
								L.dashstyle = $[t](l["stroke-dasharray"]) ? $[l["stroke-dasharray"]] : u
							}
							H && h.appendChild(L)
						}
						if ("text" == x.type) {
							x.paper.canvas.style.display = u;
							var Y = x.paper.span,
								V = p.font && p.font.match(/\d+(?:\.\d*)?(?=px)/);
							f = Y.style, p.font && (f.font = p.font), p["font-family"] && (f.fontFamily = p["font-family"]), p["font-weight"] && (f.fontWeight = p["font-weight"]), p["font-style"] && (f.fontStyle = p["font-style"]), V = a(p["font-size"] || V && V[0]) || 10, f.fontSize = 100 * V + "px", x.textpath.string && (Y.innerHTML = e(x.textpath.string).replace(/</g, "&#60;").replace(/&/g, "&#38;").replace(/\n/g, "<br>"));
							var W = Y.getBoundingClientRect();
							x.W = p.w = (W.right - W.left) / 100, x.H = p.h = (W.bottom - W.top) / 100, x.X = p.x, x.Y = p.y + x.H / 2, ("x" in l || "y" in l) && (x.path.v = r.format("m{0},{1}l{2},{1}", n(p.x * v), n(p.y * v), n(p.x * v) + 1));
							for (var U = ["x", "y", "text", "font", "font-family", "font-weight", "font-style", "font-size"], X = 0, G = U.length; X < G; X++)
								if (U[X] in l) {
									x._.dirty = 1;
									break
								}
							switch (p["text-anchor"]) {
								case "start":
									x.textpath.style["v-text-align"] = "left", x.bbx = x.W / 2;
									break;
								case "end":
									x.textpath.style["v-text-align"] = "right", x.bbx = -x.W / 2;
									break;
								default:
									x.textpath.style["v-text-align"] = "center", x.bbx = 0
							}
							x.textpath.style["v-text-kern"] = !0
						}
					},
					S = function(t, n, o) {
						t.attrs = t.attrs || {};
						t.attrs;
						var s = Math.pow,
							l = "linear",
							c = ".5 .5";
						if (t.attrs.gradient = n, n = e(n).replace(r._radial_gradient, function(t, e, r) {
								return l = "radial", e && r && (e = a(e), r = a(r), s(e - .5, 2) + s(r - .5, 2) > .25 && (r = i.sqrt(.25 - s(e - .5, 2)) * (2 * (r > .5) - 1) + .5), c = e + d + r), u
							}), n = n.split(/\s*\-\s*/), "linear" == l) {
							var h = n.shift();
							if (h = -a(h), isNaN(h)) return null
						}
						var p = r._parseDots(n);
						if (!p) return null;
						if (t = t.shape || t.node, p.length) {
							t.removeChild(o), o.on = !0, o.method = "none", o.color = p[0].color, o.color2 = p[p.length - 1].color;
							for (var f = [], g = 0, m = p.length; g < m; g++) p[g].offset && f.push(p[g].offset + d + p[g].color);
							o.colors = f.length ? f.join() : "0% " + o.color, "radial" == l ? (o.type = "gradientTitle", o.focus = "100%", o.focussize = "0 0", o.focusposition = c, o.angle = 0) : (o.type = "gradient", o.angle = (270 - h) % 360), t.appendChild(o)
						}
						return 1
					},
					I = function(t, e) {
						this[0] = this.node = t, t.raphael = !0, this.id = r._oid++, t.raphaelid = this.id, this.X = 0, this.Y = 0, this.attrs = {}, this.paper = e, this.matrix = r.matrix(), this._ = {
							transform: [],
							sx: 1,
							sy: 1,
							dx: 0,
							dy: 0,
							deg: 0,
							dirty: 1,
							dirtyT: 1
						}, !e.bottom && (e.bottom = this), this.prev = e.top, e.top && (e.top.next = this), e.top = this, this.next = null
					},
					T = r.el;
				I.prototype = T, T.constructor = I, T.transform = function(t) {
					if (null == t) return this._.transform;
					var a, i = this.paper._viewBoxShift,
						n = i ? "s" + [i.scale, i.scale] + "-1-1t" + [i.dx, i.dy] : u;
					i && (a = t = e(t).replace(/\.{3}|\u2026/g, this._.transform || u)), r._extractTransform(this, n + t);
					var o, s = this.matrix.clone(),
						l = this.skew,
						c = this.node,
						h = ~e(this.attrs.fill).indexOf("-"),
						p = !e(this.attrs.fill).indexOf("url(");
					if (s.translate(1, 1), p || h || "image" == this.type)
						if (l.matrix = "1 0 0 1", l.offset = "0 0", o = s.split(), h && o.noRotation || !o.isSimple) {
							c.style.filter = s.toFilter();
							var f = this.getBBox(),
								g = this.getBBox(1),
								m = f.x - g.x,
								x = f.y - g.y;
							c.coordorigin = m * -v + d + x * -v, k(this, 1, 1, m, x, 0)
						} else c.style.filter = u, k(this, o.scalex, o.scaley, o.dx, o.dy, o.rotate);
					else c.style.filter = u, l.matrix = e(s), l.offset = s.offset();
					return a && (this._.transform = a), this
				}, T.rotate = function(t, r, i) {
					if (this.removed) return this;
					if (null != t) {
						if ((t = e(t).split(c)).length - 1 && (r = a(t[1]), i = a(t[2])), t = a(t[0]), null == i && (r = i), null == r || null == i) {
							var n = this.getBBox(1);
							r = n.x + n.width / 2, i = n.y + n.height / 2
						}
						return this._.dirtyT = 1, this.transform(this._.transform.concat([
							["r", t, r, i]
						])), this
					}
				}, T.translate = function(t, r) {
					return this.removed ? this : ((t = e(t).split(c)).length - 1 && (r = a(t[1])), t = a(t[0]) || 0, r = +r || 0, this._.bbox && (this._.bbox.x += t, this._.bbox.y += r), this.transform(this._.transform.concat([
						["t", t, r]
					])), this)
				}, T.scale = function(t, r, i, n) {
					if (this.removed) return this;
					if ((t = e(t).split(c)).length - 1 && (r = a(t[1]), i = a(t[2]), n = a(t[3]), isNaN(i) && (i = null), isNaN(n) && (n = null)), t = a(t[0]), null == r && (r = t), null == n && (i = n), null == i || null == n) var o = this.getBBox(1);
					return i = null == i ? o.x + o.width / 2 : i, n = null == n ? o.y + o.height / 2 : n, this.transform(this._.transform.concat([
						["s", t, r, i, n]
					])), this._.dirtyT = 1, this
				}, T.hide = function() {
					return !this.removed && (this.node.style.display = "none"), this
				}, T.show = function() {
					return !this.removed && (this.node.style.display = u), this
				}, T._getBBox = function() {
					return this.removed ? {} : {
						x: this.X + (this.bbx || 0) - this.W / 2,
						y: this.Y - this.H,
						width: this.W,
						height: this.H
					}
				}, T.remove = function() {
					if (!this.removed && this.node.parentNode) {
						this.paper.__set__ && this.paper.__set__.exclude(this), r.eve.unbind("raphael.*.*." + this.id), r._tear(this, this.paper), this.node.parentNode.removeChild(this.node), this.shape && this.shape.parentNode.removeChild(this.shape);
						for (var t in this) this[t] = "function" == typeof this[t] ? r._removedFactory(t) : null;
						this.removed = !0
					}
				}, T.attr = function(e, a) {
					if (this.removed) return this;
					if (null == e) {
						var i = {};
						for (var n in this.attrs) this.attrs[t](n) && (i[n] = this.attrs[n]);
						return i.gradient && "none" == i.fill && (i.fill = i.gradient) && delete i.gradient, i.transform = this._.transform, i
					}
					if (null == a && r.is(e, "string")) {
						if ("fill" == e && "none" == this.attrs.fill && this.attrs.gradient) return this.attrs.gradient;
						for (var o = e.split(c), s = {}, l = 0, d = o.length; l < d; l++)(e = o[l]) in this.attrs ? s[e] = this.attrs[e] : r.is(this.paper.customAttributes[e], "function") ? s[e] = this.paper.customAttributes[e].def : s[e] = r._availableAttrs[e];
						return d - 1 ? s : s[o[0]]
					}
					if (this.attrs && null == a && r.is(e, "array")) {
						for (s = {}, l = 0, d = e.length; l < d; l++) s[e[l]] = this.attr(e[l]);
						return s
					}
					var u;
					null != a && ((u = {})[e] = a), null == a && r.is(e, "object") && (u = e);
					for (var p in u) h("raphael.attr." + p + "." + this.id, this, u[p]);
					if (u) {
						for (p in this.paper.customAttributes)
							if (this.paper.customAttributes[t](p) && u[t](p) && r.is(this.paper.customAttributes[p], "function")) {
								var f = this.paper.customAttributes[p].apply(this, [].concat(u[p]));
								this.attrs[p] = u[p];
								for (var g in f) f[t](g) && (u[g] = f[g])
							}
						u.text && "text" == this.type && (this.textpath.string = u.text), B(this, u)
					}
					return this
				}, T.toFront = function() {
					return !this.removed && this.node.parentNode.appendChild(this.node), this.paper && this.paper.top != this && r._tofront(this, this.paper), this
				}, T.toBack = function() {
					return this.removed ? this : (this.node.parentNode.firstChild != this.node && (this.node.parentNode.insertBefore(this.node, this.node.parentNode.firstChild), r._toback(this, this.paper)), this)
				}, T.insertAfter = function(t) {
					return this.removed ? this : (t.constructor == r.st.constructor && (t = t[t.length - 1]), t.node.nextSibling ? t.node.parentNode.insertBefore(this.node, t.node.nextSibling) : t.node.parentNode.appendChild(this.node), r._insertafter(this, t, this.paper), this)
				}, T.insertBefore = function(t) {
					return this.removed ? this : (t.constructor == r.st.constructor && (t = t[0]), t.node.parentNode.insertBefore(this.node, t.node), r._insertbefore(this, t, this.paper), this)
				}, T.blur = function(t) {
					var e = this.node.runtimeStyle,
						a = e.filter;
					return a = a.replace(g, u), 0 != +t ? (this.attrs.blur = t, e.filter = a + d + " progid:DXImageTransform.Microsoft.Blur(pixelradius=" + (+t || 1.5) + ")", e.margin = r.format("-{0}px 0 0 -{0}px", n(+t || 1.5))) : (e.filter = a, e.margin = 0, delete this.attrs.blur), this
				}, r._engine.path = function(t, e) {
					var r = M("shape");
					r.style.cssText = x, r.coordsize = v + d + v, r.coordorigin = e.coordorigin;
					var a = new I(r, e),
						i = {
							fill: "none",
							stroke: "#000"
						};
					t && (i.path = t), a.type = "path", a.path = [], a.Path = u, B(a, i), e.canvas.appendChild(r);
					var n = M("skew");
					return n.on = !0, r.appendChild(n), a.skew = n, a.transform(u), a
				}, r._engine.rect = function(t, e, a, i, n, o) {
					var s = r._rectPath(e, a, i, n, o),
						l = t.path(s),
						c = l.attrs;
					return l.X = c.x = e, l.Y = c.y = a, l.W = c.width = i, l.H = c.height = n, c.r = o, c.path = s, l.type = "rect", l
				}, r._engine.ellipse = function(t, e, r, a, i) {
					var n = t.path();
					n.attrs;
					return n.X = e - a, n.Y = r - i, n.W = 2 * a, n.H = 2 * i, n.type = "ellipse", B(n, {
						cx: e,
						cy: r,
						rx: a,
						ry: i
					}), n
				}, r._engine.circle = function(t, e, r, a) {
					var i = t.path();
					i.attrs;
					return i.X = e - a, i.Y = r - a, i.W = i.H = 2 * a, i.type = "circle", B(i, {
						cx: e,
						cy: r,
						r: a
					}), i
				}, r._engine.image = function(t, e, a, i, n, o) {
					var s = r._rectPath(a, i, n, o),
						l = t.path(s).attr({
							stroke: "none"
						}),
						c = l.attrs,
						h = l.node,
						d = h.getElementsByTagName("fill")[0];
					return c.src = e, l.X = c.x = a, l.Y = c.y = i, l.W = c.width = n, l.H = c.height = o, c.path = s, l.type = "image", d.parentNode == h && h.removeChild(d), d.rotate = !0, d.src = e, d.type = "tile", l._.fillpos = [a, i], l._.fillsize = [n, o], h.appendChild(d), k(l, 1, 1, 0, 0, 0), l
				}, r._engine.text = function(t, a, i, o) {
					var s = M("shape"),
						l = M("path"),
						c = M("textpath");
					a = a || 0, i = i || 0, o = o || "", l.v = r.format("m{0},{1}l{2},{1}", n(a * v), n(i * v), n(a * v) + 1), l.textpathok = !0, c.string = e(o), c.on = !0, s.style.cssText = x, s.coordsize = v + d + v, s.coordorigin = "0 0";
					var h = new I(s, t),
						p = {
							fill: "#000",
							stroke: "none",
							font: r._availableAttrs.font,
							text: o
						};
					h.shape = s, h.path = l, h.textpath = c, h.type = "text", h.attrs.text = e(o), h.attrs.x = a, h.attrs.y = i, h.attrs.w = 1, h.attrs.h = 1, B(h, p), s.appendChild(c), s.appendChild(l), t.canvas.appendChild(s);
					var f = M("skew");
					return f.on = !0, s.appendChild(f), h.skew = f, h.transform(u), h
				}, r._engine.setSize = function(t, e) {
					var a = this.canvas.style;
					return this.width = t, this.height = e, t == +t && (t += "px"), e == +e && (e += "px"), a.width = t, a.height = e, a.clip = "rect(0 " + t + " " + e + " 0)", this._viewBox && r._engine.setViewBox.apply(this, this._viewBox), this
				}, r._engine.setViewBox = function(t, e, a, i, n) {
					r.eve("raphael.setViewBox", this, this._viewBox, [t, e, a, i, n]);
					var s, l, c = this.width,
						h = this.height,
						d = 1 / o(a / c, i / h);
					return n && (l = c / a, a * (s = h / i) < c && (t -= (c - a * s) / 2 / s), i * l < h && (e -= (h - i * l) / 2 / l)), this._viewBox = [t, e, a, i, !!n], this._viewBoxShift = {
						dx: -t,
						dy: -e,
						scale: d
					}, this.forEach(function(t) {
						t.transform("...")
					}), this
				};
				var M;
				r._engine.initWin = function(t) {
					var e = t.document;
					e.createStyleSheet().addRule(".rvml", "behavior:url(#default#VML)");
					try {
						!e.namespaces.rvml && e.namespaces.add("rvml", "urn:schemas-microsoft-com:vml"), M = function(t) {
							return e.createElement("<rvml:" + t + ' class="rvml">')
						}
					} catch (t) {
						M = function(t) {
							return e.createElement("<" + t + ' xmlns="urn:schemas-microsoft.com:vml" class="rvml">')
						}
					}
				}, r._engine.initWin(r._g.win), r._engine.create = function() {
					var t = r._getContainer.apply(0, arguments),
						e = t.container,
						a = t.height,
						i = t.width,
						n = t.x,
						o = t.y;
					if (!e) throw new Error("VML container not found.");
					var s = new r._Paper,
						l = s.canvas = r._g.doc.createElement("div"),
						c = l.style;
					return n = n || 0, o = o || 0, i = i || 512, a = a || 342, s.width = i, s.height = a, i == +i && (i += "px"), a == +a && (a += "px"), s.coordsize = 216e5 + d + 216e5, s.coordorigin = "0 0", s.span = r._g.doc.createElement("span"), s.span.style.cssText = "position:absolute;left:-9999em;top:-9999em;padding:0;margin:0;line-height:1;", l.appendChild(s.span), c.cssText = r.format("top:0;left:0;width:{0};height:{1};display:inline-block;position:relative;clip:rect(0 {0} {1} 0);overflow:hidden", i, a), 1 == e ? (r._g.doc.body.appendChild(l), c.left = n + "px", c.top = o + "px", c.position = "absolute") : e.firstChild ? e.insertBefore(l, e.firstChild) : e.appendChild(l), s.renderfix = function() {}, s
				}, r.prototype.clear = function() {
					r.eve("raphael.clear", this), this.canvas.innerHTML = u, this.span = r._g.doc.createElement("span"), this.span.style.cssText = "position:absolute;left:-9999em;top:-9999em;padding:0;margin:0;line-height:1;display:inline;", this.canvas.appendChild(this.span), this.bottom = this.top = null
				}, r.prototype.remove = function() {
					r.eve("raphael.remove", this), this.canvas.parentNode.removeChild(this.canvas);
					for (var t in this) this[t] = "function" == typeof this[t] ? r._removedFactory(t) : null;
					return !0
				};
				var N = r.st;
				for (var A in T) T[t](A) && !N[t](A) && (N[A] = function(t) {
					return function() {
						var e = arguments;
						return this.forEach(function(r) {
							r[t].apply(r, e)
						})
					}
				}(A))
			}
		}(), I.was ? S.win.Raphael = r : Raphael = r, r
}),
function(t, e) {
	"function" == typeof define && define.amd ? define(["raphael"], function(r) {
		return e(r || t.Raphael)
	}) : e(Raphael)
}(this, function(t) {
	t.fn.freeTransform = function(t, e, r) {
		function a(t) {
			("set" === t.type ? t.items : [t]).map(function(t) {
				"set" === t.type ? a(t) : p.items.push({
					el: t,
					attrs: {
						rotate: 0,
						scale: {
							x: 1,
							y: 1
						},
						translate: {
							x: 0,
							y: 0
						}
					},
					transformString: t.matrix.toTransformString()
				})
			})
		}

		function i() {
			var t = {
					x: p.attrs.rotate * Math.PI / 180,
					y: (p.attrs.rotate + 90) * Math.PI / 180
				},
				e = {
					x: p.attrs.size.x / 2 * p.attrs.scale.x,
					y: p.attrs.size.y / 2 * p.attrs.scale.y
				},
				r = [];
			return [{
				x: -1,
				y: -1
			}, {
				x: 1,
				y: -1
			}, {
				x: 1,
				y: 1
			}, {
				x: -1,
				y: 1
			}].map(function(a) {
				r.push({
					x: p.attrs.center.x + p.attrs.translate.x + a.x * e.x * Math.cos(t.x) + a.y * e.y * Math.cos(t.y),
					y: p.attrs.center.y + p.attrs.translate.y + a.x * e.x * Math.sin(t.x) + a.y * e.y * Math.sin(t.y)
				})
			}), r
		}

		function n() {
			var t = {
				x: /^([0-9]+)%$/.exec(d.width),
				y: /^([0-9]+)%$/.exec(d.height)
			};
			return {
				x: t.x ? d.canvas.clientWidth || d.canvas.parentNode.clientWidth * parseInt(t.x[1], 10) * .01 : d.canvas.clientWidth || d.width,
				y: t.y ? d.canvas.clientHeight || d.canvas.parentNode.clientHeight * parseInt(t.y[1], 10) * .01 : d.canvas.clientHeight || d.height
			}
		}

		function o(t) {
			if (t && p.opts.snap.drag) {
				var e = t.x,
					r = t.y,
					a = {
						x: 0,
						y: 0
					},
					i = {
						x: 0,
						y: 0
					};
				[0, 1].map(function() {
					a.x = e - Math.round(e / p.opts.snap.drag) * p.opts.snap.drag, a.y = r - Math.round(r / p.opts.snap.drag) * p.opts.snap.drag, Math.abs(a.x) <= p.opts.snapDist.drag && (i.x = a.x), Math.abs(a.y) <= p.opts.snapDist.drag && (i.y = a.y), e += t.width - i.x, r += t.height - i.y
				}), p.attrs.translate.x -= i.x, p.attrs.translate.y -= i.y
			}
			if (p.opts.boundary) {
				var o = p.opts.boundary;
				o.width = o.width || n().x * (p.o.viewBoxRatio && p.o.viewBoxRatio.x || 1), o.height = o.height || n().y * (p.o.viewBoxRatio && p.o.viewBoxRatio.y || 1), p.attrs.center.x + p.attrs.translate.x < o.x && (p.attrs.translate.x += o.x - (p.attrs.center.x + p.attrs.translate.x)), p.attrs.center.y + p.attrs.translate.y < o.y && (p.attrs.translate.y += o.y - (p.attrs.center.y + p.attrs.translate.y)), p.attrs.center.x + p.attrs.translate.x > o.x + o.width && (p.attrs.translate.x += o.x + o.width - (p.attrs.center.x + p.attrs.translate.x)), p.attrs.center.y + p.attrs.translate.y > o.y + o.height && (p.attrs.translate.y += o.y + o.height - (p.attrs.center.y + p.attrs.translate.y))
			}
			if (a = Math.abs(p.attrs.rotate % p.opts.snap.rotate), (a = Math.min(a, p.opts.snap.rotate - a)) < p.opts.snapDist.rotate && (p.attrs.rotate = Math.round(p.attrs.rotate / p.opts.snap.rotate) * p.opts.snap.rotate), a = {
					x: Math.abs(p.attrs.scale.x * p.attrs.size.x % p.opts.snap.scale),
					y: Math.abs(p.attrs.scale.y * p.attrs.size.x % p.opts.snap.scale)
				}, (a = {
					x: Math.min(a.x, p.opts.snap.scale - a.x),
					y: Math.min(a.y, p.opts.snap.scale - a.y)
				}).x < p.opts.snapDist.scale && (p.attrs.scale.x = Math.round(p.attrs.scale.x * p.attrs.size.x / p.opts.snap.scale) * p.opts.snap.scale / p.attrs.size.x), a.y < p.opts.snapDist.scale && (p.attrs.scale.y = Math.round(p.attrs.scale.y * p.attrs.size.y / p.opts.snap.scale) * p.opts.snap.scale / p.attrs.size.y), p.opts.range.rotate) {
				var s = (360 + p.attrs.rotate) % 360;
				s > 180 && (s -= 360), s < p.opts.range.rotate[0] && (p.attrs.rotate += p.opts.range.rotate[0] - s), s > p.opts.range.rotate[1] && (p.attrs.rotate += p.opts.range.rotate[1] - s)
			}
			p.opts.range.scale && (p.attrs.scale.x * p.attrs.size.x < p.opts.range.scale[0] && (p.attrs.scale.x = p.opts.range.scale[0] / p.attrs.size.x), p.attrs.scale.y * p.attrs.size.y < p.opts.range.scale[0] && (p.attrs.scale.y = p.opts.range.scale[0] / p.attrs.size.y), p.attrs.scale.x * p.attrs.size.x > p.opts.range.scale[1] && (p.attrs.scale.x = p.opts.range.scale[1] / p.attrs.size.x), p.attrs.scale.y * p.attrs.size.y > p.opts.range.scale[1] && (p.attrs.scale.y = p.opts.range.scale[1] / p.attrs.size.y))
		}

		function s() {
			return {
				x: p.attrs.scale.x * p.attrs.size.x >= p.opts.range.scale[0] && p.attrs.scale.x * p.attrs.size.x <= p.opts.range.scale[1],
				y: p.attrs.scale.y * p.attrs.size.y >= p.opts.range.scale[0] && p.attrs.scale.y * p.attrs.size.y <= p.opts.range.scale[1]
			}
		}

		function l(t) {
			"x" === t ? p.attrs.scale.y = p.attrs.scale.x / p.attrs.ratio : p.attrs.scale.x = p.attrs.scale.y * p.attrs.ratio
		}

		function c(t) {
			var e, r = {};
			for (e in t) r[e] = "object" == typeof t[e] ? c(t[e]) : t[e];
			return r
		}

		function h(t) {
			if (p.callback) {
				var e = [];
				t.map(function(t, r) {
					t && e.push(t)
				}), clearTimeout(f), f = setTimeout(function() {
					p.callback && p.callback(p, e)
				}, 1)
			}
		}
		if (t.freeTransform) return t.freeTransform;
		Array.prototype.hasOwnProperty("map") || (Array.prototype.map = function(t, e) {
			var r, a = [];
			for (r in this) this.hasOwnProperty(r) && (a[r] = t.call(e, this[r], r, this));
			return a
		}), Array.prototype.hasOwnProperty("indexOf") || (Array.prototype.indexOf = function(t, e) {
			for (var r = e || 0, a = this.length; r < a; r++)
				if (this[r] === t) return r;
			return -1
		});
		var d = this,
			u = t.getBBox(!0),
			p = t.freeTransform = {
				attrs: {
					x: u.x,
					y: u.y,
					size: {
						x: u.width,
						y: u.height
					},
					center: {
						x: u.x + u.width / 2,
						y: u.y + u.height / 2
					},
					rotate: 0,
					scale: {
						x: 1,
						y: 1
					},
					translate: {
						x: 0,
						y: 0
					},
					ratio: 1
				},
				axes: null,
				bbox: null,
				callback: null,
				items: [],
				handles: {
					center: null,
					x: null,
					y: null
				},
				offset: {
					rotate: 0,
					scale: {
						x: 1,
						y: 1
					},
					translate: {
						x: 0,
						y: 0
					}
				},
				opts: {
					animate: !1,
					attrs: {
						fill: "#fff",
						stroke: "#000"
					},
					boundary: {
						x: d._left || 0,
						y: d._top || 0,
						width: null,
						height: null
					},
					distance: 1.3,
					drag: !0,
					draw: !1,
					keepRatio: !1,
					range: {
						rotate: [-180, 180],
						scale: [-99999, 99999]
					},
					rotate: !0,
					scale: !0,
					snap: {
						rotate: 0,
						scale: 0,
						drag: 0
					},
					snapDist: {
						rotate: 0,
						scale: 0,
						drag: 7
					},
					size: 5
				},
				subject: t
			};
		p.updateHandles = function() {
			if (p.handles.bbox || p.opts.rotate.indexOf("self") >= 0) var t = i();
			var e = {
					x: p.attrs.rotate * Math.PI / 180,
					y: (p.attrs.rotate + 90) * Math.PI / 180
				},
				r = {
					x: p.attrs.size.x / 2 * p.attrs.scale.x,
					y: p.attrs.size.y / 2 * p.attrs.scale.y
				};
			if (p.axes.map(function(t) {
					if (p.handles[t]) {
						var a = p.attrs.center.x + p.attrs.translate.x + r[t] * p.opts.distance * Math.cos(e[t]),
							i = p.attrs.center.y + p.attrs.translate.y + r[t] * p.opts.distance * Math.sin(e[t]),
							o = {
								x: 1,
								y: 1
							};
						d._viewBox && (o = {
							x: d._viewBox[2] / n().x,
							y: d._viewBox[3] / n().y
						}), p.opts.boundary && (a = Math.max(Math.min(a, p.opts.boundary.x + (p.opts.boundary.width || n().x * o.x)), p.opts.boundary.x), i = Math.max(Math.min(i, p.opts.boundary.y + (p.opts.boundary.height || n().y * o.y)), p.opts.boundary.y)), p.handles[t].disc.attr({
							cx: a,
							cy: i
						}), p.handles[t].line.toFront().attr({
							path: [
								["M", p.attrs.center.x + p.attrs.translate.x, p.attrs.center.y + p.attrs.translate.y],
								["L", p.handles[t].disc.attrs.cx, p.handles[t].disc.attrs.cy]
							]
						}), p.handles[t].disc.toFront()
					}
				}), p.bbox) {
				p.bbox.toFront().attr({
					path: [
						["M", t[0].x, t[0].y],
						["L", t[1].x, t[1].y],
						["L", t[2].x, t[2].y],
						["L", t[3].x, t[3].y],
						["L", t[0].x, t[0].y]
					]
				});
				var a = [
					[-1, -1],
					[1, -1],
					[1, 1],
					[-1, 1],
					[0, -1],
					[1, 0],
					[0, 1],
					[-1, 0]
				];
				p.handles.bbox && p.handles.bbox.map(function(e, r) {
					var i, n, o, s;
					e.isCorner ? (i = t[r].x, n = t[r].y) : (s = ((o = r % 4) + 1) % t.length, i = (t[o].x + t[s].x) / 2, n = (t[o].y + t[s].y) / 2), e.element.toFront().attr({
						x: i - (e.isCorner ? p.opts.size.bboxCorners : p.opts.size.bboxSides),
						y: n - (e.isCorner ? p.opts.size.bboxCorners : p.opts.size.bboxSides)
					}).transform("R" + p.attrs.rotate), e.x = a[r][0], e.y = a[r][1]
				})
			}
			return p.circle && p.circle.attr({
				cx: p.attrs.center.x + p.attrs.translate.x,
				cy: p.attrs.center.y + p.attrs.translate.y,
				r: Math.max(r.x, r.y) * p.opts.distance
			}), p.handles.center && p.handles.center.disc.toFront().attr({
				cx: p.attrs.center.x + p.attrs.translate.x,
				cy: p.attrs.center.y + p.attrs.translate.y
			}), p.opts.rotate.indexOf("self") >= 0 && (r = Math.max(Math.sqrt(Math.pow(t[1].x - t[0].x, 2) + Math.pow(t[1].y - t[0].y, 2)), Math.sqrt(Math.pow(t[2].x - t[1].x, 2) + Math.pow(t[2].y - t[1].y, 2))) / 2), p
		}, p.showHandles = function() {
			if (p.hideHandles(), p.axes.map(function(t) {
					p.handles[t] = {}, p.handles[t].line = d.path(["M", p.attrs.center.x, p.attrs.center.y]).attr({
						stroke: p.opts.attrs.stroke,
						"stroke-dasharray": "- ",
						opacity: .5
					}), p.handles[t].disc = d.circle(p.attrs.center.x, p.attrs.center.y, p.opts.size.axes).attr(p.opts.attrs)
				}), p.opts.draw.indexOf("bbox") >= 0) {
				p.bbox = d.path("").attr({
					stroke: p.opts.attrs.stroke,
					"stroke-dasharray": "- ",
					opacity: .5
				}), p.handles.bbox = [];
				var e, r;
				for (e = p.opts.scale.indexOf("bboxCorners") >= 0 ? 0 : 4; e < (-1 === p.opts.scale.indexOf("bboxSides") ? 4 : 8); e++)(r = {}).axis = e % 2 ? "x" : "y", r.isCorner = e < 4, r.element = d.rect(p.attrs.center.x, p.attrs.center.y, 2 * p.opts.size[r.isCorner ? "bboxCorners" : "bboxSides"], 2 * p.opts.size[r.isCorner ? "bboxCorners" : "bboxSides"]).attr(p.opts.attrs), p.handles.bbox[e] = r
			} - 1 !== p.opts.draw.indexOf("circle") && (p.circle = d.circle(0, 0, 0).attr({
				stroke: p.opts.attrs.stroke,
				"stroke-dasharray": "- ",
				opacity: .3
			})), -1 !== p.opts.drag.indexOf("center") && (p.handles.center = {}, p.handles.center.disc = d.circle(p.attrs.center.x, p.attrs.center.y, p.opts.size.center).attr(p.opts.attrs)), p.axes.map(function(t) {
				if (p.handles[t]) {
					var e = -1 !== p.opts.rotate.indexOf("axis" + t.toUpperCase()),
						r = -1 !== p.opts.scale.indexOf("axis" + t.toUpperCase());
					p.handles[t].disc.drag(function(a, i) {
						p.o.viewBoxRatio && (a *= p.o.viewBoxRatio.x, i *= p.o.viewBoxRatio.y);
						var s = a + p.handles[t].disc.ox,
							c = i + p.handles[t].disc.oy,
							d = {
								x: p.o.scale.x < 0,
								y: p.o.scale.y < 0
							};
						if (e) {
							var u = Math.atan2(c - p.o.center.y - p.o.translate.y, s - p.o.center.x - p.o.translate.x);
							p.attrs.rotate = 180 * u / Math.PI - ("y" === t ? 90 : 0), d[t] && (p.attrs.rotate -= 180)
						}
						p.opts.boundary && (s = Math.max(Math.min(s, p.opts.boundary.x + (p.opts.boundary.width || n().x * (p.o.viewBoxRatio && p.o.viewBoxRatio.x || 1))), p.opts.boundary.x), c = Math.max(Math.min(c, p.opts.boundary.y + (p.opts.boundary.height || n().y * (p.o.viewBoxRatio && p.o.viewBoxRatio.y || 1))), p.opts.boundary.y));
						var f = Math.sqrt(Math.pow(s - p.o.center.x - p.o.translate.x, 2) + Math.pow(c - p.o.center.y - p.o.translate.y, 2));
						r && (p.attrs.scale[t] = f / (p.o.size[t] / 2 * p.opts.distance), d[t] && (p.attrs.scale[t] *= -1)), o(), -1 !== p.opts.keepRatio.indexOf("axis" + t.toUpperCase()) ? l(t) : p.attrs.ratio = p.attrs.scale.x / p.attrs.scale.y, p.attrs.scale.x && p.attrs.scale.y && p.apply(), h([e ? "rotate" : null, r ? "scale" : null])
					}, function() {
						p.o = c(p.attrs), d._viewBox && (p.o.viewBoxRatio = {
							x: d._viewBox[2] / n().x,
							y: d._viewBox[3] / n().y
						}), p.handles[t].disc.ox = this.attrs.cx, p.handles[t].disc.oy = this.attrs.cy, h([e ? "rotate start" : null, r ? "scale start" : null])
					}, function() {
						h([e ? "rotate end" : null, r ? "scale end" : null])
					})
				}
			}), p.opts.draw.indexOf("bbox") >= 0 && (-1 !== p.opts.scale.indexOf("bboxCorners") || -1 !== p.opts.scale.indexOf("bboxSides")) && p.handles.bbox.map(function(t) {
				t.element.drag(function(e, r) {
					p.o.viewBoxRatio && (e *= p.o.viewBoxRatio.x, r *= p.o.viewBoxRatio.y);
					var a, i, n, d, u, f, g, m, x, v, y = c(p.attrs);
					if (a = p.o.rotate.sin, i = p.o.rotate.cos, n = e * i - r * a, d = e * a + r * i, n *= Math.abs(t.x), d *= Math.abs(t.y), u = n * i + d * a, f = n * -a + d * i, p.attrs.translate = {
							x: p.o.translate.x + u / 2,
							y: p.o.translate.y + f / 2
						}, g = p.o.handlePos.cx + e - p.attrs.center.x - p.attrs.translate.x, m = p.o.handlePos.cy + r - p.attrs.center.y - p.attrs.translate.y, n = g * i - m * a, d = g * a + m * i, t.isCorner && -1 !== p.opts.keepRatio.indexOf("bboxCorners")) {
						var _ = p.attrs.size.x * p.attrs.scale.x / (p.attrs.size.y * p.attrs.scale.y),
							b = n * t.x * (1 / _),
							w = d * t.y * _;
						w > b * _ ? n = w * t.x : d = b * t.y
					}
					if (x = 2 * n * t.x / p.o.size.x, v = 2 * d * t.y / p.o.size.y, p.attrs.scale = {
							x: x || p.attrs.scale.x,
							y: v || p.attrs.scale.y
						}, s().x && s().y || (p.attrs = y), o(), t.isCorner && -1 !== p.opts.keepRatio.indexOf("bboxCorners") || !t.isCorner && -1 !== p.opts.keepRatio.indexOf("bboxSides")) {
						l(t.axis);
						var k = {
							x: (p.attrs.scale.x - p.o.scale.x) * p.o.size.x * t.x,
							y: (p.attrs.scale.y - p.o.scale.y) * p.o.size.y * t.y
						};
						n = k.x * i + k.y * a, d = -k.x * a + k.y * i, p.attrs.translate.x = p.o.translate.x + n / 2, p.attrs.translate.y = p.o.translate.y + d / 2
					}
					p.attrs.ratio = p.attrs.scale.x / p.attrs.scale.y, h(["scale"]), p.apply()
				}, function() {
					var e = (360 - p.attrs.rotate) % 360 / 180 * Math.PI,
						r = t.element.attr(["x", "y"]);
					p.o = c(p.attrs), p.o.handlePos = {
						cx: r.x + p.opts.size[t.isCorner ? "bboxCorners" : "bboxSides"],
						cy: r.y + p.opts.size[t.isCorner ? "bboxCorners" : "bboxSides"]
					}, p.o.rotate = {
						sin: Math.sin(e),
						cos: Math.cos(e)
					}, d._viewBox && (p.o.viewBoxRatio = {
						x: d._viewBox[2] / n().x,
						y: d._viewBox[3] / n().y
					}), h(["scale start"])
				}, function() {
					h(["scale end"])
				})
			});
			var a = [];
			p.opts.drag.indexOf("self") >= 0 && -1 === p.opts.scale.indexOf("self") && -1 === p.opts.rotate.indexOf("self") && a.push(t), p.opts.drag.indexOf("center") >= 0 && a.push(p.handles.center.disc), a.map(function(e) {
				e.drag(function(t, e) {
					p.o.viewBoxRatio && (t *= p.o.viewBoxRatio.x, e *= p.o.viewBoxRatio.y), p.attrs.translate.x = p.o.translate.x + t, p.attrs.translate.y = p.o.translate.y + e;
					var r = c(p.o.bbox);
					r.x += t, r.y += e, o(r), h(["drag"]), p.apply()
				}, function() {
					p.o = c(p.attrs), p.opts.snap.drag && (p.o.bbox = t.getBBox()), d._viewBox && (p.o.viewBoxRatio = {
						x: d._viewBox[2] / n().x,
						y: d._viewBox[3] / n().y
					}), p.axes.map(function(t) {
						p.handles[t] && (p.handles[t].disc.ox = p.handles[t].disc.attrs.cx, p.handles[t].disc.oy = p.handles[t].disc.attrs.cy)
					}), h(["drag start"])
				}, function() {
					h(["drag end"])
				})
			});
			var i = p.opts.rotate.indexOf("self") >= 0,
				u = p.opts.scale.indexOf("self") >= 0;
			return (i || u) && t.drag(function(t, e, r, a) {
				if (i) {
					var n = Math.atan2(a - p.o.center.y - p.o.translate.y, r - p.o.center.x - p.o.translate.x);
					p.attrs.rotate = p.o.rotate + 180 * n / Math.PI - p.o.deg
				}
				var s = {
					x: p.o.scale.x < 0,
					y: p.o.scale.y < 0
				};
				if (u) {
					var l = Math.sqrt(Math.pow(r - p.o.center.x - p.o.translate.x, 2) + Math.pow(a - p.o.center.y - p.o.translate.y, 2));
					p.attrs.scale.x = p.attrs.scale.y = (s.x ? -1 : 1) * p.o.scale.x + (l - p.o.radius) / (p.o.size.x / 2), s.x && (p.attrs.scale.x *= -1), s.y && (p.attrs.scale.y *= -1)
				}
				o(), p.apply(), h([i ? "rotate" : null, u ? "scale" : null])
			}, function(t, e) {
				p.o = c(p.attrs), p.o.deg = 180 * Math.atan2(e - p.o.center.y - p.o.translate.y, t - p.o.center.x - p.o.translate.x) / Math.PI, p.o.radius = Math.sqrt(Math.pow(t - p.o.center.x - p.o.translate.x, 2) + Math.pow(e - p.o.center.y - p.o.translate.y, 2)), d._viewBox && (p.o.viewBoxRatio = {
					x: d._viewBox[2] / n().x,
					y: d._viewBox[3] / n().y
				}), h([i ? "rotate start" : null, u ? "scale start" : null])
			}, function() {
				h([i ? "rotate end" : null, u ? "scale end" : null])
			}), p.updateHandles(), p
		}, p.hideHandles = function(t) {
			return void 0 === (t = t || {}).undrag && (t.undrag = !0), t.undrag && p.items.map(function(t) {
				t.el.undrag()
			}), p.handles.center && (p.handles.center.disc.remove(), p.handles.center = null), ["x", "y"].map(function(t) {
				p.handles[t] && (p.handles[t].disc.remove(), p.handles[t].line.remove(), p.handles[t] = null)
			}), p.bbox && (p.bbox.remove(), p.bbox = null, p.handles.bbox && (p.handles.bbox.map(function(t) {
				t.element.remove()
			}), p.handles.bbox = null)), p.circle && (p.circle.remove(), p.circle = null), p
		}, p.setOpts = function(t, e) {
			void 0 !== e && (p.callback = "function" == typeof e && e);
			var r, a;
			for (r in t)
				if (t[r] && t[r].constructor === Object) {
					!1 === p.opts[r] && (p.opts[r] = {});
					for (a in t[r]) t[r].hasOwnProperty(a) && (p.opts[r][a] = t[r][a])
				} else p.opts[r] = t[r];
			return !0 === p.opts.animate && (p.opts.animate = {
				delay: 700,
				easing: "linear"
			}), !0 === p.opts.drag && (p.opts.drag = ["center", "self"]), !0 === p.opts.keepRatio && (p.opts.keepRatio = ["bboxCorners", "bboxSides"]), !0 === p.opts.rotate && (p.opts.rotate = ["axisX", "axisY"]), !0 === p.opts.scale && (p.opts.scale = ["axisX", "axisY", "bboxCorners", "bboxSides"]), ["drag", "draw", "keepRatio", "rotate", "scale"].map(function(t) {
				!1 === p.opts[t] && (p.opts[t] = [])
			}), p.axes = [], (p.opts.rotate.indexOf("axisX") >= 0 || p.opts.scale.indexOf("axisX") >= 0) && p.axes.push("x"), (p.opts.rotate.indexOf("axisY") >= 0 || p.opts.scale.indexOf("axisY") >= 0) && p.axes.push("y"), ["drag", "rotate", "scale"].map(function(t) {
				p.opts.snapDist[t] || (p.opts.snapDist[t] = p.opts.snap[t])
			}), p.opts.range = {
				rotate: [parseFloat(p.opts.range.rotate[0]), parseFloat(p.opts.range.rotate[1])],
				scale: [parseFloat(p.opts.range.scale[0]), parseFloat(p.opts.range.scale[1])]
			}, p.opts.snap = {
				drag: parseFloat(p.opts.snap.drag),
				rotate: parseFloat(p.opts.snap.rotate),
				scale: parseFloat(p.opts.snap.scale)
			}, p.opts.snapDist = {
				drag: parseFloat(p.opts.snapDist.drag),
				rotate: parseFloat(p.opts.snapDist.rotate),
				scale: parseFloat(p.opts.snapDist.scale)
			}, "string" == typeof p.opts.size && (p.opts.size = parseFloat(p.opts.size)), isNaN(p.opts.size) || (p.opts.size = {
				axes: p.opts.size,
				bboxCorners: p.opts.size,
				bboxSides: p.opts.size,
				center: p.opts.size
			}), p.showHandles(), h(["init"]), p
		}, p.setOpts(e, r), p.apply = function() {
			return p.items.map(function(t, e) {
				var r = {
						x: p.attrs.center.x + p.offset.translate.x,
						y: p.attrs.center.y + p.offset.translate.y
					},
					a = p.attrs.rotate - p.offset.rotate,
					i = {
						x: p.attrs.scale.x / p.offset.scale.x,
						y: p.attrs.scale.y / p.offset.scale.y
					},
					n = {
						x: p.attrs.translate.x - p.offset.translate.x,
						y: p.attrs.translate.y - p.offset.translate.y
					};
				p.opts.animate ? (h(["animate start"]), t.el.animate({
					transform: ["R", a, r.x, r.y, "S", i.x, i.y, r.x, r.y, "T", n.x, n.y] + p.items[e].transformString
				}, p.opts.animate.delay, p.opts.animate.easing, function() {
					h(["animate end"]), p.updateHandles()
				})) : (t.el.transform(["R", a, r.x, r.y, "S", i.x, i.y, r.x, r.y, "T", n.x, n.y] + p.items[e].transformString), h(["apply"]), p.updateHandles())
			}), p
		}, p.unplug = function() {
			var e = p.attrs;
			return p.hideHandles(), delete t.freeTransform, e
		}, a(t), p.items.map(function(t, e) {
			t.el._ && t.el._.transform && "object" == typeof t.el._.transform && t.el._.transform.map(function(t) {
				if (t[0]) switch (t[0].toUpperCase()) {
					case "T":
						p.items[e].attrs.translate.x += t[1], p.items[e].attrs.translate.y += t[2];
						break;
					case "S":
						p.items[e].attrs.scale.x *= t[1], p.items[e].attrs.scale.y *= t[2];
						break;
					case "R":
						p.items[e].attrs.rotate += t[1]
				}
			})
		}), "set" !== t.type && (p.attrs.rotate = p.items[0].attrs.rotate, p.attrs.scale = p.items[0].attrs.scale, p.attrs.translate = p.items[0].attrs.translate, p.items[0].attrs = {
			rotate: 0,
			scale: {
				x: 1,
				y: 1
			},
			translate: {
				x: 0,
				y: 0
			}
		}, p.items[0].transformString = ""), p.attrs.ratio = p.attrs.scale.x / p.attrs.scale.y;
		var f = !1;
		return p.updateHandles(), p
	}
}),
function(t, e) {
	"use strict";

	function r(t) {
		return t.preventDefault && t.preventDefault(), !1
	}

	function a(t, r) {
		var a = (t.attr("class") || "").split(" ");
		"string" == typeof r && (r = r.split(" "));
		var i = e.compact(e.union(a, r));
		t.attr("class", i.join(" "))
	}

	function i(t, r) {
		var a = (t.attr("class") || "").split(" ");
		"string" == typeof r && (r = r.split(" "));
		var i = e.compact(e.difference(a, r));
		t.attr("class", i.join(" "))
	}

	function n(t) {
		return t === w ? [] : t instanceof Array ? t : [t]
	}

	function o(t) {
		return t ? t.replace(/['"\\]/g, "") : t
	}

	function s(t, r) {
		r = r || e.keys(t);
		for (var a = 0; a < r.length; a++) {
			var i = r[a];
			"number" == typeof t[i] && (t[i] = parseInt(t[i]))
		}
	}

	function l(t, r) {
		return t.length === r.length && 0 === e.difference(t, r).length
	}

	function c(t, e) {
		e = e || {};
		var r = t.attrs;
		if (e.dx !== w && (r.translate.x = parseFloat(e.dx)), e.ddx !== w && (r.translate.x += parseFloat(e.ddx)), e.dy !== w && (r.translate.y = parseFloat(e.dy)), e.ddy !== w && (r.translate.y += parseFloat(e.ddy)), e.rotateZ !== w && (r.rotate = parseFloat(e.rotateZ)), e.drotateZ !== w && (r.rotate += parseFloat(e.drotateZ)), e.scale !== w) {
			var a = parseFloat(e.scale);
			a < C && (a = C), r.scale.x = a, r.scale.y = a
		}
		if (e.dscale !== w) {
			var i = parseFloat(e.dscale);
			r.scale.x += i, r.scale.x < C && (r.scale.x = C), r.scale.y += i, r.scale.y < C && (r.scale.y = C)
		}
		t.apply()
	}

	function h(t) {
		var e = t.attrs;
		return {
			dx: e.translate.x,
			dy: e.translate.y,
			rotateZ: e.rotate,
			scale: e.scale.x
		}
	}

	function d(t) {
		0 === t.length && console.error("at least one item is required. (getBBox())");
		var r = 1 / 0,
			a = 1 / 0,
			i = -1 / 0,
			n = -1 / 0;
		return e.each(t, function(t) {
			var e = t.getBBox();
			r > e.x && (r = e.x), a > e.y && (a = e.y), i < e.x2 && (i = e.x2), n < e.y2 && (n = e.y2)
		}), {
			x: r,
			y: a,
			x2: i,
			y2: n,
			width: i - r,
			height: n - a
		}
	}

	function u(t) {
		return t.data(k).__canvas.transformable
	}

	function p(t) {
		return t.data(k).__canvas.isSlot
	}

	function f(t) {
		return p(t) && !t.data(k).__canvas.insertedItem
	}

	function g(e, r) {
		e.data(k).__canvas.targetSlot = r, r.data(k).__canvas.insertedItem = e, a(t(r.node), "polymer-slot-fill")
	}

	function m(e) {
		var r = e.data(k).__canvas.targetSlot;
		r && (r.data(k).__canvas.insertedItem = null, e.data(k).__canvas.targetSlot = null, i(t(r.node), "polymer-slot-fill"))
	}

	function x(t, r) {
		var a = ["image", "text"];
		"bottom" === r ? r = "prev" : "top" === r && (r = "next");
		do {
			t = t[r]
		} while (t && e.indexOf(a, t.type) < 0);
		return t
	}

	function v() {
		this._stack = [], this._top = -1
	}
	var y, _ = "codibook polymer version 0.1.0",
		b = {};
	if (b._signiture = _, b.noConflict = function(t) {
			return window && (t && (window[t] = b), window.Polymer = y), b
		}, window) {
		if (window.Polymer) {
			if (window.Polymer._signiture === _) return;
			y = window.Polymer
		}
		window.Polymer = b
	}
	var w = [][0],
		k = "polymer_metadata",
		C = .05,
		B = {
			animate: !1,
			attrs: {
				fill: "#AAA",
				stroke: "#000"
			},
			drag: ["self"],
			keepRatio: ["axisY"],
			rotate: ["axisY"],
			scale: ["axisY"],
			snap: {
				rotate: 90
			},
			snapDist: {
				rotate: 5
			},
			range: {
				scale: [12, 99999]
			},
			size: 17
		},
		S = {
			animate: !1,
			drag: !1,
			rotate: !1,
			scale: !1
		},
		I = {
			animate: !1,
			drag: !1,
			rotate: !1,
			scale: !1
		};
	v.prototype.do_ = function(t) {
		this._top++, this._stack[this._top] = t, this._top + 1 < this._stack.length && (this._stack = this._stack.slice(0, this._top + 1))
	}, v.prototype.top = function() {
		return this.undoable() ? this._stack[this._top] : null
	}, v.prototype.operations = function() {
		return this._stack
	}, v.prototype.undo = function() {
		if (!this.undoable()) return null;
		var t = this._stack[this._top];
		return this._top--, t
	}, v.prototype.undoable = function() {
		return this._top >= 0
	}, v.prototype.redo = function() {
		return this.redoable() ? (this._top++, this._stack[this._top]) : null
	}, v.prototype.redoable = function() {
		return this._top + 1 < this._stack.length
	};
	var T = function(r) {
		this.freeTransformOptions = B, this.slotFreeTransformOptions = S, this.untransformableFreeTransformOptions = I, this._lastItemID = 0, this._Raphael = null, this._paper = null, this._canvasBase = null, this._items = [], this._slots = [], this._untransformable = [], this._selectedItems = [], this._deletedItems = [], this._operationHistory = null, this._operationBeforeState = null, this._undoMergeFench = !0, this._timeoutIDs = {}, this._lastTransformStates = {}, this._mouseWheelDeltaSum = 0, this._eventListeners = [], this._overrideHandleAttrs = {}, this._advancedMode = !1, window && (window.Raphael ? this._Raphael = window.Raphael : window.DOMRaphael && (this._Raphael = window.DOMRaphael));
		var a = this;
		this._canvasBaseKeydown = function(t) {
			if (9 === t.which) {
				if (0 === a._items.length) return;
				var r, i, o;
				if (t.shiftKey ? (r = "prev", i = "top") : (r = "next", i = "bottom"), a._selectedItems.length ? o = x(a._selectedItems[0], r) : (o = a._paper[i], "top" === i && (o = x(o, "prev"))), !a._advancedMode && o)
					for (; o && !u(o);) o = x(a._selectedItems[0], r);
				o ? (a._selectItems(o), t.preventDefault()) : a._selectItems([])
			} else if (t.which >= 37 && t.which <= 40) {
				var s = a.items("selected");
				if (0 === s.length) return;
				var l = 0,
					d = 0;
				switch (t.which) {
					case 37:
						l = -1;
						break;
					case 38:
						d = -1;
						break;
					case 39:
						l = 1;
						break;
					case 40:
						d = 1
				}
				t.shiftKey || (l *= 10, d *= 10), e.each(s, function(t) {
					var e = t.freeTransform,
						r = h(e);
					c(e, {
						ddx: l,
						ddy: d
					});
					var i = h(e);
					a._do({
						type: "transform.byKeyboard.arrowKeys",
						targets: n(t),
						before: r,
						after: i
					}, !0)
				})
			}
		}, this._canvasMousedown = function(t) {
			t.target === a._paper.canvas && a._selectedItems.length && a._selectItems([])
		}, this._canvasMousewheel = function(t) {
			var r = a.items("selected");
			if (0 !== r.length) {
				t.preventDefault();
				var i = 0;
				t.originalEvent.wheelDeltaY !== w ? a._mouseWheelDeltaSum += t.originalEvent.wheelDeltaY : t.originalEvent.deltaY !== w ? a._mouseWheelDeltaSum -= 120 * t.originalEvent.deltaY : t.originalEvent.detail !== w ? a._mouseWheelDeltaSum += 120 * t.originalEvent.detail : t.originalEvent.wheelDelta !== w && (a._mouseWheelDeltaSum += t.originalEvent.wheelDelta), a._mouseWheelDeltaSum >= 120 ? (a._mouseWheelDeltaSum = 0, i = .1) : a._mouseWheelDeltaSum <= -120 && (a._mouseWheelDeltaSum = 0, i = -.1), i && e.each(r, function(t) {
					var e = t.freeTransform,
						r = h(e);
					c(e, {
						dscale: i
					});
					var o = h(e);
					a._do({
						type: "transform.byMousewheel",
						targets: n(t),
						before: r,
						after: o
					}, !0)
				})
			}
		}, this._itemMousedown = function(t) {
			return a._advancedMode || u(this) ? a._selectItems(this) : a._selectItems([]), !1
		}, this._freeTransformCallback = function(t, r) {
			if (e.intersection(r, ["init"]).length > 0) {
				if (a._overrideHandleAttrs && a._overrideHandleAttrs.disc) try {
					t.handles.y && t.handles.y.disc.attr(a._overrideHandleAttrs.disc), t.handles.x && t.handles.x.disc.attr(a._overrideHandleAttrs.disc)
				} catch (e) {
					console.error(e), console.log(r), console.log(t)
				}
				a._emitEvent({
					type: "init_freetransform",
					targets: n(t.items[0].el)
				})
			} else if (e.intersection(r, ["drag start", "rotate start", "scale start"]).length > 0) a._operationBeforeState = h(t);
			else if (e.intersection(r, ["drag end", "rotate end", "scale end"]).length > 0) {
				var i = h(t);
				a._operationBeforeState && !e.isEqual(a._operationBeforeState, i) && (m(t.items[0].el), a._do({
					type: "transform",
					targets: n(t.items[0].el),
					before: a._operationBeforeState,
					after: i
				})), a._operationBeforeState = null
			}
		}, t(window).resize(e.throttle(a._resizePaper.bind(a), 400)), this.init(r)
	};
	T.prototype.init = function(r) {
		(r = r || {}).Raphael && (this._Raphael = r.Raphael), this.deleteItems(), e.each(this._deletedItems, function(t) {
			t.freeTransform.unplug(), t.remove()
		}), this._deletedItems = [], this._lastItemID = 0, this._paper && (t(this._paper.canvas).off("mousedown", this._canvasMousedown).off("mousewheel DOMMouseScroll wheel", this._canvasMousewheel), t(this._canvasBase).off("keydown", this._canvasBaseKeydown).removeAttr("tabindex"), this._paper.remove(), this._paper = null, this._canvasBase = null), this.resetOperationHistory(), this.freeTransformOptions = B, this.slotFreeTransformOptions = S, this.untransformableFreeTransformOptions = I, this._advancedMode = r.advancedMode
	}, T.prototype.addEventListener = function(t) {
		this._eventListeners.push(t)
	}, T.prototype.removeEventListener = function(t) {
		this._eventListeners = t === w ? [] : e.without(this._eventListeners, t)
	}, T.prototype._emitEvent = function(t) {
		e.each(this._eventListeners, function(e) {
			e(t)
		})
	}, T.prototype.resetOperationHistory = function() {
		this._undoMergeFench = !0, this._operationBeforeState = null, this._operationHistory = new v
	}, T.prototype._resizePaper = function() {
		var r = t(this._canvasBase),
			a = r.width(),
			i = r.height();
		r.find("svg").length && this._paper.setSize(a, i);
		var n = this.items("whole");
		e.each(n, function(t) {
			t.freeTransform.setOpts({
				boundary: {
					x: 0,
					y: 0,
					width: a,
					height: i
				}
			})
		}), this.updateHandles(n), this.relocateItems()
	}, T.prototype.canvas = function() {
		if (0 === arguments.length) return this._paper;
		this._paper = this._Raphael.apply(this, arguments), t(this._paper.canvas).mousedown(this._canvasMousedown).on("mousewheel DOMMouseScroll wheel", this._canvasMousewheel), this._mouseWheelDeltaSum = 0;
		var e = t(this._paper.canvas);
		return "svg" === e.prop("tagName").toLowerCase() && (e = e.parent()), this._canvasBase = e.get(0), e.attr("tabindex", "0").keydown(this._canvasBaseKeydown), this._paper
	}, T.prototype.items = function(t) {
		if ("all" === t || t === w) return this._items.slice(0);
		if ("selected" === t) return this._selectedItems.slice(0);
		if ("whole" === t) return this._items.concat(this._deletedItems);
		if ("transformable" === t) return e.difference(this._items, this._untransformable);
		t = n(t);
		for (var r, a = [], i = [], o = 0; o < t.length; o++) {
			var s = t[o];
			"string" == typeof s ? r = this._getItemByID(s) : (r = this._addItem(s), i.push(r)), a.push(r)
		}
		if (i.length) {
			this._do({
				type: "addItems",
				targets: i
			});
			var l = this._advancedMode ? i : e.filter(i, u);
			this._selectItems(l)
		}
		return a
	}, T.prototype._addItem = function(i) {
		var n = {
			rotateZ: 0,
			scale: 1,
			dx: 0,
			dy: 0,
			metadata: {}
		};
		i = e.extend(n, i), this._lastItemID++;
		var o, s = i.metadata.__canvas = {
				id: "polymer.canvas.item." + this._lastItemID,
				transformable: !0,
				targetSlot: null
			},
			l = parseFloat(i.x),
			h = parseFloat(i.y),
			d = parseFloat(i.width),
			f = parseFloat(i.height);
		if (i.src) o = this._paper.image(i.src, l, h, d, f);
		else if (i.text) o = this._paper.text(l, h, i.text);
		else {
			if (!i.slot) throw new Error("one of opts.src, opts.text or opts.slot must be set!");
			o = this._paper.rect(l, h, d, f), s.transformable = !1, s.isSlot = !0, s.insertedItem = null
		}
		if (!1 === i.transformable && (s.transformable = !1), o.data(k, i.metadata), o.mousedown(this._itemMousedown), "text" === o.type) {
			var g = e.pick(i, "fill", "font-family", "font-size", "font-weight");
			o.attr(g)
		}
		var m = this.freeTransformOptions;
		if (!this._advancedMode) {
			var x = t(o.node);
			p(o) ? (m = this.slotFreeTransformOptions, a(x, "polymer-slot polymer-untransformable")) : u(o) || (m = this.untransformableFreeTransformOptions, a(x, "polymer-untransformable"), o.mousedown(r))
		}
		return c(this._paper.freeTransform(o, m, this._freeTransformCallback), i), this._items.push(o), i.slot && this._slots.push(o), (i.slot || !1 === i.transformable) && this._untransformable.push(o), o
	}, T.prototype.deleteItems = function(t) {
		var e = this._parseItemTargetOption(t);
		0 !== e.length && (this._deleteItems(e), this._do({
			type: "deleteItems",
			targets: e
		}))
	}, T.prototype._deleteItems = function(t) {
		this._selectItems([], t), e.each(t, function(t) {
			t.hide()
		}), this._items = e.difference(this._items, t), this._deletedItems = this._deletedItems.concat(t), this._slots = e.difference(this._slots, t), this._untransformable = e.difference(this._untransformable, t)
	}, T.prototype._undeleteItems = function(t) {
		e.each(t, function(t) {
			t.show()
		}), this._deletedItems = e.difference(this._deletedItems, t), this._items = this._items.concat(t), this._slots = this._slots.concat(e.filter(t, p)), this._untransformable = this._untransformable.concat(e.reject(t, u)), this.relocateItems()
	}, T.prototype.attr = function(t, r, a) {
		var i = this._parseItemTargetOption(t),
			n = [];
		if (e.each(i, function(t) {
				n.push(t.attr(r))
			}), a !== w && e.without(n, a).length > 0) {
			var o = this;
			e.each(i, function(t) {
				t.attr(r, a);
				var e = t.data(k).__canvas.id;
				t.freeTransform && t.freeTransform.unplug && (o._lastTransformStates[e] = h(t.freeTransform), t.freeTransform.unplug());
				var i = "refreetransform." + e;
				clearTimeout(o._timeoutIDs[i]), o._timeoutIDs[i] = setTimeout(function() {
					c(o._paper.freeTransform(t, o.freeTransformOptions, o._freeTransformCallback), o._lastTransformStates[e]), delete o._timeoutIDs[i], delete o._lastTransformStates[e]
				}, 300)
			});
			var s = "text" === r;
			this._do({
				type: "attr",
				targets: i,
				attrName: r,
				before: n,
				after: a
			}, s)
		}
		return n
	}, T.prototype.moveToSlot = function(t, r) {
		if (t instanceof Array && (t = t[0]), t) {
			var a = e.filter(this._slots, f);
			if (0 === a.length) return m(t);
			var i, o = t.getBBox(),
				s = o.x + o.width / 2,
				l = o.y + o.height / 2;
			a = e.sortBy(this._slots, function(t) {
				var e = t.getBBox(),
					r = e.x + e.width / 2,
					a = e.y + e.height / 2,
					i = r - s,
					n = a - l;
				return i * i + n * n
			});
			var d;
			if ("NEAREST" === r.selectionRule) d = a[0];
			else if ("NEAREST_OVERLAPPED" === r.selectionRule)
				for (var u = 0; u < a.length; u++) {
					var p = a[u];
					if ((i = p.getBBox()).x <= o.x2 && o.x <= i.x2 && i.y <= o.y2 && o.y <= i.y2) {
						d = p;
						break
					}
				}
			if (!d) return m(t);
			var x = t.freeTransform,
				v = h(x);
			i = d.getBBox(), c(x, {
				scale: 1,
				rotateZ: d.freeTransform.attrs.rotate
			}), o = t.getBBox();
			var y = i.width / o.width,
				_ = i.height / o.height;
			c(x, {
				scale: Math.min(y, _),
				ddx: i.x + i.width / 2 - (o.x + o.width / 2),
				ddy: i.y + i.height / 2 - (o.y + o.height / 2)
			}), m(t), g(t, d), this._do({
				type: "transform.addToSlot",
				targets: n(t),
				before: v,
				after: h(t.freeTransform)
			}, !0)
		}
	}, T.prototype.moveLayer = function(t, e) {
		var r = this._parseItemTargetOption(t);
		if (0 !== r.length && r.length !== this._items.length)
			if ("up" !== e && "down" != e) {
				r.length > 1 && console.log("move multiple layer is not supported yet. applying only the first one");
				var a;
				if ("top" === e) {
					if (!(a = x(r[0], "next"))) return;
					r[0].toFront()
				} else {
					if ("bottom" !== e) throw new Error("unsupported direction: " + e);
					if (!(a = x(r[0], "prev"))) return;
					r[0].toBack()
				}
				this._do({
					type: "moveLayer",
					targets: r,
					direction: e,
					oldSibling: a
				}), this._toFrontHandles(r)
			} else console.error("up and down are not supported yet")
	}, T.prototype.scale = function(t) {
		var r = this.items("whole");
		e.each(this._deletedItems, function(t) {
			t.show()
		});
		var a = this.exports(r, {
			sortBy: "none",
			slots: 1
		}).items;
		e.each(this._deletedItems, function(t) {
			t.hide()
		});
		for (var i = 0; i < r.length; i++) {
			var n = r[i],
				o = a[i],
				s = n.freeTransform,
				l = h(s),
				d = 0,
				u = 0;
			"text" !== o.type && (d = o.width / 2, u = o.height / 2), c(s, {
				ddx: (t - 1) * (o.x + l.dx + d),
				ddy: (t - 1) * (o.y + l.dy + u),
				scale: l.scale * t
			})
		}
		var p = this._operationHistory.operations();
		e.each(p, function(i) {
			var n = i.targets[0];
			if ("transform" === i.type.split(".")[0]) {
				var o = e.indexOf(r, n);
				if (o < 0) return void console.error("assertion fail while relocateItems()");
				var s = a[o],
					l = 0,
					c = 0;
				"text" !== s.type && (l = s.width / 2, c = s.height / 2), i.before.dx += (t - 1) * (s.x + i.before.dx + l), i.before.dy += (t - 1) * (s.y + i.before.dy + c), i.before.scale *= t, i.after.dx += (t - 1) * (s.x + i.after.dx + l), i.after.dy += (t - 1) * (s.y + i.after.dy + c), i.after.scale *= t
			}
		})
	}, T.prototype.translate = function(t, r) {
		var a = this.items("whole"),
			i = this._operationHistory.operations();
		e.each(a, function(e) {
			c(e.freeTransform, {
				ddx: t,
				ddy: r
			})
		}), e.each(i, function(e) {
			"transform" === e.type.split(".")[0] && (e.before.dx += t, e.before.dy += r, e.after.dx += t, e.after.dy += r)
		})
	}, T.prototype.relocateItems = function() {
		if (0 !== this._items.length) {
			var e = d(this._items),
				r = t(this._paper.canvas),
				a = r.width(),
				i = r.height(),
				n = Math.min(a / e.width, i / e.height);
			n < 1 && (this.scale(n), e = d(this._items));
			var o = 0,
				s = 0;
			e.x < 0 ? o = -e.x : e.x2 > a && (o = a - e.x2), e.y < 0 ? s = -e.y : e.y2 > i && (s = i - e.y2), 0 === o && 0 === s || this.translate(o, s)
		}
	}, T.prototype._do = function(t, e) {
		if (e && !this._undoMergeFench) {
			var r = this._operationHistory.top();
			if (r && r.type === t.type && l(r.targets, t.targets)) switch (t.type.split(".")[0]) {
				case "attr":
					r.attrName === t.attrName && (this._operationHistory.undo(), t.before = r.before);
					break;
				case "transform":
					this._operationHistory.undo(), t.before = r.before
			}
		}
		this._operationHistory.do_(t), this._undoMergeFench = !1, this._emitEvent(t)
	}, T.prototype.undo = function() {
		var t = this._operationHistory.undo();
		if (!t) return !1;
		var r = t.targets;
		switch (t.type.split(".")[0]) {
			case "addItems":
				this._deleteItems(r);
				break;
			case "deleteItems":
				this._undeleteItems(r);
				break;
			case "transform":
				e.each(r, function(e) {
					c(e.freeTransform, t.before)
				});
				break;
			case "moveLayer":
				var a, i = t.direction;
				if ("top" === i) a = "insertBefore";
				else {
					if ("bottom" !== i) throw new Error("unsupported direction: " + i);
					a = "insertAfter"
				}
				r[0][a](t.oldSibling), this._toFrontHandles(r);
				break;
			case "attr":
				for (var n = 0; n < r.length; n++) r[n].attr(t.attrName, t.before[n]);
				break;
			default:
				console.error("unsupported operation type: " + t.type)
		}
		return this._undoMergeFench = !0, this._emitEvent({
			type: t.type + "_undo",
			targets: r
		}), !0
	}, T.prototype.undoable = function() {
		return this._operationHistory.undoable()
	}, T.prototype.redo = function() {
		var t = this._operationHistory.redo();
		if (!t) return !1;
		var r = t.targets;
		switch (t.type.split(".")[0]) {
			case "addItems":
				this._undeleteItems(r);
				break;
			case "deleteItems":
				this._deleteItems(r);
				break;
			case "transform":
				e.each(r, function(e) {
					c(e.freeTransform, t.after)
				});
				break;
			case "moveLayer":
				var a, i = t.direction;
				if ("top" === i) a = "toFront";
				else {
					if ("bottom" !== i) throw new Error("unsupported direction: " + i);
					a = "toBack"
				}
				r[0][a](), this._toFrontHandles(r);
				break;
			case "attr":
				e.each(r, function(e) {
					e.attr(t.attrName, t.after)
				});
				break;
			default:
				console.error("unsupported operation type: " + t.type)
		}
		return this._undoMergeFench = !0, this._emitEvent({
			type: t.type + "_redo",
			targets: r
		}), !0
	}, T.prototype.redoable = function() {
		return this._operationHistory.redoable()
	}, T.prototype.exports = function(r, a) {
		a = a || {};
		for (var i = this._parseItemTargetOption(r), n = [], l = [], c = 0, d = (i = this._sortItems(i, a.sortBy)).length; c < d; c++) {
			var u = i[c],
				f = u.getBBox(),
				g = u.getBBox(!0),
				m = u.data(k),
				x = {
					type: u.type,
					metadata: e.omit(m, ["__canvas"])
				};
			if (e.extend(x, e.pick(g, "x", "y", "width", "height")), "text" === u.type) {
				if ("" === x.text && a.excludInvisible) continue;
				x.y += g.height / 2, x.x += g.width / 2, e.extend(x, {
					text: u.attr("text"),
					fill: u.attr("fill"),
					"font-family": o(u.attr("font-family")),
					"font-size": parseInt(u.attr("font-size")),
					"font-weight": u.attr("font-weight")
				})
			} else if ("image" === u.type) {
				if (x.src = u.attr("src"), a.excludInvisible && (f.width <= 0 || f.height <= 0 || Math.max(f.x, f.x2) < 0 || Math.max(f.y, f.y2) < 0)) continue
			} else if (p(u)) {
				if (-1 === a.slots || 1 !== a.slots && !this._advancedMode) continue;
				x.slot = !0
			}!1 === m.__canvas.transformable && (x.transformable = !1), e.extend(x, h(u.freeTransform));
			var v = x.scale;
			Math.abs(v) <= C && a.excludInvisible || (x.calculated = {
				x: g.x + x.dx - g.width * (v - 1) / 2,
				y: g.y + x.dy - g.height * (v - 1) / 2,
				width: g.width * v,
				height: g.height * v
			}, x.bbox = e.pick(f, "x", "y", "x2", "y2", "width", "height"), "int" !== a.numberType && "integer" !== a.numberType || (s(x, ["x", "y", "width", "height", "dx", "dy"]), s(x.calculated), s(x.bbox)), n.push(x), l.push(u))
		}
		var y = t(this._paper.canvas),
			_ = {
				canvas: {
					width: y.width(),
					height: y.height()
				},
				items: n
			};
		return a.debug && (_.debug = l), _
	}, T.prototype._sortItems = function(t, r) {
		if ("none" === r || t.length <= 1) return t;
		var a = [];
		if ("layer" === r || r === w) {
			var i;
			for (i = t[0]; i.prev;) i = i.prev;
			for (; i && a.length < t.length;) e.indexOf(t, i) >= 0 && a.push(i), i = i.next
		} else console.error("unsupported sortBy parameter: " + r), a = t;
		return a
	}, T.prototype.imports = function(e) {
		"string" == typeof e && (e = t.parseJSON(e));
		for (var r = e.items || e, a = [], i = 0; i < r.length; i++) {
			var n = r[i],
				o = this._addItem(n);
			a.push(o)
		}
		this.updateHandles(), this.relocateItems(), this._do({
			type: "addItems",
			targets: a
		})
	}, T.prototype._getItemByID = function(t) {
		for (var e = 0, r = this._items.length; e < r; e++)
			if (this._items[e].data(k).__canvas.id === t) return this._items[e];
		return null
	}, T.prototype._itemIDsToItems = function(t) {
		for (var e = [], r = 0; r < t.length; r++) {
			var a = t[r];
			"string" == typeof a && (a = this._getItemByID(a)), e.push(a)
		}
		return e
	}, T.prototype._selectItems = function(r, a) {
		var i = this._parseItemTargetOption(r),
			n = this._parseItemTargetOption(a);
		n = e.difference(n, i), n = e.intersection(n, this._selectedItems);
		var o, s, l, c = e.difference(i, this._selectedItems);
		for (o = 0; o < n.length; o++)(l = (s = n[o]).freeTransform).handles.y.line.hide(), l.handles.y.disc.hide(), l.handles.x && (l.handles.x.line.hide(), l.handles.x.disc.hide());
		for (n.length && (this._undoMergeFench = !0, this._selectedItems = e.difference(this._selectedItems, n), this._emitEvent({
				type: "deselectItems",
				targets: n
			})), o = 0; o < c.length; o++)(l = (s = c[o]).freeTransform).handles.y.line.show(), l.handles.y.disc.show(), l.handles.x && (l.handles.x.line.show(), l.handles.x.disc.show()), this._selectedItems.push(s);
		c.length && (this._undoMergeFench = !0, this._toFrontHandles(this._selectedItems), this._emitEvent({
			type: "selectItems",
			targets: c
		}), t(this._canvasBase).focus()), 0 === this._selectedItems.length && n.length > 0 && (this._undoMergeFench = !0, this._emitEvent({
			type: "deselectAllItems",
			targets: []
		}))
	}, T.prototype._parseItemTargetOption = function(t) {
		return "all" === t || t === w ? this._items : "selected" === t ? this._selectedItems : "whole" === t ? this._items.concat(this._deletedItems) : "transformable" === t ? e.difference(this._items, this._untransformable) : this._itemIDsToItems(n(t))
	}, T.prototype._toFrontHandles = function(t) {
		t = e.intersection(t, this._selectedItems), e.each(t, function(t) {
			var e = t.freeTransform;
			e.handles.y.line.toFront(), e.handles.y.disc.toFront(), e.handles.x && (e.handles.x.line.toFront(), e.handles.x.disc.toFront())
		})
	}, T.prototype.updateHandles = function(t) {
		var r, a, i = this._parseItemTargetOption(t),
			n = e.intersection(i, this._selectedItems),
			o = e.difference(i, n);
		for (r = 0; r < o.length; r++)(a = o[r].freeTransform) && (a.handles.y && (a.handles.y.line.hide(), a.handles.y.disc.hide()), a.handles.x && (a.handles.x.line.hide(), a.handles.x.disc.hide()));
		for (r = 0; r < n.length; r++) n[r], (a = t.freeTransform) && (a.handles.y && (a.handles.y.line.show(), a.handles.y.disc.show()), a.handles.x && (a.handles.x.line.show(), a.handles.x.disc.show()));
		this._toFrontHandles(n)
	}, T.prototype.overrideHandleAttrs = function(t, e) {
		this._overrideHandleAttrs[t] = e
	}, b.Canvas = T
}(jQuery, _);
var Navigator = {
	option: {},
	isCategoryFolded: !1,
	tab: "",
	autoLimit: 24,
	tabIndex: 0,
	apiUrl: "/api/item?imgConcurrency=-1&nukki=1&",
	initialized: [],
	tabs: [{
		apiUrl: "/api/item?imgConcurrency=-1&nukki=1&",
		option: {},
		page: 1,
		limit: 24,
		total: 0
	}, {
		apiUrl: "/api/me/likes/item?",
		option: {},
		page: 1,
		limit: 24,
		total: 0
	}, {
		apiUrl: "/api/me/cart?",
		option: {},
		page: 1,
		limit: 24,
		total: 0
	}, {
		apiUrl: "/api/me/upload/item?",
		option: {},
		page: 1,
		limit: 24,
		total: 0
	}]
};
Codibook.collage && Codibook.collage.shop_id && (Navigator.tabs[0].option.shop_id = Codibook.collage.shop_id, Navigator.tabs[1].option.shop_id = Codibook.collage.shop_id, Navigator.tabs[2].option.shop_id = Codibook.collage.shop_id, Navigator.tabs[3].option.shop_id = Codibook.collage.shop_id), Navigator.init = function(t) {
	Navigator.tabIndex = t.tabIndex, Navigator.tab = "#" + $(".ui-tabs-panel")[Navigator.tabIndex].id, Navigator.getShop();
	var e = $(Navigator.tab);
	void 0 !== t.bindThumb && (Navigator.bindThumb = t.bindThumb), "#all_panel" == Navigator.tab ? Navigator.loadItemCategory() : Navigator.loadItem(), e.find("form.search").on("submit", function(t) {
		t.preventDefault();
		var r = e.find(".search_string").val();
		r.length > 0 ? (Navigator.isCategoryFold || Navigator.foldCategory({
			title: r
		}), e.find(".search_container button.cancel").show(), e.find("form.search input[type=submit]").hide(), Navigator.loadItem({
			where: "title",
			query: e.find(".search_string").val(),
			pattern: "like"
		}, !0)) : noty({
			text: "검색어를 입력해주세요"
		})
	}), e.find(".search_container button.cancel").click(function(t) {
		t.preventDefault(), Navigator.loadItem({}, !0), 0 === Navigator.tabIndex && Navigator.unFoldCategory(), e.find(".search_string").val(""), e.find(".search_container button.cancel").hide()
	}), e.find(".color").click(function(t) {
		e.find(".color_palette").show()
	}), e.find(".color_palette button").click(function(t) {
		t.preventDefault(), Navigator.loadItem({
			color: $(this).data("color")
		}), e.find(".color_palette").hide(), e.find(".color_icon").css({
			background: $(this).css("background")
		})
	}), e.find(".wrapper").bind("mousewheel", function(t) {
		var e = Navigator.tabIndex,
			r = Navigator.tabs[e];
		return t.originalEvent.wheelDelta < 0 ? r.option.page < Math.ceil(r.option.total / r.option.limit) && Navigator.loadItem({
			page: ++r.option.page
		}) : r.option.page > 1 && Navigator.loadItem({
			page: --r.option.page
		}), !1
	}), Navigator.initialized[Navigator.tabIndex] = !0
}, Navigator.foldCategory = function(t) {
	Navigator.isCategoryFold = !0, $("#all_panel .category_wrapper").removeClass("category_wrapper").addClass("category_wrapper_fold").height("auto"), $("#tab_panel.ui-tabs .pagination_wrapper").show(), $("#tab_panel .sub_menu .sub_title").text(t.title), $("#tab_panel .sub_menu").slideDown(), $(".sub_menu button.back").off("click").on("click", function() {
		Navigator.unFoldCategory()
	})
}, Navigator.unFoldCategory = function() {
	var t = $("#tab_panel").height() - $("#tab_panel .ui-tabs-nav").outerHeight() - $("#tab_panel .tab_menu").outerHeight() - 20;
	Navigator.isCategoryFold = !1, $("#all_panel .category_wrapper_fold").removeClass("category_wrapper_fold").addClass("category_wrapper").height(t), $("#tab_panel.ui-tabs .pagination_wrapper").hide(), $("#tab_panel .sub_menu").slideUp()
}, Navigator.loadItem = function(t, e) {
	var r = $(Navigator.tab),
		a = Navigator.tabIndex,
		i = Navigator.tabs[a];
	void 0 !== e ? (t.page = 1, i.option = t) : $.extend(i.option, t), void 0 !== i.option.page && (i.page = i.option.page), 0 === a && ($("#all_panel .category_wrapper_fold .category_shadow").removeClass("on"), void 0 !== i.option.category_id && r.find('.category_wrapper_fold .category_shadow[data-category_id="' + i.option.category_id + '"]').addClass("on")), void 0 === i.option.color && r.find(".color_icon").removeAttr("style"), void 0 === i.option.shop_id && r.find(".shop select").val(""), i.option.limit = Navigator.autoLimit, $.ajax({
		url: i.apiUrl + $.param(i.option) + "&jade=collage_item",
		success: function(t) {
			i.option.total = $($(t)[0]).text(), Codibook.paginate({
				total: i.option.total,
				limit: i.option.limit,
				page: i.option.page,
				baseurl: "/create"
			}, function(t) {
				r.find(".pagination_wrapper").html(t), r.find(".pagination ul li a").click(function(t) {
					t.preventDefault(), Navigator.loadItem({
						page: $(this).data("page")
					})
				})
			}), r.find(".wrapper").html(t), Codibook.agent.mobile ? r.find(".wrapper .thumb").on("click", Navigator.bindThumb) : r.find(".wrapper .thumb").draggable({
				cursor: "url(/images/cursor/closedhand.cur) 8 8, move",
				appendTo: "#tab_panel",
				helper: "clone"
			})
		}
	})
}, Navigator.loadItemCategory = function() {
	$.ajax({
		url: "/api/item/category?jade=collage_category&imgConcurrency=-1",
		success: function(t) {
			$("#all_panel .category_wrapper").html(t), $("#all_panel .category_wrapper .category_shadow").off("click").on("click", function() {
				var t = $(this).data("category_id"),
					e = $(this).data("title");
				Navigator.foldCategory({
					title: e
				}), Navigator.loadItem({
					page: 1,
					category_id: t
				})
			})
		}
	})
}, Navigator.getShop = function() {
	Codibook.collage && Codibook.collage.shop_id || $.ajax({
		url: "/api/shop?jade=select_shop",
		success: function(t) {
			var e = $(Navigator.tab);
			e.find(".shop").html(t), e.find(".shop select").on("change", function(t) {
				Navigator.loadItem({
					shop_id: this.value
				})
			}).niceSelect()
		}
	})
};
var clickHandler = "ontouchstart" in document.documentElement ? "touchstart" : "click";
Codibook.clickHandler = clickHandler;
var forkId, back;
forkId = function(t) {
	Codibook.token = t, $.ajax({
		url: "/loginByToken",
		type: "POST",
		data: "token=" + t,
		success: function(t) {
			t.err ? AndroidAdapter.onTokenExpired ? AndroidAdapter.onTokenExpired() : showMsg({
				text: "세션이 만료되었습니다. 재로그인 해주시기 바랍니다"
			}) : (Codibook.user_id = t.user_id, Codibook.bindCodiSaveButton(), Codibook.collage.codi_id && !Codibook.collage.exports && $.ajax({
				url: "/api/codi/" + Codibook.collage.codi_id + "?exports=1",
				success: function(t) {
					Codibook.collage.exports = t.exports, Codibook.collage.canvas.imports(t.exports)
				}
			}), "yungg" === Codibook.user_id && location.hostname.indexOf("test.codibook.net") >= 0 && (alert(location.hostname), window.location = "https://p1dev.codibook.net/create_app"))
		}
	})
};
var showMsg = noty;
Codibook.nativeAdapter && Codibook.nativeAdapter.onShowMessage && (showMsg = function(t) {
		return Codibook.nativeAdapter.onShowMessage(t.text), {
			close: function() {}
		}
	}),
	function(t) {
		function e() {
			return N ? "template__" + (Codibook.collage.target_id || "") : Codibook.collage.codi_id || ""
		}

		function r(e) {
			t("#tab_panel").height(e), t(".ui-tabs-panel").height(e - 38), t(".category_wrapper").height(e - 50), t(".loading").height(e - 38)
		}

		function a() {
			t("#tab_panel").addClass("quickRestore"), r(T), L = T
		}

		function i(t) {
			for (var e = [], r = t.exports("all", {
					numberType: "int",
					excludInvisible: !0
				}), a = r.items, i = {}, n = {}, o = 0; o < a.length; o++) i = {
				x: a[o].calculated.x,
				y: a[o].calculated.y,
				width: a[o].calculated.width,
				height: a[o].calculated.height,
				scale: a[o].scale,
				rotateZ: a[o].rotateZ
			}, n = {
				x: a[o].bbox.x,
				y: a[o].bbox.y,
				width: a[o].bbox.width,
				height: a[o].bbox.height
			}, a[o].text ? (i.text = a[o].text, i.font = a[o]["font-family"]) : a[o].slot ? i.slot = !0 : a[o].src && (i.url = a[o].src), e.push({
				item_id: a[o].metadata.itemID,
				img: i,
				box: n
			});
			return {
				export: JSON.stringify({
					canvas: {
						width: B.width,
						height: B.height
					},
					items: e
				}),
				raw_export: JSON.stringify(r)
			}
		}

		function n(e) {
			if (e.preventDefault(), S.items("transformable").length < 3) return showMsg({
				text: t.i18n._("create_save_item_warn")
			}), !1;
			if (S.items("transformable").length > 100) return showMsg({
				text: t.i18n._("create_save_too_many_item_warn")
			}), !1;
			var r = t("form.save textarea.content").val().trim();
			if (!r) return showMsg({
				text: t.i18n._("create_save_desc_warn")
			}), t("form.save textarea.content").focus(), !1;
			var a = Codibook.extractTags(r);
			if (a && a.length > 0) {
				t.each(a, function(t, e) {
					a[t] = e.replace("#", "").trim()
				});
				var n = a.join(",");
				t("form.save .style").val(n), t("form.save .title").val(n + " 코디")
			} else t("form.save .title").val(r.split("\n")[0].trim());
			var o = t("form.save");
			if (!0 === o.data("submitting")) return !1;
			o.data("submitting", !0);
			var s = i(S);
			t("form.save .export").val(s.export), t("form.save .raw_export").val(s.raw_export);
			var l = showMsg({
					text: t.i18n._("create_saving"),
					timeout: !1
				}),
				c = t("form.save .codi_id").val(),
				h = c ? "/api/me/codi/" + c : "/api/me/codi";
			t.ajax({
				type: "POST",
				url: h,
				dataType: "json",
				data: t(this).serialize(),
				headers: {
					token: Codibook.token
				},
				success: function(t) {
					if (l.close(), t.err) showMsg({
						text: t.message,
						type: "error"
					});
					else {
						S.deleteItems();
						var e = !!Codibook.collage.contest_id,
							r = c ? parseInt(c, 10) : t.codi_id;
						Codibook.nativeAdapter && Codibook.nativeAdapter.onCodiCreated ? Codibook.nativeAdapter.onCodiCreated(r, e) : location.href = "/codi/" + r
					}
				},
				error: function(t) {
					l.close(), Codibook.onAjaxError.apply(this, arguments)
				},
				complete: function() {
					o.data("submitting", !1)
				}
			})
		}

		function o() {
			t("#canvas").droppable({
				accept: ".thumb",
				hoverClass: "hover",
				out: function(t) {
					jQuery(this).removeClass("over")
				},
				over: function(t) {
					jQuery(this).addClass("over")
				},
				drop: function(e, r) {
					var a = t(r.helper).children(".data"),
						i = a.data("category_id");
					if (8773165 == i) return s(a.data("item_id"));
					var n, o, l = t(this).offset(),
						c = a.height(),
						h = a.width();
					c > h ? (o = 200, n = 200 * h / c) : (n = 200, o = 200 * c / h);
					var d = {
							x: e.pageX - l.left - n / 2,
							y: e.pageY - l.top - o / 2
						},
						u = {
							x: d.x,
							y: d.y,
							width: n,
							height: o
						};
					4645803 == i ? (u.text = "CODIBOOK", u.scale = 4, u.x += 100, u.y += 100, u.metadata = {
						category_id: i
					}) : t("#canvas_menu input.addSlot[type=checkbox]").prop("checked") ? u.slot = !0 : (u.src = a.data("origin"), u.metadata = {
						itemID: a.data("item_id"),
						thumb: a.attr("src"),
						title: a.data("title"),
						price: a.data("price"),
						price_currency: a.data("price_currency"),
						category_id: i
					}), N && (u.transformable = !1);
					var p = S.items(u);
					e.shiftKey || N || S.moveToSlot(p, {
						selectionRule: "NEAREST_OVERLAPPED"
					})
				}
			})
		}

		function s(e) {
			t.ajax({
				url: "/api/codi_template/" + e,
				success: function(t) {
					S.deleteItems(), S.imports(t.raw_export), S.relocateItems()
				}
			})
		}

		function l(e) {
			var r, a;
			if (e.targets.length && (r = e.targets[0], a = r.freeTransform), "addItems" === e.type) t("#canvas").removeClass("noitem"), t.each(e.targets, function(t, e) {
				a = e.freeTransform;
				var r = S.exports(e).items[0];
				if (r) {
					var i = r.metadata;
					4645803 == i.category_id && e.attr("font-family", i.title), !1 !== r.transformable && e.hover(function(t) {
						if (0 === E.length) {
							var r = 4645803 != S.exports(e).items[0].metadata.category_id && ["circle"];
							this.freeTransform.setOpts({
								draw: r,
								attrs: {
									fill: "#e71d73",
									stroke: "#e71d73"
								}
							}), S.updateHandles(this)
						}
					}, function(t) {
						E.indexOf("item") < 0 && (0 === S.items("selected").length ? this.freeTransform.setOpts({
							draw: !1
						}) : this === S.items("selected")[0] ? this.freeTransform.setOpts({
							attrs: {
								fill: "#fff",
								stroke: "#666"
							}
						}) : this.freeTransform.setOpts({
							draw: !1
						}), S.updateHandles(this))
					})
				}
			}), Codibook.collage.saveCodiTemp();
			else if ("selectItems" === e.type) {
				t("#collage_container .widget").show();
				var i = S.exports(r).items[0],
					n = i.metadata;
				4645803 == n.category_id ? (t("#item_info").hide(), t("#tool_menu_text").show(), t("#tool_menu_text input").val(i.text)) : i.slot ? (t("#item_info").hide(), t("#tool_menu_text").hide()) : (t("#tool_menu_text").hide(), t("#item_info").show(), t("#info_thumb img").attr("src", n.thumb), t("#info_title a").attr("href", "/item/" + n.itemID).attr("target", "_blank").text(n.title), t("#item_info #price").text(c(n)))
			} else "deselectItems" === e.type ? (a.setOpts({
				draw: !1
			}), S.updateHandles(r)) : "deselectAllItems" === e.type ? t("#collage_container .widget").hide() : "deleteItems" === e.type ? (0 === S.items().length && t("#canvas").addClass("noitem"), Codibook.collage.saveCodiTemp()) : "transform" == e.type && (e.before.dx === e.after.dx && e.before.dy === e.after.dy || N || S.moveToSlot(e.targets, {
				selectionRule: "NEAREST_OVERLAPPED"
			}))
		}

		function c(t) {
			var e = t.price_currency || t.price || "";
			return "0" === (e = String(e)).replace(/\D/g, "") ? e = "" : /^[\d,]+$/.test(e) && (e += " won"), e
		}

		function h(e) {
			var r;
			if (e.targets.length && (r = e.targets[0]).freeTransform, "addItems" === e.type) t("#canvas").removeClass("noitem"), Codibook.collage.saveCodiTemp();
			else if ("selectItems" === e.type) {
				t("#canvas_wrapper #collage_item_menu").show();
				var i = S.exports(r).items[0],
					n = i.metadata;
				4645803 == n.category_id ? (t("#item_info").hide(), t("#tool_menu_text").show(), t("#tool_menu_text input").val(i.text)) : i.slot ? (t("#item_info").hide(), t("#tool_menu_text").hide()) : (t("#tool_menu_text").hide(), t("#item_info").show(), t("#info_thumb img").attr("src", n.thumb), t("#info_title a").attr("href", "/item/" + n.itemID).text(n.title), t("#info_title a, #info_icon").off(clickHandler).on(clickHandler, function() {
					Codibook.nativeAdapter && Codibook.nativeAdapter.onOpenItemCalled ? Codibook.nativeAdapter.onOpenItemCalled(parseInt(n.itemID, 10)) : (Codibook.collage.saveCodiTemp(), location.href = "/item/" + n.itemID)
				}), t("#item_info #price").text(c(n)))
			} else "deselectAllItems" === e.type ? t("#canvas_wrapper #collage_item_menu").hide() : "deleteItems" === e.type ? (0 === S.items().length && t("#canvas").addClass("noitem"), Codibook.collage.saveCodiTemp()) : "transform" === e.type && (e.before.dx === e.after.dx && e.before.dy === e.after.dy || N || "addToSlot" === e.subtype || S.moveToSlot(e.targets, {
				selectionRule: "NEAREST_OVERLAPPED"
			}));
			I && T && T != L && a()
		}

		function d(t) {
			var e, r = t.val(),
				a = t.prop("selectionStart");
			if (a) {
				var i = r.lastIndexOf("#", a);
				if (!(i < 0) && (e = Codibook.extractTags(r.substr(i))[0]) && !(i + e.length < a)) return {
					tagString: e,
					startPosition: i
				}
			}
		}

		function u(t) {
			if (!(t.indexOf("#") < 0)) {
				var e = t.split("#").pop();
				if (e) return Codibook.extractTags("#" + e)[0]
			}
		}

		function p() {
			var e, r = {
				width: 360,
				resizable: !1,
				modal: !0,
				draggable: !1,
				autoOpen: !1,
				open: function(r, a) {
					var i = t(this);
					i.find(".tagger_container").html() || (t("#save_dialog_container div.input textarea").on("keyup", function(r) {
						var a, n = t(this),
							o = d(n);
						if (o) a = o.tagString;
						else if (!(a = u(n.val()))) return;
						e !== a && (e = a, t.ajax({
							url: "/api/style?jade=tagger_style&where=title&query=" + encodeURIComponent(a.substr(1)) + "&limit=7",
							success: function(e) {
								i.find(".tagger_container").html(e), i.find("form.save").find(".tagger").on(clickHandler, function() {
									var e, r, a = t(this).text(),
										i = n.val(),
										o = d(n);
									o ? (e = o.tagString, r = o.startPosition) : (e = u(i)) ? r = i.lastIndexOf(e) : (e = "", r = i.length), i = i.substr(0, r) + a + " " + i.substr(r + e.length);
									var s = r + a.length + 1;
									n.val(i).prop("selectionStart", s).prop("selectionEnd", s).focus()
								})
							}
						}))
					}), t.ajax({
						url: "/api/style?jade=tagger_style&suggest=1&limit=7",
						success: function(e) {
							i.find(".tagger_container").html(e);
							var r = i.find("form.save");
							r.find(".cancel").click(function() {
								i.dialog("close")
							}), r.off("submit").on("submit", n), r.find(".tagger").on(clickHandler, function() {
								var e = t(this).text(),
									r = t("#save_dialog_container div.input textarea"),
									a = r.val();
								a && (a += " "), r.val(a + e + " ").focus()
							})
						}
					}))
				},
				close: function(e, r) {
					t("#result").remove()
				}
			};
			Codibook.agent.mobile ? r.position = {
				my: "top",
				at: "top",
				of: window
			} : r.height = 310, Codibook.dialog(t("#save_dialog_container"), r)
		}

		function f() {
			Codibook.dialog(t("#save_template_container"), {
				autoOpen: !1,
				width: 512
			}), t("#save_template_container form.template_save").submit(function(e) {
				e.preventDefault();
				var r = t(this);
				if (r.data("submitting")) return !1;
				if (!r.find("input[name=title]").val()) return showMsg({
					text: "템플릿 이름을 입력하세요"
				}), !1;
				var a = i(S);
				r.find("input[name=export]").val(a.export), r.find("input[name=raw_export]").val(a.raw_export);
				var n = "/api/me/codi_template",
					o = r.find("input[name=template_id]").val();
				o && (n += "/" + o), r.data("submitting", !0);
				var s = showMsg({
					text: "저장중",
					timeout: !1
				});
				t.ajax({
					type: "POST",
					url: n,
					dataType: "json",
					data: r.serialize(),
					success: function(t) {
						s.close(), t.err ? showMsg({
							text: t.message,
							type: "error"
						}) : location.href = "/user/" + Codibook.user_id + "/upload/item"
					},
					error: function(t) {
						s.close(), t.responseJSON && t.responseJSON.message && showMsg({
							text: t.responseJSON.message,
							type: "error"
						})
					},
					complete: function() {
						r.data("submitting", !1)
					}
				})
			})
		}

		function g() {
			t("#save_dialog_container").dialog("open")
		}

		function m() {
			if (A) t("#tip_dialog_container").dialog("open");
			else {
				t("#tip_dialog_container img").each(function() {
					var e = t(this);
					!e.attr("src") && e.data("src") && e.attr("src", e.data("src"))
				}), Codibook.dialog(t("#tip_dialog_container"), {
					width: 800,
					height: 720
				});
				var e = t("#tip_dialog_container .swiper-container").swiper({
					mode: "horizontal",
					bufferPx: 300,
					calculateHeight: !0,
					pagination: "#tip_dialog_container .pagination",
					grabCursor: !0,
					paginationClickable: !0
				});
				t("#tip_dialog_container .arrow-left").on("click", function(t) {
					t.preventDefault(), e.swipePrev()
				}), t("#tip_dialog_container .arrow-right").on("click", function(t) {
					t.preventDefault(), e.swipeNext()
				}), A = !0
			}
			t("#tip_dialog_container").prev().find(".ui-dialog-titlebar-close").show()
		}

		function x() {
			z ? (t("#insta_codi_dialog_container").dialog("open"), t("#insta_codi_dialog_container").prev().find(".ui-dialog-titlebar-close").show()) : t.ajax({
				url: "/api/codi/insta?jade=instacodi_slide&limit=5",
				success: function(e) {
					t("#insta_codi_dialog_container .swiper-wrapper").html(e), Codibook.dialog(t("#insta_codi_dialog_container"), {
						width: 800,
						position: {
							my: "top+10",
							at: "top",
							of: window
						},
						resizable: !1,
						modal: !0,
						draggable: !1
					});
					var r = t("#insta_codi_dialog_container .swiper-container").swiper({
						mode: "horizontal",
						bufferPx: 300,
						calculateHeight: !0,
						loop: !0,
						autoplay: 6e3,
						grabCursor: !0
					});
					t("button.event_desc_button").click(function(t) {
						r.stopAutoplay(), r.swipeTo(5)
					}), z = !0, t("#insta_codi_dialog_container").prev().find(".ui-dialog-titlebar-close").show()
				}
			})
		}

		function v(e) {
			t.ajax({
				url: "/api/item/category?jade=select_category&imgConcurrency=-1",
				success: function(r) {
					e.html(r), e.find("select").on("change", function(e) {
						t("#item_upload_dialog_container .category_id").val(this.value)
					}).selectric({
						responsive: !0
					})
				}
			})
		}

		function y() {
			var e = {
				width: 520,
				resizable: !1,
				draggable: !1,
				autoOpen: !1,
				open: function(e, r) {
					v(t("div.category_container"))
				},
				close: function(e, r) {
					t("form.item_upload .title").val(""), t(".transparent").prop("disabled", !0), t("#item_upload_dialog_container .preview").html("")
				}
			};
			t(".fileupload").fileupload({
				dataType: "json",
				add: function(t, e) {
					var r = [],
						a = /\/(gif|jpe?g|png)$/i;
					e.originalFiles[0].type.length && !a.test(e.originalFiles[0].type) && r.push("올바른 파일타입이 아닙니다"), e.originalFiles[0].size > 10485760 && r.push("업로드 용량이 너무 큽니다 (10mb 이하)"), r.length > 0 ? alert(r.join("\n")) : e.submit()
				},
				done: function(e, r) {
					t.each(r.result.files, function(e, r) {
						r.error ? showMsg({
							text: "업로드 도중 오류가 발생했습니다.",
							type: "error"
						}) : (t("#item_upload_dialog_container input[name=temp_image_name]").val(r.url), t("#item_upload_dialog_container input[name=temp_transparent_image_name]").val(""), t("#item_upload_dialog_container .preview").html('<img src="' + r.url + '" alt="preview" />'), t(".transparent").prop("disabled", !1).prop("checked", !1))
					})
				}
			}), t(".transparent").click(function() {
				var e = t(this).is(":checked") ? 1 : 0,
					r = t("#item_upload_dialog_container input[name=temp_image_name]").val();
				if (e) {
					var a = t("#item_upload_dialog_container input[name=temp_transparent_image_name]").val();
					if (a) return t("#item_upload_dialog_container .preview img").attr("src", a);
					var i = showMsg({
						text: "투명화중..",
						timeout: !1
					});
					t(".transparent").prop("disabled", !0), t.ajax({
						url: "/api/me/image/transparent",
						type: "POST",
						data: {
							t: e,
							temp_image_name: r
						},
						success: function(e) {
							t("#item_upload_dialog_container input[name=temp_transparent_image_name]").val(e.url), t("#item_upload_dialog_container .preview").html('<img src="' + e.url + '" alt="preview" />'), i.close(), t(".transparent").prop("disabled", !1)
						}
					})
				} else t("#item_upload_dialog_container .preview img").attr("src", r)
			});
			var r = !1;
			t("form.item_upload").on("submit", function(e) {
				if (e.preventDefault(), r) return !1;
				var a = t(this);
				return t("form.item_upload .title").val() ? t("#item_upload_dialog_container .category_id").val() ? a.find("input[name=temp_image_name]").val() ? t(".transparent").is(":disabled") ? (showMsg({
					text: "이미지 처리중입니다"
				}), !1) : (r = !0, void t.ajax({
					url: "/api/me/item",
					type: "POST",
					data: t("form.item_upload").serialize(),
					success: function(e) {
						r = !1, e.err ? showMsg({
							text: "업로드 도중 오류가 발생했습니다."
						}) : (t("#item_upload_dialog_container").dialog("close"), t("#tab_panel").tabs("option", "active", 3), Navigator.loadItem())
					},
					error: function() {
						r = !1, Codibook.onAjaxError.apply(this, arguments)
					}
				})) : showMsg({
					text: "올릴 이미지가 없습니다."
				}) : (showMsg({
					text: "카테고리를 선택해주세요"
				}), !1) : (showMsg({
					text: "제목을 입력해주세요"
				}), t("form.item_upload .title").focus(), !1)
			}), Codibook.dialog(t("#item_upload_dialog_container"), e)
		}

		function b() {
			t("#item_upload_dialog_container").dialog("open")
		}

		function w(e) {
			var r = N;
			Codibook.collage.canvas = S = new Polymer.Canvas({
				advancedMode: r
			});
			var a = {
					fill: "#fff",
					stroke: "#666"
				},
				i = 18;
			if (Codibook.agent.mobile ? S.addEventListener(h) : (a.cursor = "crosshair", i = 5, S.addEventListener(l), t(document).on("mouseup", function(t) {
					E = []
				}).on("mousedown", function(t) {
					E.push("item")
				}), o()), S.overrideHandleAttrs("disc", {
					src: "/images/common/bullet_round.png",
					"border-radius": 0
				}), S.freeTransformOptions = {
					animate: !1,
					distance: 1.2,
					attrs: a,
					drag: ["self"],
					keepRatio: ["axisY"],
					rotate: ["axisY"],
					scale: ["axisY"],
					range: {
						scale: [12, 99999]
					},
					size: i
				}, B = S.canvas("canvas"), Codibook.agent.mobile && B.canvas && "SVG" === B.canvas.tagName.toUpperCase()) {
				var n = document.createElementNS("http://www.w3.org/2000/svg", "pattern");
				n.setAttributeNS(null, "id", "mobile_handle1"), n.setAttributeNS(null, "x", 0), n.setAttributeNS(null, "y", 0), n.setAttributeNS(null, "patternUnits", "objectBoundingBox"), n.setAttributeNS(null, "width", 30), n.setAttributeNS(null, "height", 30);
				var s = document.createElementNS("http://www.w3.org/2000/svg", "image");
				s.setAttributeNS(null, "x", 3), s.setAttributeNS(null, "y", 3), s.setAttributeNS(null, "width", 30), s.setAttributeNS(null, "height", 30), s.setAttributeNS("http://www.w3.org/1999/xlink", "href", "/images/common/bullet_round.png"), n.appendChild(s), t("#canvas svg defs").append(n)
			}
			if (Codibook.collage.codi_id) {
				t("form.save .codi_id").val(Codibook.collage.codi_id), t("form.save .title").val(Codibook.collage.title), t("form.save .content").val(Codibook.collage.content);
				for (var c = [], d = 0; d < Codibook.collage.style.length; d++) c.push(Codibook.collage.style[d].title);
				if (t("form.save .style").val(c.join(",")), Codibook.collage.exports)
					if ("N/A" == Codibook.collage.exports) showMsg({
						text: "구버전에서 생성한코디는 수정이 불가능합니다. (업데이트예정)"
					});
					else if (S.imports(Codibook.collage.exports), !N) {
					var u = S.exports();
					if (u.items.length >= 3) {
						var p = 0,
							f = 0;
						_.each(u.items, function(t) {
							p = Math.max(p, t.bbox.x, t.bbox.x2), f = Math.max(f, t.bbox.y, t.bbox.y2)
						});
						var g = Math.max(p / u.canvas.width, f / u.canvas.height);
						g < .7 && S.scale(.8 / g)
					}
				}
			} else Codibook.collage.loadCodiTemp();
			0 === S.items().length && t("#canvas").addClass("noitem"), Codibook.collage.contest_id && t("form.save .contest_id").val(Codibook.collage.contest_id), t("#btn_layer_up").on(clickHandler, function() {
				S.moveLayer("selected", "top")
			}), t("#btn_layer_down").on(clickHandler, function() {
				S.moveLayer("selected", "bottom")
			}), t("#btn_undo").on(clickHandler, function() {
				S.undo()
			}), t("#btn_redo").on(clickHandler, function() {
				S.redo()
			}), t("#btn_delete").on(clickHandler, function() {
				S.deleteItems("selected")
			}), t("#btn_upload").on(clickHandler, function() {
				b()
			}), Codibook.bindCodiSaveButton(), t("#btn_new").on(clickHandler, function() {
				S.deleteItems()
			}), t("#btn_tip").on(clickHandler, function() {
				m()
			}), t("#btn_event").on(clickHandler, function() {
				x()
			}), t("#tool_menu_text input").on("keyup change", function(e) {
				var r = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/,
					a = t(this).val();
				!0 === r.test(a) ? (t(this).val(t(this).val().replace(r, "")), showMsg({
					text: "한글입력은 아직 지원하지 않습니다",
					killer: !0
				})) : t(this).val().length > 0 && S.attr("selected", "text", t(this).val())
			}), t("#tool_menu_text input").on("paste", function(t) {
				t.preventDefault()
			}), e && e()
		}

		function k() {
			if (new Date - F < D) setTimeout(k, D);
			else {
				O = !1;
				var e, i = t(window).width();
				if (Codibook.agent.mobile) {
					e = t(window).height(), I = e > i;
					var n = t("#canvas_wrapper");
					if (n.off("click", a), I) {
						n.on("click", a), t("#collage_container").height(e), n.width(i);
						var o = .63 * e;
						n.height(o), M = (T = .37 * e) + o / 2, r(T), t(".ui-tabs-panel").width(i)
					} else t("#collage_container").height(e), n.width(.58 * i), n.height(e), t("#tab_panel").css("border-left", "1px solid #ccc").height(e), t(".ui-tabs-panel").width(.42 * i), t(".ui-tabs-panel").height(e - 40), t(".category_wrapper").height(e - 50), t(".loading").height(e - 40)
				} else {
					e = t(window).height() - t("#header").outerHeight(!0), t("#collage_container").height(e);
					var s = t("#tab_panel").height() - t("#tab_panel .ui-tabs-nav").outerHeight() - t("#tab_panel .tab_menu").outerHeight() - 20,
						l = t("#tab_panel").width() - 18,
						c = s;
					t(".category_wrapper").height(s);
					var h = Math.max(1, Math.floor(l / 112)),
						d = Math.max(1, Math.floor(c / 125));
					Navigator.autoLimit = h * d
				}
			}
		}

		function C(e) {
			var r = t(this).children("img"),
				a = r.data("item_id");
			if ("upload" == r.data("category_id")) return Codibook.nativeAdapter && Codibook.nativeAdapter.onOpenUploadItemCalled ? Codibook.nativeAdapter.onOpenUploadItemCalled() : showMsg({
				text: "최신버전으로 업데이트해주세요"
			}), !1;
			if (e.timeStamp - j < 1e3 && q == a) return j = e.timeStamp, !1;
			var i = r.data("category_id");
			if (8773165 == i) return s(a);
			q = a, j = e.timeStamp;
			var n, o, l = r.height(),
				c = r.width(),
				h = t("#canvas").width(),
				d = t("#canvas").height();
			l / c > d / h ? n = c * (o = d / 2.5) / l : o = l * (n = h / 2.5) / c;
			var u = (h - n) / 2,
				p = (d - o) / 2,
				f = (Math.random() - .5) * (h - n) / 2,
				g = (Math.random() - .5) * (d - o) / 2;
			S.items({
				x: u + f,
				y: p + g,
				width: n,
				height: o,
				src: r.data("origin"),
				metadata: {
					itemID: a,
					thumb: r.attr("src"),
					title: r.data("title"),
					price: r.data("price"),
					price_currency: r.data("price_currency"),
					category_id: i
				}
			})
		}
		var B, S, I, T, M, N = "template" == Codibook.collage.mode,
			A = !1,
			z = !1,
			F = new Date(1, 1, 2e3, 12, 0, 0),
			O = !1,
			D = 200,
			E = [];
		back = function() {
			var e = !!t("form.save .codi_id").val();
			if (!t("#save_dialog_container").hasClass("ui-dialog-content") || !t("#save_dialog_container").dialog("isOpen")) return Navigator.isShowFilter ? (Navigator.hideFilter(), AndroidAdapter.onBackCalled(3, e), 0) : Navigator.isCategoryFold ? (Navigator.unFoldCategory(), AndroidAdapter.onBackCalled(3, e), 0) : (S.items().length > 0 ? AndroidAdapter.onBackCalled(2, e) : AndroidAdapter.onBackCalled(1, e), 1);
			t("#save_dialog_container").dialog("close"), AndroidAdapter.onBackCalled(3, e)
		};
		var R = "tempSaveData";
		N && (R += "_template"), Codibook.collage.saveCodiTemp = function() {
			if (S) {
				var t = {
					codi_id: e(),
					contest_id: Codibook.collage.contest_id,
					canvasExports: S.exports("all", {
						slots: 1
					})
				};
				Codibook.cacheData(R, t);
				try {
					sessionStorage[R] = JSON.stringify(t)
				} catch (t) {}
			}
		};
		var P = null;
		Codibook.collage.resumeSaveCodiTemp = function() {
			if (!P) {
				var t = Codibook.agent.mobile ? 5e3 : 3e3;
				P = setInterval(Codibook.collage.saveCodiTemp, t)
			}
		}, Codibook.collage.pauseSaveCodiTemp = function() {
			clearInterval(P), P = null
		}, Codibook.collage.loadCodiTemp = function() {
			var t;
			try {
				t = JSON.parse(sessionStorage[R])
			} catch (t) {}
			if (t || (t = Codibook.loadCachedData(R)), t) {
				var r = e();
				if (t.codi_id == r && t.contest_id == Codibook.collage.contest_id && t.canvasExports) return S.imports(t.canvasExports), !0
			}
		};
		var L, H;
		Codibook.collage.onInventoryScrollStart = function() {
			if (I && T && M) {
				var e = this,
					a = t("#tab_panel");
				if (!((L = a.height()) >= M)) {
					var i = e.y,
						n = Date.now();
					H = setInterval(function() {
						if (L >= M) return clearInterval(H);
						var t = i - e.y;
						if (t > 0) {
							var o = Math.min(L + t / 2, M);
							o != L && (a.removeClass("quickRestore"), r(o)), L = o, n = Date.now()
						} else Date.now() - n >= 1e3 && clearInterval(H);
						i = e.y
					}, 1e3 / 60)
				}
			}
		}, Codibook.collage.onInventoryScrollEnd = function() {
			clearInterval(H)
		};
		var j = 0,
			q = 0;
		t(window).resize(function() {
			F = new Date, !1 === O && (O = !0, setTimeout(k, D))
		}), t(document).ready(function() {
			Codibook.agent.mobile && (t.i18n.load(Codibook.dictionary), "Y" != Codibook.loadCachedData("close_firstguide") && t("#first_guide_container") ? t("#first_guide_container").click(function() {
				t(this).hide(), Codibook.cacheData("close_firstguide", "Y")
			}).show() : "Y" != Codibook.loadCachedData("instacodi_viewed") && t("#insta_codi_dialog_container") && (x(), Codibook.cacheData("instacodi_viewed", "Y"))), t("#tab_panel").tabs({
				create: function(t, e) {
					k(), Codibook.agent.mobile ? Navigator.init({
						tabIndex: 0,
						bindThumb: C
					}) : (y(), Navigator.init({
						tabIndex: 0
					}))
				},
				beforeActivate: function(t, e) {
					if (!Codibook.user_id && 0 !== e.newTab.index()) return Codibook.showLoginDialog(), !1
				},
				activate: function(t, e) {
					Navigator.tab = "#" + e.newPanel[0].id, Navigator.tabIndex = e.newTab.index(), Codibook.agent.mobile ? Navigator.initialized[e.newTab.index()] ? 0 === Navigator.tabIndex ? Navigator.unFoldCategory() : (Navigator.foldCategory(), Navigator.loadItem()) : Navigator.init({
						tabIndex: e.newTab.index(),
						bindThumb: C
					}) : Navigator.initialized[e.newTab.index()] || Navigator.init({
						tabIndex: e.newTab.index()
					})
				}
			}), N ? f() : p(), w(), Codibook.collage.resumeSaveCodiTemp(), Codibook.bindLoginDialog(), Codibook.cacheData("visited_collage", "Y")
		}), Codibook.bindCodiSaveButton = function() {
			N ? t("#btn_save").off(clickHandler).on(clickHandler, function() {
				t("#save_template_container").dialog("open")
			}) : t("#btn_save").off("click").on("click", function() {
				if (S.items("transformable").length < 3) return showMsg({
					text: t.i18n._("create_save_item_warn")
				}), !1;
				setTimeout(g, 100)
			})
		}
	}(jQuery);