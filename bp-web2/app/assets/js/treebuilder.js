'use strict';

var treeBuilderService = angular.module('minorityApp.TreeBuilderService', ['minorityApp.services'])
    .constant('MODULE_VERSION', '1.0.0')
    .value('defaults', {
        foo: 'bar'
    })

// 4. define a module component
treeBuilderService.factory('TreeBuilder', ['LaunchElemsFactory', 'LaunchSpacesFactory', 'LaunchSpaceElemsFactory', 'BPElemsFactory','BPSpacesFactory', 'BPSpaceElemsFactory',
  function(LaunchElemsFactory, LaunchSpacesFactory, LaunchSpaceElemsFactory, BPElemsFactory,BPSpacesFactory, BPSpaceElemsFactory) {


var builder = function (bp, data, data2,data3) {

    var isIsEnd = function (spElems) {
      _.forEach(spElems, function(val) {
         val.nodes = _.filter(spacesCopy, function(space){ return space.brick_front == val.id || space.brick_nested == val.id; });
      });
      _.forEach(spElems, function(tree) {
           _.forEach(tree.nodes, function(space) {
               space.space_elem = _.filter(spaceelemsCopy, function(spelem){ return spelem.space_owned == space.id; });
               isIsEnd(space.space_elem);
          });
      });
    };


    var bpelemsCopy = angular.copy(data);
    var spacesCopy = angular.copy(data2);
    var spaceelemsCopy = angular.copy(data3);


    bp.trees = _.forEach(bpelemsCopy, function(val) {
         val.nodes = _.sortBy(_.filter(spacesCopy, function(space){ return space.brick_front == val.id || space.brick_nested == val.id; }), function(em){ return em.order; });
    });
    _.forEach(bp.trees, function(tree) {

      var spaceFetch = function () {
        _.forEach(tree.nodes, function(space) {
           space.space_elem = _.sortBy(_.filter(spaceelemsCopy, function(spelem){ return spelem.space_owned == space.id; }), function(em){ return em.order; });
           isIsEnd(space.space_elem);
        });
      };

      spaceFetch();
      spaceFetch();
      spaceFetch();
      spaceFetch();
      spaceFetch();
    });
}


var launchBuilderFetch = function (bp, launch, cnPromise, onSuccess) {
  //console.log('launchBuilderFetch launched');
  var bpelems, spaces, spaceelems;
  console.log('cnPromise',cnPromise);

  cnPromise.$promise.then(function(cn) {
  //console.log(launch);
  var currentContainer = _.find(cn, function(d) { return d.launchId == launch.id});


if (currentContainer) {
    bpelems = currentContainer.elements;//LaunchElemsFactory.query({ launch_id: launch.id });
    spaces =  currentContainer.spaces;//LaunchSpacesFactory.query({ launch_id: launch.id });
    spaceelems = currentContainer.space_elements;//LaunchSpaceElemsFactory.query({ launch_id: launch.id });
    console.log('launchBuilderFetch',bpelems,spaces,spaceelems);

    builder(launch, bpelems, spaces, spaceelems);

        launch.frontSpaces = _.object(_.uniq(_.map(spaces, function(v) {
          return [v.brick_front,
                   _.filter(spaces, function(n){
                      return n.brick_front == v.brick_front;
                    })
                  ]})));
        launch.nestedSpaces = _.object(_.uniq(_.map(spaces, function(v) {
          return [v.brick_nested,
                   _.filter(spaces, function(n){
                      return n.brick_nested == v.brick_nested;
                    })
                  ]})));

          if (onSuccess != undefined) {
            onSuccess();
          }
} else {
    bpelems = LaunchElemsFactory.query({ launch_id: launch.id });
    spaces =  LaunchSpacesFactory.query({ launch_id: launch.id });
    spaceelems = LaunchSpaceElemsFactory.query({ launch_id: launch.id });
  bpelems.$promise.then(function(bpelems) {
    spaces.$promise.then(function(spaces) {
      spaceelems.$promise.then(function(spaceelems) {
        builder(launch, bpelems, spaces, spaceelems);

        launch.frontSpaces = _.object(_.uniq(_.map(spaces, function(v) {
          return [v.brick_front,
                   _.filter(spaces, function(n){
                      return n.brick_front == v.brick_front;
                    })
                  ]})));
        launch.nestedSpaces = _.object(_.uniq(_.map(spaces, function(v) {
          return [v.brick_nested,
                   _.filter(spaces, function(n){
                      return n.brick_nested == v.brick_nested;
                    })
                  ]})));

          if (onSuccess != undefined) {
            onSuccess();
          }
  });
  });
  });
}


  });
};



var builderFetch = function (bp, cnPromise, onSuccess) {
  var bpelems, spaces, spaceelems;

  var bpelems, spaces, spaceelems;
  cnPromise.$promise.then(function(cn) {
    var currentContainer = _.find(cn, function(d) { return d.processId == bp.id});

  if (currentContainer) {
    bpelems = currentContainer.elements;//LaunchElemsFactory.query({ launch_id: launch.id });
    spaces =  currentContainer.spaces;//LaunchSpacesFactory.query({ launch_id: launch.id });
    spaceelems = currentContainer.space_elements;//LaunchSpaceElemsFactory.query({ launch_id: launch.id });

        builder(bp, bpelems, spaces, spaceelems);

        bp.frontSpaces = _.object(_.uniq(_.map(spaces, function(v) {
          return [v.brick_front,
                   _.filter(spaces, function(n){
                      return n.brick_front == v.brick_front;
                    })
                  ]})));
        bp.nestedSpaces = _.object(_.uniq(_.map(spaces, function(v) {
          return [v.brick_nested,
                   _.filter(spaces, function(n){
                      return n.brick_nested == v.brick_nested;
                    })
                  ]})));

          if (onSuccess != undefined) {
            onSuccess();
          }


} else {
    bpelems = BPElemsFactory.query({ BPid: bp.id });
    spaces =  BPSpacesFactory.query({ BPid: bp.id });
    spaceelems = BPSpaceElemsFactory.query({ BPid: bp.id });

  bpelems.$promise.then(function(data) {
    spaces.$promise.then(function(data2) {
      spaceelems.$promise.then(function(data3) {
          builder(bp, data, data2, data3);

        bp.frontSpaces = _.object(_.uniq(_.map(spaces, function(v) {
          return [v.brick_front,
                   _.filter(spaces, function(n){
                      return n.brick_front == v.brick_front;
                    })
                  ]})));
        bp.nestedSpaces = _.object(_.uniq(_.map(spaces, function(v) {
          return [v.brick_nested,
                   _.filter(spaces, function(n){
                      return n.brick_nested == v.brick_nested;
                    })
                  ]})));

          if (onSuccess != undefined) {
            onSuccess();
          }
  });
  });
  });

  }

  });
};





 return {
  buildFetch: function(data, cnPromise, onSuccess) {
   	builderFetch(data, cnPromise, onSuccess);
  },
  launchBuildFetch: function(proc,session,cn, onSuccess) {
    if (session != undefined) {
      return launchBuilderFetch(proc,session, cn, onSuccess);
    } else { return null; }
  }
}




}]);
