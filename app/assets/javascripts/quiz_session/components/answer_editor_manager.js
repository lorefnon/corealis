//= require diff_match_patch

AnswerEditorManager = {

  bootstrap: function() {
    this.answerHistory = {
      initialContent: '',
      lastContent: '',
      patches: []
    }
    this.patchManager = new diff_match_patch()
    this.historyField = $('.answer-container form #answer_history')
    this.setupTrixChangeHandler()
  },

  setupTrixChangeHandler: function() {
    var _this = this
    $('body').on('trix-change', _.debounce(function(e) {
      _this.handleEditorChange(e.originalEvent.srcElement.innerHTML)
    }, 100, {
      leading: true,
      trailing: true
    }))
  },

  handleEditorChange: function(content) {
    var patches = this.patchManager.patch_make(
      this.answerHistory.lastContent,
      content
    )
    this.answerHistory.lastContent = content
    this.answerHistory.patches.push({
      timestamp: Date.now(),
      patches: patches
    })
    this.historyField.val(JSON.stringify(this.answerHistory.patches))
  }

}

