'use strict';

var cachedService = angular.module('minorityApp.cachedService', ['minorityApp.services'])
    .constant('MODULE_VERSION', '1.0.0')
    .value('defaults', {
        foo: 'bar'
    })

// 4. define a module component
cachedService.factory('cachedService', ['LaunchElemsFactory', 'LaunchSpacesFactory', 'LaunchSpaceElemsFactory', 'BPElemsFactory','BPSpacesFactory', 'BPSpaceElemsFactory',
  function(LaunchElemsFactory, LaunchSpacesFactory, LaunchSpaceElemsFactory, BPElemsFactory,BPSpacesFactory, BPSpaceElemsFactory) {



$scope.loadLaunchesFromCache = function() {
      var launchesCache;
      var launchesCursosCache;
      // 1. create cursor and cache
      if ($scope.cacheFactory.get('launchesCache') == undefined) {
          $scope.cacheFactory.createCache('launchesCache',{storageMode: 'sessionStorage'}); }
      if ($scope.cacheFactory.get('launchesCursosCache') == undefined) {
          $scope.cacheFactory.createCache('launchesCursosCache',{storageMode: 'sessionStorage'}); }


      launchesCache = $scope.cacheFactory.get('launchesCache');
      console.log('launchesCursosCache', $scope.cacheFactory.get('launchesCursosCache'));
      launchesCursorCache = $scope.cacheFactory.get('launchesCursosCache');
      if (launchesCursorCache.get('updated') == undefined) {
      CacheFactory.get('launchesCursosCache').put('updated', 0) }
      if (launchesCache.get('launches') == undefined) {
        launchesCache.put('launches', []);
      }

      // 3. Make request
      return $http.get('/sessions/cached/'+launchesCursorCache.get('updated'))
              .then(function (resp) {
                console.log('  return $http.get(/sessions/cached/+launchesCursosCache.get(updated))', resp);
                // 4. Split C and D and apply C for new created resources
                var removedIds = _.map(resp.data.deltas.d, function(d) { return parseInt(d.resourceId) });
                var concatedProcess = launchesCache.get('launches').concat(resp.data.c);
                var finalizedProcess = _.filter(concatedProcess, function(c){ return !_.contains(removedIds, c.id) });
                launchesCache.put('launches', finalizedProcess);
                // 5. D for resource with ids that need to be removed
                launchesCache.put('launchesRemoved', resp.data.d)
                // 6. Put request to cache and update cursor
                launchesCursorCache.put('updated', Date.now());
                // 7. Return resource itself
                return launchesCache.get('launches');
              });


}

$scope.loadProcessesFromCache = function() {
      var processesCache;
      var processesCursosCache;
      // 1. create cursor and cache
        if ($scope.cacheFactory.get('processesCache') == undefined) {
            $scope.cacheFactory.createCache('processesCache',{storageMode: 'sessionStorage'}); }
        if ($scope.cacheFactory.get('processesCursosCache') == undefined) {
            $scope.cacheFactory.createCache('processesCursosCache',{storageMode: 'sessionStorage'}); }


      processesCache = $scope.cacheFactory.get('processesCache');
      console.log('processesCursosCache', $scope.cacheFactory.get('processesCursosCache'));
      processesCursorCache = $scope.cacheFactory.get('processesCursosCache');
      if (processesCursorCache.get('updated') == undefined) {
      CacheFactory.get('processesCursosCache').put('updated', 0) }
      if (processesCache.get('processes') == undefined) {
        processesCache.put('processes', []);
      }

      // 3. Make request
      return $http.get('/bprocesses/cached/'+processesCursorCache.get('updated'))
              .then(function (resp) {
                console.log('  return $http.get(/bprocesses/cached/+processesCursorCache.get(updated))', resp);
                // 4. Split C and D and apply C for new created resources
                var removedIds = _.map(resp.data.deltas.d, function(d) { return parseInt(d.resourceId) });
                var concatedProcess = processesCache.get('processes').concat(resp.data.c);
                var finalizedProcess = _.filter(concatedProcess, function(c){ return !_.contains(removedIds, c.id) });
                processesCache.put('processes', finalizedProcess);
                // 5. D for resource with ids that need to be removed
                processesCache.put('processesRemoved', resp.data.deltas.d)
                // 6. Put request to cache and update cursor
                processesCursorCache.put('updated', Date.now());
                // 7. Return resource itself
                return processesCache.get('processes');
              });

}




})
