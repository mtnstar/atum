import Ember from 'ember';
import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr(),
  country: DS.attr(),
  region: DS.attr(),
  lat: DS.attr(),
  lon: DS.attr(),
  asl: DS.attr(),
  timezone: DS.attr(),

  displayName: Ember.computed('name', function () {
    return this.get('name');
  })
});
