//= require diff_match_patch
//= require md5

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
      _this.handleEditorChange(e.target, e.originalEvent.srcElement.innerHTML)
    }, 100, {
      leading: true,
      trailing: true
    }))
  },

  handleEditorChange: function(el, content) {
    var patches = this.patchManager.patch_make(
      this.answerHistory.lastContent,
      content
    )
    this.answerHistory.lastContent = content
    var patchSet = {
      timestamp: Date.now(),
      patches: patches
    }
    this.answerHistory.patches.push(patchSet)
    $(el).trigger('c-editor-change', {
      quiz_session_id: $('meta[name="quiz-session-id"]').attr('content'),
      answer_id: $('.answer-edit-container').data('answer-id'),
      patch_set: patchSet,
      hash: md5(content)
    })
    this.historyField.val(JSON.stringify(this.answerHistory.patches))
  }

}

