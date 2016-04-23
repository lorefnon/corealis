//= require diff_match_patch

AnswerPreviewManager = {

  bootstrap: function() {
    this.containerEl = $('.answer-details-container')
    this.lastContent = ''
    this.patchManager = new diff_match_patch()
    return this
  },

  replay: function(patches) {
    var ts = null
    var _this = this
    if (_.isEmpty(patches)) return
    var refTimeStamp = patches[0].timestamp
    this.scheduleNext(patches, refTimeStamp)
  },

  scheduleNext: function(patches, refTimeStamp) {
    var _this = this
    var patchSet = patches.shift()
    if (! patchSet) return
    var timeoutDuration = (patchSet.timestamp - refTimeStamp)/3
    setTimeout(function() {
      _this.applyPatches(patchSet.patches)
      _this.scheduleNext(patches, patchSet.timestamp)
    }, timeoutDuration)
  },

  applyPatches: function(patches) {
    var result = this.patchManager.patch_apply(patches, this.lastContent)
    this.lastContent = result[0]
    this.containerEl.html(this.lastContent)
  }

}
