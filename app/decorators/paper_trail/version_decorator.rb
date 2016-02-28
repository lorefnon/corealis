require 'active_record/immutable'

class PaperTrail::VersionDecorator < Draper::Decorator

  delegate_all

  extend Memoist
  include ActiveRecord::Immutable

  def committer_admin_path
    unless committer_info.blank?
      h.send("admin_#{committer_type.underscore}_path", committer_id)
    end
  end

  def committer_admin_link
    if self[:whodunnit]
      h.link_to self[:whodunnit], committer_admin_path
    end
  end

  def committer_id
    committer_info.last
  end

  def committer_type
    committer_info.first
  end

  def committer
    unless committer_info.blank?
      committer_type.constantize.find committer_id
    end
  end
  memoize :committer

  private

  def committer_info
    return [] if self[:whodunnit].blank?
    self[:whodunnit].split(':')
  end

end
