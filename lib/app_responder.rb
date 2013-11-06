# Responder used to handle flashes from create, update, delete methods
class AppResponder < ActionController::Responder
  include Responders::FlashResponder
  include Responders::HttpCacheResponder
end
