import Rails from '@rails/ujs'
import Turbolinks from 'turbolinks'

import $ from 'jquery';

window.$ = $;
window.jQuery = $;

import 'bootstrap-sass/assets/javascripts/bootstrap';
import '@fortawesome/fontawesome-free/css/all'

require('packs/book/read_more')
require('packs/book/cart')
require('packs/catalog/pagination')
require('packs/settings/remove_account')
require('packs/flash')

Rails.start()
Turbolinks.start()
