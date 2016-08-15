import Ember from 'ember';
import config from './config/environment';

const Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('add-pv-site');
  this.route('pv-sites');
  this.route('pv-site', {path: '/pv-site/:pvsite_id'});
});

export default Router;
