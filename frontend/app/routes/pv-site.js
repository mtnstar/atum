import Ember from 'ember';

export default Ember.Route.extend({
  model() {
    return {
      label: 'PV Site 1',
      max_production: 200
    };
  }
});
