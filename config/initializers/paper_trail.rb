PaperTrail::Version.module_eval do
  def whodunnit
    return nil if self[:whodunnit].blank?
    target_klass, target_id = self[:whodunnit].split(':')
    eval(target_klass).find(target_id)
  end
end
