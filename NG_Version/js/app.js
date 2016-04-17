(function() {
    
    angular.module('Module_Main', ['door3.css']);   // door3.css is for using directive.css into templates
    
  
    // Main controller
    function CTRL_Main($scope, $rootScope) {

        this.word_list = ['word 1', 'word 2', 'word 3', 'word 4', 'word 5', 'word 6'];

        $scope.var1 = 'first value for var1';
        this.var2 = 'first value for var2';
        $rootScope.var5 = 'this is the master';
  
        this.fun1 = function() {
            $scope.var1 = 'var1 changed in fun 1';
            this.var2 = 'var2 changed';
            $rootScope.var5 = 'var 5 changed in fun 1';
        }

    }

    // Controller 1
    function CTRL_1($scope) {
        $scope.var3 = 'ini val var3';
        this.var4 = 'ini val var4';

        this.fun2 = function() {
            $scope.var3 = 'second val for var3';
            this.var4 = 'second val for var4';
            $scope.$parent.var1 = 'var1 changed in fun 2';
            $rootScope.var5 = 'var 5 changed in fun 2';
            // var2 is not accessible from here
        }
  
    }


    function getData($timeout, $q) {
      return function() {
        var defer = $q.defer()

        // simulated async function
        $timeout(function() { 
            if (Math.round(Math.random()))  { defer.resolve('data received!'); } 
            else                            { defer.reject('oh no an error! try again'); }
        }, 2000);

        return defer.promise
      }
    }




    function getData2($timeout, $q) {
      return function() {

        return $q(function(resolve, reject) {
            $timeout(function() { 
                if (Math.round(Math.random()))  { resolve('data received!'); } 
                else                            { reject('oh no an error! try again'); }
            }, 2000)        
        })
      }
    }

  
    // Assign the components to the module
    angular.module('Module_Main')
        .controller('CTRL_Main',    CTRL_Main)
        .controller('CTRL_1',       CTRL_1)
        .factory('getData2', getData2)
        .run(function(getData2) {
            console.log('Promise set at:', new Date());

            var promise = getData2()
                .then(function(string) {
                    console.log(string)

                }, function(error) {
                    console.error(error)
                })    
                .finally(function() {
                    console.log('Finished at:', new Date())
                })
        });


})();
