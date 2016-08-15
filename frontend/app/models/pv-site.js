import DS from 'ember-data';

export default DS.Model.extend({
  label: DS.attr(),
  max_production: DS.attr(),
  location: DS.attr(),
  direction: DS.attr()
});
