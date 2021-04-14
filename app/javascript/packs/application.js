import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"

import $ from 'jquery';

window.$ = $;
window.jQuery = $;

import 'bootstrap-sass/assets/javascripts/bootstrap';
import "@fortawesome/fontawesome-free/css/all"

Rails.start()
Turbolinks.start()
