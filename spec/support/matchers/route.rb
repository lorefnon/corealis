RSpec::Matchers.define :match_action do |action_descriptor|
  match do |route|
    if action_descriptor.is_a? String
      action_descriptor = %w[controller action]
        .zip(action_descriptor.split('#'))
        .to_h
    end
    route.slice(:controller, :action).stringify_keys == action_descriptor
  end
end
