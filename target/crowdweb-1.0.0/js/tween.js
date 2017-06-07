/**
 * @Author: Rui Luo | takuma888@126.com
 * @Overview: 补间管理
 * @Date: 2010/9/17
 */

/*
Example:
new Tween({
	duration: 1000,
	trans: 'simple',
	from: 200,
	to: 0,
	func:function() {
		var t = this.tween;
		leftView.viewRect = new Rect(t, leftView.viewRect.height);
}});

*/
var Tween = function(){
	var transitions = {simple:function(time, startValue, changeValue, duration) {
		return changeValue * time / duration + startValue
	},backEaseIn:function(t, b, c, d) {
		var s = 1.70158;
		return c * (t /= d) * t * ((s + 1) * t - s) + b
	},backEaseOut:function(t, b, c, d, a, p) {
		var s = 1.70158;
		return c * ((t = t / d - 1) * t * ((s + 1) * t + s) + 1) + b
	},backEaseInOut:function(t, b, c, d, a, p) {
		var s = 1.70158;
		if ((t /= d / 2) < 1) {
			return c / 2 * (t * t * (((s *= (1.525)) + 1) * t - s)) + b
		}
		return c / 2 * ((t -= 2) * t * (((s *= (1.525)) + 1) * t + s) + 2) + b
	},bounceEaseOut:function(t, b, c, d) {
		if ((t /= d) < (1 / 2.75)) {
			return c * (7.5625 * t * t) + b
		} else if (t < (2 / 2.75)) {
			return c * (7.5625 * (t -= (1.5 / 2.75)) * t + 0.75) + b
		} else if (t < (2.5 / 2.75)) {
			return c * (7.5625 * (t -= (2.25 / 2.75)) * t + 0.9375) + b
		} else {
			return c * (7.5625 * (t -= (2.625 / 2.75)) * t + 0.984375) + b
		}
	},bounceEaseIn:function(t, b, c, d) {
		return c - transitions.bounceEaseOut(d - t, 0, c, d) + b
	},bounceEaseInOut:function(t, b, c, d) {
		if (t < d / 2) {
			return transitions.bounceEaseIn(t * 2, 0, c, d) * 0.5 + b
		} else {
			return transitions.bounceEaseOut(t * 2 - d, 0, c, d) * 0.5 + c * 0.5 + b
		}
	},strongEaseInOut:function(t, b, c, d) {
		return c * (t /= d) * t * t * t * t + b
	},regularEaseIn:function(t, b, c, d) {
		return c * (t /= d) * t + b
	},regularEaseOut:function(t, b, c, d) {
		return-c * (t /= d) * (t - 2) + b
	},regularEaseInOut:function(t, b, c, d) {
		if ((t /= d / 2) < 1) {
			return c / 2 * t * t + b
		}
		return-c / 2 * ((--t) * (t - 2) - 1) + b
	},strongEaseIn:function(t, b, c, d) {
		return c * (t /= d) * t * t * t * t + b
	},strongEaseOut:function(t, b, c, d) {
		return c * ((t = t / d - 1) * t * t * t * t + 1) + b
	},strongEaseInOut:function(t, b, c, d) {
		if ((t /= d / 2) < 1) {
			return c / 2 * t * t * t * t * t + b
		}
		return c / 2 * ((t -= 2) * t * t * t * t + 2) + b
	},elasticEaseIn:function(t, b, c, d, a, p) {
		if (t == 0) {
			return b
		}
		if ((t /= d) == 1) {
			return b + c
		}
		if (!p) {
			p = d * 0.3
		}
		if (!a || a < Math.abs(c)) {
			a = c;
			var s = p / 4
		} else {
			var s = p / (2 * Math.PI) * Math.asin(c / a)
		}
		return-(a * Math.pow(2, 10 * (t -= 1)) * Math.sin((t * d - s) * (2 * Math.PI) / p)) + b
	},elasticEaseOut:function(t, b, c, d, a, p) {
		if (t == 0) {
			return b
		}
		if ((t /= d) == 1) {
			return b + c
		}
		if (!p) {
			p = d * 0.3
		}
		if (!a || a < Math.abs(c)) {
			a = c;
			var s = p / 4
		} else {
			var s = p / (2 * Math.PI) * Math.asin(c / a)
		}
		return(a * Math.pow(2, -10 * t) * Math.sin((t * d - s) * (2 * Math.PI) / p) + c + b)
	},elasticEaseInOut:function(t, b, c, d, a, p) {
		if (t == 0) {
			return b
		}
		if ((t /= d / 2) == 2) {
			return b + c
		}
		if (!p) {
			var p = d * (0.3 * 1.5)
		}
		if (!a || a < Math.abs(c)) {
			var a = c;
			var s = p / 4
		} else {
			var s = p / (2 * Math.PI) * Math.asin(c / a)
		}
		if (t < 1) {
			return-0.5 * (a * Math.pow(2, 10 * (t -= 1)) * Math.sin((t * d - s) * (2 * Math.PI) / p)) + b
		}
		return a * Math.pow(2, -10 * (t -= 1)) * Math.sin((t * d - s) * (2 * Math.PI) / p) * 0.5 + c + b
	}};
	var _queue = [];
	var _timer = 0;
	var _interval = 10;

	/**
	 * 添加新的实例到队列
	 * @param instance
	 */
	function _addQueue(instance){
		_queue.push(instance);
		_run();
	}

	/**
	 * 启动循环
	 */
	function _run(){
		if (_timer) return;
		clearInterval(_timer);
		_timer = setInterval(_loop, _interval);
	}

	/**
	 * 主循环
	 */
	function _loop(){
		//console.log(_queue.length);
		if (_queue.length == 0){
			clearInterval(_timer);
			_timer = 0;
			return;
		}
		var now = +new Date();
		for (var n = 0; n < _queue.length; n++){
			var instance = _queue[n];
			instance.passed = now - instance.start;
			if (instance.passed >= instance.duration){
				instance.passed = instance.duration;
				_exec(instance)
				instance.destroy();
				n--;
			}else{
				_exec(instance)
			}
		}
	}

	/**
	 * 缓动公式并回调
	 * @param instance
	 */
	function _exec(instance){
		instance.tween = transitions[instance.trans](instance.passed, instance.from, instance.to - instance.from, instance.duration);
		instance.func();
	}

	/**
	 * indexOf for IE
	 * @param obj
	 */
	function indexOf(obj){
		for (var n = 0, m = this.length; n < m; n++) {
			if (this[n] === obj) {
				return n;
			}
		}
		return -1;
	}
	
	/**
	 * 将再不使用的对象析构
	 * @param cfg
	 */
	function _destroy(){
		var me = this;
		me.ondestroy();
		for (var key in me){
			delete me[key];
		}
		_queue.splice(_queue.indexOf ? _queue.indexOf(me) : indexOf.call(_queue, me), 1);
		me = null;
	}

	/**
	 * 构造函数
	 */
	return function Tween(cfg){
		if (!cfg || this == window) return;
		this.from = cfg.from || 0;
		this.to = cfg.to === undefined ? 1 : cfg.to;
		this.trans = cfg.trans || 'simple';
		this.duration = cfg.duration === undefined ? 1000 : cfg.duration;
		this.func = cfg.func || function(){};
		this.start = +new Date();
		this.destroy = _destroy;
		this.ondestroy = cfg.ondestroy || function(){};
		_addQueue(this);
	};
}();
