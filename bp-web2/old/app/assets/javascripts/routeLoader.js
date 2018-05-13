define(function(require) {
		var jsRoutesLoader = require('script!./test_scripts/jsroutes.js');
		console.log(jsRoutes)
		var MinorityRouter = {
			v: 1,
			router: jsRoutes
		}
		console.log(MinorityRouter);
		return MinorityRouter;
});