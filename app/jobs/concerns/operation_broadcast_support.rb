module OperationBroadcastSupport

  extend ActiveSupport::Concern

  def broadcast_operation(stream, operation, payload)
    ActionCable.server.broadcast stream, {
      op: operation,
      payload: payload
    }
  end

end
