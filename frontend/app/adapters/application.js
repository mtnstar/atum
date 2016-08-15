import Ember from 'ember';
import DS from 'ember-data';

export default DS.RESTAdapter.extend({
  host: 'http://localhost:3000',
  namespace: 'api',
  pathForType: function (type) {
    return Ember.String.pluralize(Ember.String.underscore(type));
  }
});
