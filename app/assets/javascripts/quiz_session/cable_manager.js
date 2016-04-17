//= require action_cable

CableManager = {

  bootstrap: function() {
    this.setupCable()
    this.setupSubscriptions()
  },

  setupCable: function() {
    this.cable = ActionCable.createConsumer()
  },

  setupSubscriptions: function() {
    this.cable.subscriptions.create('QuizSessionChannel', {

      connected: function() {
        this.setupEvents()
      },

      setupEvents: function() {
        var _this = this
        $('body').on('c-editor-change', function(event, patchSet) {
          _this.perform('update_answer', patchSet)
        })
      }

    })
  }

}
