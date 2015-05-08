'use strict';

angular.module('minorityApp.TreeBuilderService', ['minorityApp.services'])
    .constant('MODULE_VERSION', '1.0.0')
    .value('defaults', {
        foo: 'bar'
    })

// 4. define a module component
    .factory('TreeBuilder', function(BPElemsFactory,BPSpacesFactory, BPSpaceElemsFactory) {


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



var builderFetch = function (bp, onSuccess) {
  var bpelems, spaces, spaceelems;
    bpelems = BPElemsFactory.query({ BPid: bp.id });
    spaces =  BPSpacesFactory.query({ BPid: bp.id });
    spaceelems = BPSpaceElemsFactory.query({ BPid: bp.id });

  /**
   * TREE BUILDER 
   */

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
};





 return { buildFetch: function(data,onSuccess) {
 	builderFetch(data, onSuccess);
 }

}











    });