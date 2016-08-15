import DS from 'ember-data';

export default DS.RESTSerializer.extend({
  normalizeResponse(store, primaryModelClass, payload, id, requestType) {
    if (payload.locations && payload.locations.length) {
      payload.locations.forEach(function (location) {
        location.id = Math.round((new Date()).getTime() * Math.random() * 10000) % 10000;
      });
    }

    return this._super(store, primaryModelClass, payload, id, requestType);
  }
});
