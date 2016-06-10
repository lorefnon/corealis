//= require ./application
//= require trix
//= require toastr
//= require lodash
//= require_tree ./quiz_session/components
//= require quiz_session/cable_manager

$(function() {
  AnswerEditorManager.bootstrap()
  CableManager.bootstrap()
})
