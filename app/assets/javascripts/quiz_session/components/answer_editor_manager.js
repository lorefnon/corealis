//= require diff_match_patch

AnswerEditorManager = {

  bootstrap() {
    this.answerHistory = {
      initialContent: null,
      lastContent: null,
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
    }, 300, {
      leading: true,
      trailing: true
    }))
  },

  handleEditorChange: function(content) {
    if (
      this.answerHistory.initialContent &&
      this.answerHistory.lastContent
    ) {
      var patches = this.patchManager.patch_make(
        this.answerHistory.lastContent,
        content
      )
      this.answerHistory.patches.push(patches)
      this.historyField.val(JSON.stringify(this.answerHistory))
    } else {
      this.answerHistory.initialContent = content
      this.answerHistory.lastContent = content
    }
  }

}

