'use strict';

angular.module('myApp.services', ['ngResource'])
  .factory('AngularIssues', function($resource){
    return $resource('http://10.10.10.21:port/MOAforIssuesTrackerApp-TrackerApp-context-root/relayservlet',
      {port: ':8011'},
      {number: '@number'},
      {getIssue: {method: 'GET', params: {number: 0}}}
    )
  })
  .value('version', '0.1');

/*
{ 'get':    {method:'GET'},
  'save':   {method:'POST'},
  'query':  {method:'GET', isArray:true},
  'remove': {method:'DELETE'},
  'delete': {method:'DELETE'} };

https://api.github.com/repos/angular/angular.js/issues/:number

  http://soa2admin2:8011/TrackerAppIssuesRestService/Issues
*/