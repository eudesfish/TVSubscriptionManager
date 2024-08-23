//import "bootstrap/dist/js/bootstrap"
//import "bootstrap/dist/css/bootstrap"
// application.js
//= require rails-ujs
//= require turbolinks
//= require_tree .

import "bootstrap"
import "bootstrap/dist/css/bootstrap.min.css";
import "../stylesheets/application"
import $ from 'jquery';
global.$ = global.jQuery = $;
import 'select2'
import Rails from "@rails/ujs"
Rails.start()

$(document).on('turbolinks:load', function(){
    $('.select2').select2();
});

import Turbolinks from "turbolinks"
Turbolinks.start()