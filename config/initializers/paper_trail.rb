PaperTrail::Version.class_eval do

  def whodunnit
    return nil if self[:whodunnit].blank?
    target_klass, target_id = self[:whodunnit].split(':')
    target_klass.constantize.find target_id
  end

end
